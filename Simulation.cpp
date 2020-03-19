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
	IFID_.inst=memory[PC];

	PC=PC+1;
	IFID_.PC=PC;	// 前传更新后的PC (PC+1)
}

//执行
void Simulator::EX()
{
	//read ID_EX
	OP_NAME op_name = IDEX.inst;
	int temp_PC=IDEX.PC;

	char RegDst=IDEX.Ctrl_EX_RegDst;
	char RegWrite = IDEX.Ctrl_WB_RegWrite;
	int Imm = IDEX.Imm;
	REG_SIGNED inp1, inp2;

	//Branch PC calulate
	//...

	//choose ALU input number
	inp1 = IDEX.Reg_Rs;
	inp2 = IDEX.Ctrl_EX_ALUSrc ? Imm : IDEX.Reg_Rt;

	//alu calculate
	int Zero;
	REG ALUout;
	// switch(ALUOp){
	// default:;
	// }

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
		case OP_SRA:	// algorimetic shift
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
			ALUout = inp2 << 12;
			break;

		default:
			fprintf(stderr, "这个错误本不该出现的...\n");
			assert(op_name != OP_INVALID);
			assert(false);
	}

	//choose reg dst address
	if(RegDst){		// not reg $0

	}

	//write EXMEM_
	EXMEM_.ALU_out=ALUout;
	EXMEM_.PC=temp_PC;
	EXMEM_.Reg_dst = RegDst;
	EXMEM_.Zero = !ALUout;
	EXMEM_.Reg_Rt = IDEX.Reg_Rt;

	EXMEM_.Ctrl_M_MemRead = IDEX.Ctrl_M_MemRead;
	EXMEM_.Ctrl_M_MemWrite = IDEX.Ctrl_M_MemWrite;
	EXMEM_.Ctrl_WB_RegWrite = IDEX.Ctrl_WB_RegWrite;
	EXMEM_.Ctrl_WB_MemtoReg = IDEX.Ctrl_WB_MemtoReg;

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