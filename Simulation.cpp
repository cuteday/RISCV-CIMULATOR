#include "Simulation.h"
using namespace std;

Simulator::Simulator(char* filename, bool enable_cache_){
	memset(this, 0, sizeof(Simulator));
	fprintf(stdout, "Simulator built for %s... ^ ^ \n", filename);

	logger = new Logger();
	predictor = new BranchPredictor();
	elf = new ElfReader(filename);
	mainMemory = new Memory(MEMSIZE);
	enable_cache = enable_cache_;

	if(enable_cache)
		storage = build_cache(cfg_cache_default, mainMemory);
	else
		storage = mainMemory;
}

int Simulator::ExecuteTime(OP_NAME op){
	int cycles;
	switch (op){
	case OP_MUL:
	case OP_DIV:
	case OP_REM:
	case OP_MULH:
		cycles = 3;
		break;
	case OP_MULW:
		cycles = 2;
		break;
	default:
		cycles = 1;
	}
	return cycles;
}

void Simulator::stall(STAGE_NAME stage){
	assert(0 <= stage && stage < NUM_STAGES);
	if(state[stage]!=REG_BUBBLE)
		state[stage] = REG_STALL;
}

void Simulator::bubble(STAGE_NAME stage){
	// Corner case:
	// 如果Mem阶段因为跳转发生了BUBBLE
	// 但是Jxx的下1/2条(DEC/EXEC)中含有导致STALL的指令
	// 那么BUBBLE会和STALL冲突
	// BUBBLE会覆盖STALL.
	switch (stage){
	case STAGE_IF:
		memset(&IFID_, 0, sizeof(IFID));
		break;
	case STAGE_ID:
		memset(&IDEX_, 0, sizeof(IDEX));
		break;
	case STAGE_EX:
		memset(&EXMEM_, 0, sizeof(EXMEM));
		break;
	default:
		fprintf(stderr, "Bubble not expected > <\n");
		assert(false);
		break;
	}
	state[stage] = REG_BUBBLE;
}

void Simulator::simulate(){
	fprintf(stdout, "Starting simulation...\n\n");
	// 加载可执行文件
	mainMemory->Loader(elf->file, elf->phdrs, elf->mem_offset);
	//设置入口地址
	PC = elf->entry;
	//设置全局数据段地址寄存器
	reg[REG_GP] = elf->gp;
	reg[REG_SP] = MEMSIZE / 2 + mainMemory->offset; //栈基址 （sp寄存器）
	DEBUG(DEBUG_V, "Executable loaded into memory...\n");

	int end = (int)elf->endPC;
	while(PC != end + 1){

		DEBUG( DEBUG_P, "\n----------- Pipelined: New cycle #%d -----------\n\n", ++cycles);

		// 所有控制位需要恢复默认值
		memset(&IFID_, 0, sizeof(IFID_));
		memset(&IDEX_, 0, sizeof(IDEX_));
		memset(&EXMEM_, 0, sizeof(EXMEM_));
		memset(&MEMWB_, 0, sizeof(MEMWB_));
		
		// 运行
		WB();	// Write Back Reg before Reg Read...
		IF();
		ID();
		EX();
		MEM();
	
		//更新中间寄存器
		if (state[STAGE_IF] == REG_STALL)
			PC -= 4;		// 本次PC保持不变
		if(state[STAGE_ID] != REG_STALL)
			IFID = IFID_;
		if(state[STAGE_EX] != REG_STALL)
			IDEX = IDEX_;
		EXMEM=EXMEM_;
		MEMWB=MEMWB_;

		for (int i = 0; i < NUM_STAGES;i++)
			state[i] = REG_NORMAL;

		if (exit_flag == 1)
			break;

		SingleStep();
		// reg[REG_ZERO] = 0;	//一直为零, 不必要 因为禁止对该寄存器进行更改...
	}
	fprintf(stdout, "\nProgram finished. Halting... > <\n");
	storage->printStatisticsAll();
	logger->printResults();
}

//取指令
void Simulator::IF(){
	// if(IFID.stall) return;
	// IMPORTANT: RISC-V中的相对跳转是对PC而不是PC+4

	DEBUG(DEBUG_P, "IF :\tFetching instruction at PC 0x%08x\n", PC);

	storage->Read(PC, 4, &IFID_.inst, cycles);

	IFID_.PC = PC; // 前传更新前的PC
	PC += 4;
}

