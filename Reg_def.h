#ifndef REG_DEF
#define REG_DEF
#include "Utility.h"

typedef unsigned long long REG;
typedef long long REG_SIGNED;

// 流水线寄存器 * 4

struct IF_ID{
	unsigned int inst;
	int PC;
};

struct ID_EX{	
	int Rd,Rt;	
	int PC;
	int Imm;			// 立即数内容
	REG Reg_Rs,Reg_Rt;	// 操作数寄存器内容
	OP_NAME inst;		// 投机取巧的实际指令> < 

	// control bit * 8
	char Ctrl_EX_ALUSrc;
	char Ctrl_EX_ALUOp;
	char Ctrl_EX_RegDst;

	char Ctrl_M_Branch;
	char Ctrl_M_MemWrite;
	char Ctrl_M_MemRead; 

	char Ctrl_WB_RegWrite;
	char Ctrl_WB_MemtoReg;

};

struct EX_MEM{
	int PC;
	int Reg_dst;
	REG ALU_out;
	int Zero;
	REG Reg_Rt;

	char Ctrl_M_Branch;		// whether to branch
	char Ctrl_M_MemWrite;	// indicates the length to write
	char Ctrl_M_MemRead;	// indicates the length to read

	char Ctrl_WB_RegWrite;	
	char Ctrl_WB_MemtoReg;

};

struct MEM_WB{
	REG Mem_read;
	REG ALU_out;
	int Reg_dst;
		
	char Ctrl_WB_RegWrite;
	char Ctrl_WB_MemtoReg;
};

#endif