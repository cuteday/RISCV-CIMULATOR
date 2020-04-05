#include "syscall.h"

void Printc(char c){
    asm("li a7, 1;"
        "scall");
}

void Printd(int d){
    asm("li a7, 2;"
        "scall");
}

void Prints(char* s){
    asm("li a7, 3;"
        "scall");
    // not implemented...
}

char Getc(){
    char c;
    asm("li a7, 4;"
        "scall");
    asm("addi %0, a0, 0" : "=r"(c));
    return c;
}

int Getd(){
    int d;
    asm("li a7, 5;"
        "scall");
    asm("addi %0, a0, 0" : "=r"(d));
    return d;
}

void Exit(){
    asm("li a7, 0;"
        "scall");
}