#include "syscall.h"
char s[] = "hello, world!";

void fact(int n){
    if(n==0)
        return;
    fact(n - 1);
}

int main(){
    fact(2);
}