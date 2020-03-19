#ifndef SIMUL
#define SIMUL

#include "Reg_def.h"
#include "Read_Elf.h"
#include "Instruction.h"

// 课堂摸鱼笔记
// 多周期数据通路 Cycle数?
// 根据Opcode 定义不同的周期
// 改起来很方便~~! @模拟器的优势
// 但是多周期流水线呢？ 同一时间，对应不同的执行空间...
// 导致Cycle增加的? Cache miss、 Data Header、Control Harzard 补偿一下
// 
// 流水线的Step?
// 时钟周期意义上 或指令阶段的意义上...
// 如何处理系统调用?
// 使用内联汇编改写系统调用

#define OPCODE_UJ       0x6f // OPCODE UJ    0x6f
#define OPCODE_R        0x33    // OPCODE REG   0x33
#define OPCODE_ECALL    0x73 //SYSCALL!
#define OPCODE_LW       0x03
#define OPCODE_I     0x13
#define OPCODE_ADDIW    0x1b
#define OPCODE_JALR     0x67
#define OPCODE_S        0x23
#define OPCODE_SB       0x63
#define OPCODE_AUIPC    0x17
#define OPCODE_LUI      0x37         

#define F3_ADD  0     // FUNCT3
#define F3_MUL  0
#define F3_SUB  0
#define F3_SLL  0x1
#define F3_MULH 0x1
#define F3_SLT  0x2
#define F3_XOR  0x4
#define F3_DIV  0x4
#define F3_SRL  0x5
#define F3_SRA  0x5
#define F3_OR   0x6
#define F3_REM  0x6
#define F3_AND  0x7

#define F7_ADD  0     // FUNCT3
#define F7_MUL  0x01
#define F7_SUB  0x20
#define F7_SLL  0
#define F7_MULH 0x01
#define F7_SLT  0
#define F7_XOR  0
#define F7_DIV  0x01
#define F7_SRL  0
#define F7_SRA  0x20
#define F7_OR   0
#define F7_REM  0x01
#define F7_AND  0

#define F3_LB   0
#define F3_LH   0x1
#define F3_LW   0x2
#define F3_LD   0x3
#define F3_ADDI 0
#define F3_SLLI 0x1
#define F3_SLTI 0x2
#define F3_XORI 0x4
#define F3_SRLI 0x5 // same with srai
#define F3_SRAI 0x5 
#define F3_ORI  0x6
#define F3_ANDI 0x7
#define F3_ADDIW  0
// jarl 两种情况
#define F3_JALR   0
// ecall 两种情况
#define F3_ECALL  0

#define F3_SB   0x0
#define F3_SH   0x1
#define F3_SW   0x2
#define F3_SD   0x3

#define F3_BEQ  0
#define F3_BNE  0x1
#define F3_BLT  0x4
#define F3_BGE  0x5

#define F7_MSE 1
#define F7_ECALL 0

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