#include "Simulation.h"

//执行
void Simulator::EX()
{
	//read ID_EX
	OP_NAME op_name = IDEX.inst;

	char Branch = IDEX.Ctrl_M_Branch;
	char RegDst = IDEX.Ctrl_EX_RegDst;
	char RegWrite = IDEX.Ctrl_WB_RegWrite;
	int Imm = IDEX.Imm;
	REG_SIGNED inp1, inp2;
	REG_SIGNED Reg_Rs = IDEX.Reg_Rs, Reg_Rt = IDEX.Reg_Rt;
	int Reg_PC = IDEX.PC;
	

	//Branch PC calulate
	//...

	// choose ALU input operands
	// THIS is a data bypass - DATA HAZARD 
	if(MEMWB.Ctrl_WB_RegWrite && MEMWB.Reg_dst){
		if(MEMWB.Reg_dst == IDEX.Rs)
			Reg_Rs = MEMWB.Ctrl_WB_MemtoReg? MEMWB.Mem_read : MEMWB.ALU_out;	// 可能来自ALU或内存
		if(MEMWB.Reg_dst == IDEX.Rt && !IDEX.Ctrl_EX_ALUSrc)
			Reg_Rt = MEMWB.Ctrl_WB_MemtoReg? MEMWB.Mem_read : MEMWB.ALU_out;	// 操作数确实来自Rt...
	}	// 顺序不能变: EXMEM的结果更新
	if(MEMWB.Ctrl_WB_RegWrite && EXMEM.Reg_dst){
		// 这是ALU阶段的结果, 不是内存读取, 不需要stall...
		if(!EXMEM.Ctrl_WB_MemtoReg){
			if(EXMEM.Reg_dst == IDEX.Rs)
				Reg_Rs = EXMEM.ALU_out;		// 就是刚出炉的ALU结果啦
			if (EXMEM.Reg_dst == IDEX.Rt && !IDEX.Ctrl_EX_ALUSrc)
				Reg_Rt = EXMEM.ALU_out;	
		}
		// else :Load Use Harzard, need Stall #1
		// Detected in ID
		// bubble EX,  stall ID, IF

	}
	inp1 = Reg_Rs;
	inp2 = IDEX.Ctrl_EX_ALUSrc ? Imm : Reg_Rt;	// choose Imm when ALUSrc == 1

	//alu calculate
	int Zero;
	REG ALUout;

	switch(op_name){
		case OP_ADD:
		case OP_ADDI:
			ALUout = inp1 + inp2;
			break;
		case OP_MUL:
			ALUout = inp1 * inp2;
			break;
		case OP_SUB:
			ALUout = inp1 - inp2;
			break;	
		case OP_SLL:
		case OP_SLLI:
			ALUout = inp1 << (inp2 & 0x3f);
			break;
		case OP_MULH:
			ALUout = calc_mulh(inp1, inp2);
			break;
		case OP_SLT:
		case OP_SLTI:
			ALUout = inp1 < inp2;
			break;
		case OP_XOR:
		case OP_XORI:
			ALUout = inp1 ^ inp2;
			break;
		case OP_DIV:
			ALUout = inp1 / inp2;
			break;
		case OP_SRL:	// logical shift
		case OP_SRLI:
			ALUout = REG(inp1) >> (inp2 & 0x3f);
			break;
		case OP_SRA:	// arithmetic shift
		case OP_SRAI:
			ALUout = inp1 >> (inp2 & 0x3f);
			break;
		case OP_OR:		// 奥里小精灵♪
		case OP_ORI:
			ALUout = inp1 | inp2;
			break;
		case OP_REM:
			ALUout = inp1 % inp2;
			break;
		case OP_AND:
		case OP_ANDI:
			ALUout = inp1 & inp2;
			break;
		// R series and some I insts end here...

		case OP_ADDIW:
			ALUout = REG_SIGNED(int(inp1 + inp2));
			break;

		case OP_LB:		
		case OP_LH:
		case OP_LW:
		case OP_LD:
		case OP_SB:
		case OP_SH:
		case OP_SW:
		case OP_SD:
			// mem length assigned when decode 
			ALUout = inp1 + inp2;
			break;

		case OP_LUI:
			ALUout = Imm << 12;
			break;

		case OP_AUIPC:
			ALUout = Reg_PC + (Imm << 12);
			break;

		// Control Transfer ops starts here /!
		case OP_JAL:
			ALUout = Reg_PC;
			Reg_PC = Reg_PC + Imm;
			break;
		case OP_JALR:
			ALUout = Reg_PC;
			Reg_PC = Reg_Rs + Imm;
			break;

		case OP_BEQ:
			Branch &= inp1 == inp2;
			Reg_PC += Imm;
			break;
		case OP_BNE:
			Branch &= inp1 != inp2;
			Reg_PC += Imm;
			break;
		case OP_BLT:
			Branch &= inp1 < inp2;
			Reg_PC += Imm;
			break;
		case OP_BGE:
			Branch &= inp1 > inp2;
			Reg_PC += Imm;
			break;

		case OP_ECALL:
			Syscall((SYSCALL_NAME)Reg_Rs, Reg_Rt);
			break;

		case OP_NOP:
			// 这是bubble的删减片段
			break;

		default:
			fprintf(stderr, "这个错误本不该出现的...\n");
			assert(op_name != OP_INVALID);
			assert(false);
	}

	//write EXMEM_
	EXMEM_.ALU_out=ALUout;
	EXMEM_.PC = Reg_PC;
	EXMEM_.Reg_dst = RegDst ? IDEX.Rt : IDEX.Rd;
	EXMEM_.Reg_Rt = Reg_Rt;	// 下一步可能Rt写入内存...

	EXMEM_.Ctrl_M_Branch = Branch;
	EXMEM_.Ctrl_M_MemRead = IDEX.Ctrl_M_MemRead;
	EXMEM_.Ctrl_M_MemWrite = IDEX.Ctrl_M_MemWrite;
	EXMEM_.Ctrl_WB_RegWrite = IDEX.Ctrl_WB_RegWrite;
	EXMEM_.Ctrl_WB_MemtoReg = IDEX.Ctrl_WB_MemtoReg;

	//.....
}
