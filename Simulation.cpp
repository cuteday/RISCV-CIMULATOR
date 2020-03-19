#include "Simulation.h"
using namespace std;

Simulator::Simulator(char* filename){
	memset(this, 0, sizeof(Simulator));
	elf = new ElfReader(filename, NULL);
	mainMemory = new Memory(MEMSIZE);
}

int Simulator::ext_signed(unsigned int src, int bit){
	return 0; 
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
	PC=elf->entry>>2;
	//设置全局数据段地址寄存器
	reg[3]=elf->gp;
	reg[2]=MEMSIZE/2;//栈基址 （sp寄存器）
}


void Simulator::simulate()
{
	//结束PC的设置
	int end=(int)elf->endPC/4-1;
	while(PC!=end)
	{
		// 运行
		// 倒着执行? nonono
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
	IFID.inst = mainMemory->ReadMem(PC, 4);

	PC=PC+1;
	IFID_.PC=PC;	// 前传更新后的PC (PC+1)
}



//访问存储器
void Simulator::MEM()
{
	//read EXMEM
	REG ALU_out = EXMEM.ALU_out;	// Address 
	REG Reg_Rt = EXMEM.Reg_Rt;		// operand
	REG Mem_read;
	uint ReadLen = EXMEM.Ctrl_M_MemRead;
	uint WriteLen = EXMEM.Ctrl_M_MemWrite;

	//complete Branch instruction PC change

	//read / write memory
	if(ReadLen)
		Mem_read = mainMemory->ReadMem(ALU_out, ReadLen);
	if(WriteLen)
		mainMemory->WriteMem(ALU_out, WriteLen, Reg_Rt);

	//write MEMWB_

	MEMWB_.Reg_dst = EXMEM.Reg_dst;
	MEMWB_.Mem_read = Mem_read;
	MEMWB_.ALU_out = ALU_out;
	MEMWB_.Ctrl_WB_MemtoReg = EXMEM.Ctrl_WB_MemtoReg;
	MEMWB_.Ctrl_WB_RegWrite = EXMEM.Ctrl_WB_RegWrite;
}


//写回
void Simulator::WB()
{
	// 本阶段已经无需考虑冒险和旁路
	// read MEMWB
	char RegWrite = MEMWB.Ctrl_WB_RegWrite;
	char MemtoReg = MEMWB.Ctrl_WB_MemtoReg;
	REG ALU_out = MEMWB.ALU_out;
	REG Mem_read = MEMWB.Mem_read;
	uint Reg_dst = MEMWB.Reg_dst;

	if(RegWrite)	//write reg
		reg[Reg_dst] = MemtoReg ? Mem_read : ALU_out;

}