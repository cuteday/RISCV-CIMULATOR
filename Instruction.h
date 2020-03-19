class Instruction{
public:
    unsigned int inst;

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
        imm_s = ((inst >> 7) & 0x1f) + ((int32_t)inst >> 20);
        imm_sb = int32_t(((inst >> 7) & 0x1E) | ((inst >> 20) & 0x7E0) |
                         ((inst << 4) & 0x800) | ((inst >> 19) & 0xFFFF1000));
        imm_u = (int32_t)inst >> 12;
        // imm_uj = int32_t(((inst >> 21) & 0x3FF) | ((inst >> 10) & 0x400) |
        //                      ((inst >> 1) & 0x7F800) | ((inst >> 12) & 0x80000))
        //                  << 12 >> 11;
        imm_uj = int32_t(((inst >> 20) & 0x7FE) | ((inst >> 9) & 0x800) |
                        (inst & 0xFF000) | (((int32_t)inst >> 11) & 0xFFF00000));
        //shamt = imm_i & 0x3f;
    }

    unsigned int getbit(int s, int e){
        assert(s < 32 && e < 32 && s <= e);
        unsigned int l, r;
        l = (1 << s) - 1;
        r = (1 << e) - 1;
        r += 1 << e;
        return (inst & (l ^ r)) >> s;
    }
};