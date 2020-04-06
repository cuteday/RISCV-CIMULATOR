#include "syscall.h"
#define swap(x, y) {x^=y^=x^=y;}
void Qsort(int a[], int l, int r){
    if (l >= r) return;
    int x = a[l], lp = l, rp = r;
    while(lp<rp){
        while(lp<rp&&a[rp]>=x)
            rp--;   
        while(lp<rp&&a[lp]<=x)
            lp++;   //not reached in last loop
        if(lp<rp)  
            swap(a[lp], a[rp]);
    }
    if(lp>l) swap(a[lp], a[l]);
    Qsort(a, l, lp-1);
    Qsort(a, lp+1, r);
}

int a[205];

int main(){
    Prints("Sorting from 200 to 0 ...\n");
    for (int i = 200; i >= 0;i--)
		a[i] = 200 - i;
	Qsort(a, 0, 200);
	for (int i = 0; i <= 200;i++){
		Printd(a[i]);
		Printc(' ');
	}
    return 0;
}
