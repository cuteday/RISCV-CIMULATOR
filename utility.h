#ifndef HAPPY_HAPPY_FRIENDS
#define HAPPY_HAPPY_FRIENDS

#include <iostream>
#include <cstring>
#include <cstdio>
#include <cmath>
#include <ctime>
#include <cstdlib>

#define FALSE false
#define TRUE true

typedef unsigned int uint;
typedef long long ll;
typedef unsigned long long ull;
typedef unsigned char uchar;
typedef unsigned short ushort;

extern bool debug_on;
extern void DEBUG(const char format[], ...);

extern const char *op_names[];

enum OP_NAME
{
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
    OP_INVALID
};

extern ull calc_mulh(ull a, ull b);

#endif
