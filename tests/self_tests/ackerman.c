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
    int res;
    Prints("Calculating ackerman(3,5)...\n");
    res = ackerman(3, 5);
    Printd(res);
    Prints("\nCalculating ackerman(3,6)...\n");
    res = ackerman(3, 6);
    Printd(res);
    Prints("\nCalculating ackerman(3,7)...\n");
    res = ackerman(3, 7);
    Printd(res);
    return 0;
}