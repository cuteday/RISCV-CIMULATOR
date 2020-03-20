#ifndef REG_DEF
#define REG_DEF
#include "Utility.h"

typedef unsigned long long REG;
typedef long long REG_SIGNED;

// 流水线寄存器 * 4

struct IF_ID{
	uint inst;
	int PC;
  uint stall;   // IF 是否处于STALL状态...?
};

struct ID_EX{	
	uint Rd,Rt,Rs;	
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

  uint stall;     // ID 是否处于STALL状态...?
};

struct EX_MEM{
	int PC;
	uint Reg_dst;
	REG ALU_out;
	bool Zero;
	REG Reg_Rt;

	char Ctrl_M_Branch;		// whether to branch
	char Ctrl_M_MemWrite;	// indicates the length to write
	char Ctrl_M_MemRead;	// indicates the length to read

	char Ctrl_WB_RegWrite;	
	char Ctrl_WB_MemtoReg;

};

struct MEM_WB{
  REG ALU_out;
  REG Mem_read;
	uint Reg_dst;
		
	char Ctrl_WB_RegWrite;
  char Ctrl_WB_MemtoReg;
};

enum REG_NAME {
  REG_ZERO = 0,
  REG_RA = 1,
  REG_SP = 2,
  REG_GP = 3,
  REG_TP = 4,
  REG_T0 = 5,
  REG_T1 = 6,
  REG_T2 = 7,
  REG_S0 = 8,
  REG_S1 = 9,
  REG_A0 = 10,
  REG_A1 = 11,
  REG_A2 = 12,
  REG_A3 = 13,
  REG_A4 = 14,
  REG_A5 = 15,
  REG_A6 = 16,
  REG_A7 = 17,
  REG_S2 = 18,
  REG_S3 = 19,
  REG_S4 = 20,
  REG_S5 = 21,
  REG_S6 = 22,
  REG_S7 = 23,
  REG_S8 = 24,
  REG_S9 = 25,
  REG_S10 = 26,
  REG_S11 = 27,
  REG_T3 = 28,
  REG_T4 = 29,
  REG_T5 = 30,
  REG_T6 = 31,
};

#endif