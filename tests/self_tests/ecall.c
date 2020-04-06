#include "syscall.h"
char s[] = "hello, world!";

int main(){
    Prints("Testing system calls...\n");
    Prints(s);
    Printd(-1000);
    Exit();
}