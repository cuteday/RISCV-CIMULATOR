#ifndef SIMUL
#define SIMUL

#include <cstdio>
#include <cmath>
#include <ctime>
#include <cstdlib>
#include "Reg_def.h"
#include "Read_Elf.h"

#define OP_JAL 111 // OPCODE UJ    0x6f
#define OP_R 51    // OPCODE REG   0x33

#define F3_ADD 0 // FUNCT3
#define F3_MUL 0

#define F7_MSE 1
#define F7_ADD 0

#define OP_I 19
#define F3_ADDI 0

#define OP_SW 35 // SW, SD, SB, SH   0x23
#define F3_SB 0  // B, H, W, D

#define OP_LW 3 // LW, LD, LB, LH   0x03
#define F3_LB 0 //

#define OP_BEQ 99 // OPCODE SB    0x63
#define F3_BEQ 0

#define OP_IW 27 // ADDIW    RV64I专属
#define F3_ADDIW 0

#define OP_RW 59
#define F3_ADDW 0
#define F7_ADDW 0

#define OP_SCALL 115 //SYSCALL!
#define F3_SCALL 0
#define F7_SCALL 0

#define MAX 100000000

class Simulator{
public:
    ElfReader *elf; // 可执行文件解析


    //主存
    unsigned int memory[MAX];
    //寄存器堆
    REG reg[32];
    //PC
    int PC;

    //各个指令解析段
    unsigned int OP;
    unsigned int fuc3, fuc7;
    int shamt;
    int rs, rt, rd;
    unsigned int imm12;
    unsigned int imm20;
    unsigned int imm7;
    unsigned int imm5;

    //指令运行数
    long long inst_num;
    //系统调用退出指示
    int exit_flag;

    // 流水线寄存器们
    IF_ID IFID, IFID_;
    ID_EX IDEX, IDEX_;
    EX_MEM EXMEM, EXMEM_;
    MEM_WB MEMWB, MEMWB_;

    Simulator(char* filename);

    //加载内存
    void load_memory();
    void simulate();

    void IF();
    void ID();
    void EX();
    void MEM();
    void WB();

    //符号扩展
    int ext_signed(unsigned int src, int bit);
    //获取指定位
    unsigned int getbit(int s, int e);
    unsigned int getbit(unsigned inst, int s, int e);
};

#endif