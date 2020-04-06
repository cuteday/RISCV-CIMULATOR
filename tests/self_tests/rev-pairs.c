#include "syscall.h"

int tmp[100], num[100];

int Sort(int l,int r){
    if(l==r)
        return 0;
    int mid = (l + r) / 2, ans = 0;
    int cntL=Sort(l, mid);
    int cntR=Sort(mid+1, r);
    for (int i = l; i <= r;i++)
        tmp[i] = num[i];
    int dex1 = l, dex2 = mid + 1, ptr = l;
    while(dex1<=mid&&dex2<=r)
        if(tmp[dex1]<=tmp[dex2])
            num[ptr++] = tmp[dex1++];
        else{
            num[ptr++] = tmp[dex2++];
            ans += mid - dex1 + 1;
        }
    while(dex2<=r)
        num[ptr++] = tmp[dex2++];
    while(dex1<=mid)
        num[ptr++] = tmp[dex1++];
    return ans + cntL + cntR;
}

int main(){
    Prints("Calculating reverse-ordered pairs from 100 to 1(should be: 4950)\n");

    for (int i = 1; i <= 100;i++)
        num[i] = 100 - i;
    int res = Sort(1, 100);
    Printd(res);
}