//访问存储器
void Simulator::MEM(){

	//read EXMEM
	REG ALU_out = EXMEM.ALU_out;	// Address 
	REG Reg_Rt = EXMEM.Reg_Rt;		// operand
	REG Mem_read;
	uint ReadLen = EXMEM.Ctrl_M_MemRead;
	uint WriteLen = EXMEM.Ctrl_M_MemWrite;
	char Branch = EXMEM.Ctrl_M_Branch;

	if(ReadLen){
		DEBUG(DEBUG_P, "MEM:\tReading %d byte at vaddr 0x%08x\n", ReadLen, ALU_out);
			storage->Read(ALU_out, ReadLen, &Mem_read, cycles, true);
	}
	if(WriteLen){
		DEBUG(DEBUG_P, "MEM:\tWriting %d byte at vaddr 0x%08x, value 0x%-8x\n", WriteLen, ALU_out, Reg_Rt);
			storage->Write(ALU_out, WriteLen, Reg_Rt, cycles);

	}
	//write MEMWB_
	MEMWB_.Mem_read = Mem_read;
	MEMWB_.ALU_out = ALU_out;
	MEMWB_.Reg_dst = EXMEM.Reg_dst;
	MEMWB_.Ctrl_WB_RegWrite = EXMEM.Ctrl_WB_RegWrite;
	MEMWB_.Ctrl_WB_MemtoReg = EXMEM.Ctrl_WB_MemtoReg;
}


//写回
void Simulator::WB(){
	// 本阶段已经无需考虑冒险和旁路
	// read MEMWB
	char RegWrite = MEMWB.Ctrl_WB_RegWrite;
	char MemtoReg = MEMWB.Ctrl_WB_MemtoReg;
	REG ALU_out = MEMWB.ALU_out;
	REG Mem_read = MEMWB.Mem_read;

	uint Reg_dst = MEMWB.Reg_dst;

	if(RegWrite && Reg_dst){	//write reg
		REG write_val = MemtoReg ? Mem_read : ALU_out;
		reg[Reg_dst] = write_val;
		DEBUG(DEBUG_P, "WB :\tWriting value 0x%016llx to reg %s\n", write_val, reg_names[Reg_dst]);
	}
}

REG_SIGNED Simulator::Syscall(SYSCALL_NAME type, REG arg){

	DEBUG( DEBUG_V, "Transfer control to kernel: Syscall\n");
	DEBUG( DEBUG_V, "Syscall %s, ARG0: %lld\n", scall_names[type], arg);
	logger->numCycles += 5;

	REG_SIGNED ret = 0;
	switch(type){
		case SYSCALL_EXIT:
			exit_flag = true;
			break;
		case SYSCALL_PRINTC:
			fprintf(stdout, "%c", (char)arg);fflush(stdout);
			break;
		case SYSCALL_PRINTD:
			fprintf(stdout, "%d", (int)arg);fflush(stdout);
			break;
		case SYSCALL_PRINTS:
			fprintf(stdout, "%s", mainMemory->memory + mainMemory->Translate(arg));fflush(stdout);
			break;
		case SYSCALL_GETC:
			ret = getchar();
			break;
		case SYSCALL_GETD:
			fscanf(stdin, "%lld", &ret);
			break;
		default:
			fprintf(stderr, "Requested syscall %02d not implemented T T...", type);
			assert(false);
	}
	return ret;
}

void Simulator::SingleStep(){
	if(!debug_on[DEBUG_D])
		return;
	char c = 'N';
	bool print_reg = false, dump_mem = false;

	while(true){
		puts("");
		if(!print_reg)fprintf(stdout, "Type 'r' to print REG info, ");
		if(!dump_mem)fprintf(stdout, "Type 'd' to dump memory, ");
		fprintf(stdout, "Type ENTER to CONTINUE \n");

		while(c!='\n'&&(c!='r'||print_reg)&&(c!='d'||dump_mem)){
			c = getchar();fflush(stdin);
		}
		if(c=='\n')
			break;
		else if(c=='r'){
			reg.printInfo();
			print_reg = true;
		}
		else if(c=='d'){
			mainMemory->DumpMem();
			dump_mem = true;
		}
		c = 'N';
	}
}