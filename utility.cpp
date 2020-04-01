#include <cstdarg>
#include <cstdio>
#include "Utility.h"

bool debug_on;
void DEBUG(const char format[], ...){
    // 变长参数用于调试...!
    if(debug_on){
        va_list ap;
        va_start(ap, format);
        vfprintf(stderr, format, ap);
        va_end(ap);
    }
}

ull calc_mulh(ull a, ull b){
    ull    a_lo = (uint)a;
    ull    a_hi = a >> 32;
    ull    b_lo = (uint)b;
    ull    b_hi = b >> 32;
    ull    a_x_b_hi =  a_hi * b_hi;
    ull    a_x_b_mid = a_hi * b_lo;
    ull    b_x_a_mid = b_hi * a_lo;
    ull    a_x_b_lo =  a_lo * b_lo;
    ull    carry_bit = ((ull)(uint)a_x_b_mid +
                            (ull)(uint)b_x_a_mid +
                            (a_x_b_lo >> 32) ) >> 32;
    ull    res = a_x_b_hi +
                (a_x_b_mid >> 32) + (b_x_a_mid >> 32) +
                carry_bit;
    return res;
}

const char *op_names[] = {
    "nop",

    "add",
    "mul",
    "sub",
    "sll",
    "mulh",
    "slt",
    "xor",
    "div",
    "srl",
    "sra",
    "or",
    "rem",
    "and",

    "lb",
    "lh",
    "lw",
    "ld",
    "addi",
    "slli",
    "slti",
    "xori",
    "srli",
    "srai",
    "ori",
    "andi",
    "addiw",
    "Jalr",
    "ecall",

    "sb",
    "sh",
    "sw",
    "sd",

    "beq",
    "bne",
    "blt",
    "bge",

    "auipc",
    "lui",
    "jal",

    "lbu",
    "lhu",
    "lwu",

};

const char *reg_names[] = {
    "zero", // x0
    "ra",   // x1
    "sp",   // x2
    "gp",   // x3
    "tp",   // x4
    "t0",   // x5
    "t1",   // x6
    "t2",   // x7
    "s0",   // x8
    "s1",   // x9
    "a0",   // x10
    "a1",   // x11
    "a2",   // x12
    "a3",   // x13
    "a4",   // x14
    "a5",   // x15
    "a6",   // x16
    "a7",   // x17
    "s2",   // x18
    "s3",   // x19
    "s4",   // x20
    "s5",   // x21
    "s6",   // x22
    "s7",   // x23
    "s8",   // x24
    "s9",   // x25
    "s10",  // x26
    "s11",  // x27
    "t3",   // x28
    "t4",   // x29
    "t5",   // x30
    "t6",   // x31
};

const char *scall_names[] = {
    "exit",
    "printc",
    "printd",
    "prints",
    "getc",
    "getd",
};