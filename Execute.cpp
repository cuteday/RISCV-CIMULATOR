#include "Simulation.h"

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
