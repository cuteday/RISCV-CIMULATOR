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
unsigned int Simulator::getbit(unsigned int inst, int s, int e){
	assert(s < 32 && e < 32);
	unsigned int l, r;
	l = (1 << s) - 1;
	r = (1 << e) - 1;
	r += 1 << e;
	return (inst & (l ^ r)) >> s;
}


void Simulator::load_memory(){
	// 没错 就是简单的线性映射(转换？)
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
		// 运行
		// 倒着执行?
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

//执行
void Simulator::EX()
{
	//read ID_EX
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

	//write EX_MEM_old
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