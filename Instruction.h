#ifndef INSTRUCT
#define INSTRUCT
#include <cassert>

enum OP_NAME{
    OP_NOP,
    OP_ADD,
    OP_MUL,
    OP_SUB,
    OP_SLL,
    OP_MULH,
    OP_SLT,
    OP_XOR,
    OP_DIV,
    OP_SRL,
    OP_SRA,
    OP_OR,
    OP_REM,
    OP_AND,
    OP_LB,
    OP_LH,
    OP_LW,
    OP_LD,
    OP_LBU,
    OP_LHU,
    OP_LWU,
    OP_ADDI,
    OP_SLLI,
    OP_SLTI,
    OP_XORI,
    OP_SRLI,
    OP_SRAI,
    OP_ORI,
    OP_ANDI,
    OP_ADDIW,
    OP_JALR,
    OP_ECALL,
    OP_SB,
    OP_SH,
    OP_SW,
    OP_SD,
    OP_BEQ,
    OP_BNE,
    OP_BLT,
    OP_BGE,
    OP_AUIPC,
    OP_LUI,
    OP_JAL,

    // Extended options... (GreenCard你骗我 不止这么多...)
    // 32-bit ops
    OP_ADDW,
    OP_SUBW,
    OP_MULW,
    OP_SLLW,
    OP_SRLW,
    OP_SRAW,

    OP_SLLIW,   // ADDIW series...
    OP_SRLIW,
    OP_SRAIW,
    
    OP_INVALID
};

class Instruction{
public:
    // uint inst;
    ull inst;

    unsigned int OP;
    unsigned int fuc3,fuc7;
    int rs,rt,rd;       

    int imm_i;
    int imm_s;
    int imm_sb;
    int imm_u;
    int imm_uj;     //21bit signed

    Instruction(unsigned int poi) : inst(poi){
        OP = getbit(0, 6);
        fuc3 = getbit(12, 14);
        fuc7 = getbit(25, 31);
        rs = getbit(15, 19);
        rt = getbit(20, 24);
        rd = getbit(7, 11);

        imm_i = (int32_t)inst >> 20; // imm_I, signed
        imm_s = ((inst >> 7) & 0x1F) | (((int32_t)inst >> 20) & 0xFFFFFFE0 );
        imm_sb = int32_t(((inst >> 7) & 0x1E) | ((inst >> 20) & 0x7E0) |
                         ((inst << 4) & 0x800) | (((int32_t)inst >> 19) & 0xFFFFF000));
        imm_u = (int32_t)inst >> 12;
        imm_uj = int32_t(((inst >> 20) & 0x7FE) | ((inst >> 9) & 0x800) |
                        (inst & 0xFF000) | (((int32_t)inst >> 11) & 0xFFF00000));

    }

    unsigned int getbit(int s, int e){
        assert(s < 32 && e < 32 && s <= e);
        unsigned int l, r;
        l = (1 << s) - 1;
        r = (1 << e) - 1;
        r += 1 << e;
        return (inst & (l ^ r)) >> s;
    }

    static bool isCondJump(OP_NAME op){
        return op == OP_BEQ || op == OP_BNE || op == OP_BGE || op == OP_BLT;
    }
};



#endif