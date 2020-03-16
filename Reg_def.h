typedef unsigned long long REG;

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

	char Ctrl_M_Branch;
	char Ctrl_M_MemWrite;
	char Ctrl_M_MemRead;

	char Ctrl_WB_RegWrite;
	char Ctrl_WB_MemtoReg;

};

struct MEM_WB{
	unsigned int Mem_read;
	REG ALU_out;
	int Reg_dst;
		
	char Ctrl_WB_RegWrite;
	char Ctrl_WB_MemtoReg;
};