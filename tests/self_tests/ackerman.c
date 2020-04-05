#include "syscall.h"
//result: 1021

int ackerman(int m, int n){
    if(m==0)
        return n + 1;
    if(n==0)
        return ackerman(m - 1, 1);
    return ackerman(m - 1, ackerman(m, n - 1));
}

int main(){
    int res = ackerman(3, 7);
    Printd(res);
    return 0;
}