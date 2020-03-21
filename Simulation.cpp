#include "Simulation.h"
using namespace std;

Simulator::Simulator(char* filename){
	memset(this, 0, sizeof(Simulator));
	elf = new ElfReader(filename, NULL);
	mainMemory = new Memory(MEMSIZE);
}

void Simulator::bubble(STAGE_NAME stage){
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
}

void Simulator::load_memory(){
	// 没错 就是简单的线性映射(转换？)
	// Load code segment
	fseek(elf->file, elf->cadr, 0);
	fread(mainMemory->memory + elf->cvadr, 1, elf->csize, elf->file);
	// Load data segment
	fseek(elf->file, elf->dadr, 0);
	fread(mainMemory->memory + elf->dvadr, 1, elf->dsize, elf->file);

	//设置入口地址
	PC = elf->entry;
	//设置全局数据段地址寄存器
	reg[REG_GP] = elf->gp;
	reg[REG_SP] = MEMSIZE / 2; //栈基址 （sp寄存器）
}

// 针对数据冒险，已经：
// 在EX加入了旁路单元进行转发	  √
// 在ID加入了冒险检测单元stall LU 	√
// 针对控制冒险，

void Simulator::simulate(){
	//结束PC的设置
	int end=(int)elf->endPC;
	while(PC!=end){

		// 所有控制位需要恢复默认值
		memset(&IFID_, 0, sizeof(IFID_));
		memset(&IDEX_, 0, sizeof(IDEX_));
		memset(&EXMEM_, 0, sizeof(EXMEM_));
		memset(&MEMWB_, 0, sizeof(MEMWB_));
		
		// 运行
		WB();	// Write Back First?
		IF();
		ID();
		EX();
		MEM();
		
		//更新中间寄存器
		if (stall[STAGE_IF]){
			PC -= 4;		// 本次PC保持不变
			stall[STAGE_IF]--;
		}
		if(!stall[STAGE_ID])
			IFID = IFID_;
		else stall[STAGE_ID]--;
		if(!stall[STAGE_EX])
			IDEX = IDEX_;
		else stall[STAGE_EX]--;
		EXMEM=EXMEM_;
		MEMWB=MEMWB_;

        if(exit_flag==1)
            break;
		
        // reg[REG_ZERO] = 0;	//一直为零, 不必要 因为禁止对该寄存器进行更改...
	}
	fprintf(stdout, "Program finished, halting... > <\n");
}

//取指令
void Simulator::IF(){
	// if(IFID.stall) return;

	//write IFID_
	IFID_.inst = mainMemory->ReadMem(PC, 4);
	PC += 4;
	IFID_.PC = PC; // 前传更新后的PC (PC+1)
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

	// complete Branch instruction PC change 
	// 现在的跳转策略: Always not taken, 在MEM阶段修正
	// bubble IF ID EX
	if(Branch){
		PC = EXMEM.PC;		// next pc
		bubble(STAGE_IF);
		bubble(STAGE_ID);
		bubble(STAGE_EX);
	}

	//read / write memory
	if(ReadLen)
		Mem_read = mainMemory->ReadMem(ALU_out, ReadLen);
	if(WriteLen)
		mainMemory->WriteMem(ALU_out, WriteLen, Reg_Rt);

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
	REG ALU_out = MEMWB_.ALU_out;
	REG Mem_read = MEMWB_.Mem_read;

	uint Reg_dst = MEMWB.Reg_dst;

	if(RegWrite && Reg_dst)	//write reg
		reg[Reg_dst] = MemtoReg ? Mem_read : ALU_out;
}

REG_SIGNED Simulator::Syscall(SYSCALL_NAME type, REG arg){
	REG_SIGNED ret = 0;
	switch(type){
		case SYSCALL_EXIT:
			exit_flag = true;
			break;
		case SYSCALL_PRINTC:
			fprintf(stdout, "%c", (char)arg);
			break;
		case SYSCALL_PRINTD:
			fprintf(stdout, "%d", (int)arg);
			break;
		case SYSCALL_GETC:
			ret = getchar();
			break;
		case SYSCALL_GETD:
			scanf("%lld", &ret);
			break;
		default:
			fprintf(stderr, "Requested syscall %02d not implemented T T...", type);
			assert(false);
	}
	return ret;
}