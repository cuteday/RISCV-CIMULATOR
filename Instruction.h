class Instruction{
public:
    unsigned int inst;

    unsigned int OP;
    unsigned int fuc3,fuc7;
    int shamt;
    int rs,rt,rd;
    unsigned int imm12;
    unsigned int imm20;
    unsigned int imm7;
    unsigned int imm5;

    Instruction(unsigned int poi):inst(poi){
        OP = getbit(0, 6);
        fuc3 = getbit(12, 14);
        fuc7 = getbit(25, 31);
        rs = getbit(15, 19);
        rt = getbit(20, 24);
        rd = getbit(7, 11);
    }

    unsigned int getbit(int s, int e){
        unsigned int l, r;
        l = (1 << s) - 1;
        r = (1 << e) - 1;
        r += 1 << e;
        return (inst & (l ^ r)) >> s;
    }
};