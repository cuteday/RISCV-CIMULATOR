#include <cstdarg>
#include <cstdio>
#include "Utility.h"

bool debug_on;
void DEBUG(char* format, ...){
    // 变长参数用于调试...!
    if(debug_on){
        va_list ap;
        va_start(ap, format);
        vfprintf(stderr, format, ap);
        va_end(ap);
    }
}



const char *op_names[] = {
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
    "jal"
};