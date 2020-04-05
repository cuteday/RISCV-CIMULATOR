#include "Simulation.h"

// quick notes for stall:
// stall 应该是再按原样执行一遍
// 即不要更新这个阶段的流水线寄存器
// 但可以更新下一个阶段的流水线寄存器

// ID:INVADED 异度入侵!!
// 译码
void Simulator::ID()
{
	// 从上级（还未被本次时钟周期更新的）流水线寄存器中取出指令
	Instruction inst=IFID.inst;
    OP_NAME op_name = OP_INVALID;
    int Imm = 0;

    char RegDst = 0;    // write to rd? / rt?
    char ALUSrc = 0;    // ALU op2 from rt? / imm?
    char Branch = 0;    //
    char MemRead = 0;   //
    char MemWrite = 0;  //
    char RegWrite = 0;  //
    char MemtoReg = 0;  //
    //....

    if(inst.OP==OPCODE_R)   // Func3, Func7
	{
        // No imm
        RegWrite = true;

        if (inst.fuc3 == F3_ADD && inst.fuc7 == F7_ADD){
            op_name = OP_ADD;
        }else if (inst.fuc3 == F3_MUL && inst.fuc7 == F7_MUL) {
            op_name = OP_MUL;
        }else if (inst.fuc3 == F3_SUB && inst.fuc7 == F7_SUB) {
            op_name = OP_SUB;
        }else if (inst.fuc3 == F3_SLL && inst.fuc7 == F7_SLL) {
            op_name = OP_SLL;
        }else if (inst.fuc3 == F3_MULH && inst.fuc7 == F7_MULH) {
            op_name = OP_MULH;
        }else if (inst.fuc3 == F3_SLT && inst.fuc7 == F7_SLT) {
            op_name = OP_SLT;
        }else if (inst.fuc3 == F3_XOR && inst.fuc7 == F7_XOR) {
            op_name = OP_XOR;
        }else if (inst.fuc3 == F3_DIV && inst.fuc7 == F7_DIV) {
            op_name = OP_DIV;
        }else if (inst.fuc3 == F3_SRL && inst.fuc7 == F7_SRL) {
            op_name = OP_SRL;
        }else if (inst.fuc3 == F3_SRA && inst.fuc7 == F7_SRA) {
            op_name = OP_SRA;
        }else if (inst.fuc3 == F3_OR&& inst.fuc7 == F7_OR) {
            op_name = OP_OR;
        }else if (inst.fuc3 == F3_REM && inst.fuc7 == F7_REM) {
            op_name = OP_REM;
        }else if (inst.fuc3 == F3_AND && inst.fuc7 == F7_AND) {
            op_name = OP_AND;
        }else{ // Illegal Instruction
            fprintf(stderr, "Invalid function code for R\n");
        }
	}
	else if(inst.OP==OPCODE_I)
    {
        // 12bit signed imm
        Imm = inst.imm_i;
        RegWrite = true;
        ALUSrc = 1;

        if (inst.fuc3 == F3_ADDI){
            op_name = OP_ADDI;
        }else if(inst.fuc3 == F3_SLLI){
            op_name = OP_SLLI;
        }else if (inst.fuc3 == F3_SLTI){
            op_name = OP_SLTI;
        }else if (inst.fuc3 == F3_XORI){
            op_name = OP_XORI;
        }else if (inst.fuc3 == F3_SRLI){
            op_name = OP_SRLI;
        }else if (inst.fuc3 == F3_SRAI){
            op_name = OP_SRAI;
        }else if (inst.fuc3 == F3_ORI){
            op_name = OP_ORI;
        }else if (inst.fuc3 == F3_ANDI){
            op_name = OP_ANDI;
        }else{ // Illegal Instruction
            fprintf(stderr, "Invalid function code3 for IMM\n");
        }
    }
    else if(inst.OP==OPCODE_S)
    {
        // 12bit signed imm
        Imm = inst.imm_s;
        MemWrite = true;
        ALUSrc = 1;

        if(inst.fuc3==F3_SB){
            MemWrite = 1;
            op_name = OP_SB;
        }else if(inst.fuc3==F3_SH){
            MemWrite = 2;
            op_name = OP_SH;
        }else if(inst.fuc3==F3_SW){
            MemWrite = 4;
            op_name = OP_SW;
        }else if(inst.fuc3==F3_SD){
            MemWrite = 8;
            op_name = OP_SD;
        }else{ // Illegal Instruction
            fprintf(stderr, "Invalid function code for SB\n");
        }
    }
    else if(inst.OP==OPCODE_LW) // b, h, w, d
    {
        // 12-bit imm
        Imm = inst.imm_i;
        ALUSrc = 1;
        MemRead = true;
        MemtoReg = true;
        RegWrite = true;

        if(inst.fuc3==F3_LB){
            MemRead = 1;
            op_name = OP_LH;
        }else if(inst.fuc3 == F3_LH){
            MemRead = 2;
            op_name = OP_LH;
        }else if(inst.fuc3 == F3_LW){
            MemRead = 4;
            op_name = OP_LW;
        }else if(inst.fuc3 == F3_LD){
            MemRead = 8;
            op_name = OP_LW;
        }else if(inst.fuc3 == F3_LBU){
            MemRead = 1;
            op_name = OP_LBU;
        }else if(inst.fuc3 == F3_LHU){
            MemRead = 2;
            op_name = OP_LHU;
        }else if(inst.fuc3 == F3_LWU){
            MemRead = 4;
            op_name = OP_LWU;
        }
        else{ // Illegal Instruction
            fprintf(stderr, "Invalid function3 code for LW\n");
        }
    }
    else if(inst.OP==OPCODE_SB) // beq, bne, blt, bge
    {
        // 13bit signed imm
        // 
        Imm = inst.imm_sb;
        Branch = true;

        if (inst.fuc3 == F3_BEQ){
            op_name = OP_BEQ;
        }else if(inst.fuc3 == F3_BNE){
            op_name = OP_BNE;
        }else if(inst.fuc3 == F3_BLT){
            op_name = OP_BLT;
        }else if(inst.fuc3 == F3_BGE){
            op_name = OP_BGE;
        }else{ // Illegal Instruction
            fprintf(stderr, "Invalid function3 code for SB\n");
        }
    }
    else if(inst.OP == OPCODE_ADDIW){
        RegWrite = true;                // ommited T T
        Imm = inst.imm_i;
        ALUSrc = 1;
        
        if(inst.fuc3 == F3_ADDIW){
            op_name = OP_ADDIW;
        }else if(inst.fuc3 == F3_SLLIW){
            op_name = OP_SLLIW;
        }else if(inst.fuc3 == F3_SRLIW){
            if(inst.fuc7 == F7_SRLIW){
                op_name = OP_SRLIW;
            }else if (inst.fuc7 == F7_SRAIW){
                op_name = OP_SRAIW;
            }else{
                fprintf(stderr, "Invalid function7 code for OP32I-SRLIW\n");
            }
        }else{
            fprintf(stderr, "Invalid function3 code for OP32I\n");
        }
    }
    else if(inst.OP==OPCODE_JALR){      // Uncond Kirara Jump

        Branch = true;
        RegWrite = true;
        Imm = inst.imm_i;

        op_name = OP_JALR;
    }
    else if(inst.OP==OPCODE_UJ){        // JAL

        Branch = true;
        RegWrite = true;
        Imm = inst.imm_uj;

        op_name = OP_JAL;
    }
    else if (inst.OP == OPCODE_AUIPC)
    {
        RegWrite = true;
        Imm = inst.imm_u;
        op_name = OP_AUIPC;
    }
    else if (inst.OP == OPCODE_LUI)
    {
        RegWrite = true;
        Imm = inst.imm_u;
        op_name = OP_LUI;
    }
    else if (inst.OP == OPCODE_ECALL){ // Handle syscall
        // syscall no in $a7, args in $a0
        RegWrite = true;    // 要有返回值的嘛

        op_name = OP_ECALL;
        inst.rs = REG_A7;   // 这是为了防止A7和A0的数据大冒险 @
        inst.rt = REG_A0;
        inst.rd = REG_A0;
    }
    else if (inst.OP == OPCODE_32){
        // 32bit 部分指令集

        RegWrite = true;

        if(inst.fuc3 == F3_ADDW){
            if(inst.fuc7 == F7_ADDW){
                op_name = OP_ADDW;
            }else if(inst.fuc7 == F7_MULW){
                op_name = OP_MULW;
            }else if(inst.fuc7 == F7_SUBW){
                op_name = OP_SUBW;
            }else{
                fprintf(stderr, "Invalid function7 code for OP32-ADDW\n");
            }
        }else if(inst.fuc3 == F3_SLLW){
            if(inst.fuc7 == F7_SLLW){
                op_name = OP_SLLW;
            }else{
                fprintf(stderr, "Invalid function7 code for OP32-SLLW\n");
            }
        }else if(inst.fuc3 == F3_SRLW){
            if(inst.fuc7 == F7_SRLW){
                op_name = OP_SRLW;
            }else if(inst.fuc7 == F7_SRAW){
                op_name = OP_SRAW;
            }else{
                fprintf(stderr, "Invalid function7 code for OP32-SRLW\n");
            }
        }else{
            fprintf(stderr, "Invalid function3 code for OP32-INST\n");
        }
    }
    else if (inst.OP == OPCODE_NOP){
        op_name = OP_NOP;
    }
    else{ // Illegal Opcode
        fprintf(stderr, "Invalid operation code...\n");
    }

    if(op_name == OP_INVALID){   
        fprintf(stderr, "Illegal Instuction 0x%08x. Halting > <\n", inst.inst);
        assert(false);
    }

    DEBUG( DEBUG_P, "ID :\tInstruction %s found!  > < its IMM: %d\n", op_names[op_name], Imm);

    // Load Use 冒险检测
    if(IDEX.Ctrl_M_MemRead && 
        (IDEX.Rd == inst.rs || IDEX.Rd == inst.rt)){
            // Stall IF ID
            logger->numLoadUseHazards++;
            stall(STAGE_IF);
            stall(STAGE_ID);
            bubble(STAGE_EX);
            return;
    }

    //write IDEX_
    IDEX_.inst = op_name;

    IDEX_.Rd = inst.rd;         // 目标寄存器...
    IDEX_.Rt = inst.rt;
    IDEX_.Rs = inst.rs;

    IDEX_.Imm = Imm;
    IDEX_.Reg_Rs = reg[inst.rs];    // 读取寄存器操作数
    IDEX_.Reg_Rt = reg[inst.rt];
    IDEX_.PC = IFID.PC;             // forward PC+4
	//...

    IDEX_.Ctrl_EX_ALUSrc = ALUSrc;
    IDEX_.Ctrl_EX_RegDst = RegDst;

    IDEX_.Ctrl_M_Branch = Branch;
    IDEX_.Ctrl_M_MemWrite = MemWrite;
    IDEX_.Ctrl_M_MemRead = MemRead;

    IDEX_.Ctrl_WB_RegWrite = RegWrite;
    IDEX_.Ctrl_WB_MemtoReg = MemtoReg;
    //....
}
