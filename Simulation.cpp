#include "Simulation.h"
using namespace std;



Simulator::Simulator(char* filename){
	memset(this, 0, sizeof(Simulator));
	elf = new ElfReader(filename, NULL);
}

int Simulator::ext_signed(unsigned int src, int bit){
	return 0; 
}
//获取指定位
unsigned int Simulator::getbit(int s, int e){
	return 0;
}
unsigned int Simulator::getbit(unsigned inst, int s, int e){
	return 0;
}


void Simulator::load_memory(){
	// Load code segment
	fseek(elf->file, elf->cadr, 0);
	fread(memory + elf->cvadr, 1, elf->csize, elf->file);
	// Load data segment
	fseek(elf->file, elf->dadr, 0);
	fread(memory + elf->dvadr, 1, elf->dsize, elf->file);

	//设置入口地址
	PC=elf->entry>>2;
	//设置全局数据段地址寄存器
	reg[3]=elf->gp;
	reg[2]=MAX/2;//栈基址 （sp寄存器）
}



void Simulator::simulate()
{
	//结束PC的设置
	int end=(int)elf->endPC/4-1;
	while(PC!=end)
	{
		//运行
		IF();
		ID();
		EX();
		MEM();
		WB();

		//更新中间寄存器
		IFID=IFID_;
		IDEX=IDEX_;
		EXMEM=EXMEM_;
		MEMWB=MEMWB_;

        if(exit_flag==1)
            break;

        reg[0]=0;//一直为零
	}
}

//取指令
void Simulator::IF()
{
	//write IFID_
	IFID_.inst=memory[PC];

	PC=PC+1;
	IFID_.PC=PC;	// 前传更新后的PC (PC+1)
}

//译码
void Simulator::ID()
{
	//Read IFID
	unsigned int inst=IFID.inst;
	int EXTop=0;
	unsigned int EXTsrc=0;

	char RegDst,ALUop,ALUSrc;
	char Branch,MemRead,MemWrite;
	char RegWrite,MemtoReg;

	rd=getbit(inst,7,11);
	fuc3=getbit(inst,0,0);
	//....


	if(OP==OP_R)
	{
		if(fuc3==F3_ADD&&fuc7==F7_ADD)
		{
            EXTop=0;
			RegDst=0;
			ALUop=0;
			ALUSrc=0;
			Branch=0;
			MemRead=0;
			MemWrite=0;
			RegWrite=0;
			MemtoReg=0;
		}
		else
		{
		   
		}
	}
	else if(OP==OP_I)
    {
        if(fuc3==F3_ADDI)
        {
            
        }
        else
        {
           
        }
    }
    else if(OP==OP_SW)
    {
        if(fuc3==F3_SB)
        {
           
        }
        else
        {
           
        }
    }
    else if(OP==OP_LW)
    {
        if(fuc3==F3_LB)
        {
			
        }
        else
        {

        }
    }
    else if(OP==OP_BEQ)
    {
        if(fuc3==F3_BEQ)
        {
			  
        }
        else
        {
           
        }
    }
    else if(OP==OP_JAL)
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
	//....

}

//执行
void Simulator::EX()
{
	//read IDEX
	int temp_PC=IDEX.PC;
	char RegDst=IDEX.Ctrl_EX_RegDst;
	char ALUOp=IDEX.Ctrl_EX_ALUOp;

	//Branch PC calulate
	//...

	//choose ALU input number
	//...

	//alu calculate
	int Zero;
	REG ALUout;
	switch(ALUOp){
	default:;
	}

	//choose reg dst address
	int Reg_Dst;
	if(RegDst)
	{

	}
	else
	{

	}

	//write EXMEM_
	EXMEM_.ALU_out=ALUout;
	EXMEM_.PC=temp_PC;
    //.....
}

//访问存储器
void Simulator::MEM()
{
	//read EXMEM

	//complete Branch instruction PC change

	//read / write memory

	//write MEMWB_
}


//写回
void Simulator::WB()
{
	//read MEMWB

	//write reg
}