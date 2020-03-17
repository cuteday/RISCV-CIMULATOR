#include "Simulation.h"

//译码
void Simulator::ID()
{
	// 从上级（还未被本次时钟周期更新的）流水线寄存器中取出指令
	Instruction inst=IFID.inst;
	int EXTop=0;
	unsigned int EXTsrc=0;

    char RegDst = 0;    // RegDst(0-31?) Valid if RegWrite
    char ALUop = 0;     // add / sub / mul / div / 
    char ALUSrc = 0;    // ALU op2 from rt? / imm?
    char Branch = 0;    //
    char MemRead = 0;   //
    char MemWrite = 0;  //
    char RegWrite = 0;  //
    char MemtoReg = 0;  //
    //....

	if(inst.OP==OP_R)   // Func3, Func7
	{
		if(inst.fuc3==F3_ADD&&inst.fuc7==F7_ADD)    // ADD
		{
            RegDst = 1;
            RegWrite = true;
            ALUSrc = 0;
        }
        else
		{
		   
		}
	}
	else if(inst.OP==OP_I)
    {
        if(inst.fuc3==F3_ADDI)
        {
            
        }
        else
        {
           
        }
    }
    else if(inst.OP==OP_SW)
    {
        if(inst.fuc3==F3_SB)
        {
           
        }
        else
        {
           
        }
    }
    else if(inst.OP==OP_LW)
    {
        if(inst.fuc3==F3_LB)
        {
			
        }
        else
        {

        }
    }
    else if(inst.OP==OP_BEQ)
    {
        if(inst.fuc3==F3_BEQ)
        {
			  
        }
        else
        {
           
        }
    }
    else if(inst.OP==OP_JAL)
    {
        
    }
    else
    {
		
    }

	//write IDEX_
	IDEX_.Rd=rd;
	IDEX_.Rt=rt;
	IDEX_.Imm=ext_signed(EXTsrc,EXTop);
	//...

	IDEX_.Ctrl_EX_ALUOp=ALUop;
    IDEX_.Ctrl_EX_ALUSrc = ALUSrc;
    IDEX_.Ctrl_EX_RegDst = RegDst;

    IDEX_.Ctrl_M_Branch = Branch;
    IDEX_.Ctrl_M_MemWrite = MemWrite;
    IDEX_.Ctrl_M_MemRead = MemRead;

    IDEX_.Ctrl_WB_RegWrite = RegWrite;
    IDEX_.Ctrl_WB_MemtoReg = MemtoReg;
    //....
}

