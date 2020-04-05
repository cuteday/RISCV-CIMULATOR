#include "syscall.h"
#define R 5
#define M 5
#define C 5

// result[][]: 
// 15 30 45 60 75 
// 40 80 120 160 200 
// 15 30 45 60 75 
// 40 80 120 160 200 
// 15 30 45 60 75 

int A[R][M] = {{1, 2, 3, 4, 5}, {1, 2, 3, 4, 5}, {1, 2, 3, 4, 5}, {1, 2, 3, 4, 5}, {1, 2, 3, 4, 5}};
int B[M][C] = {{1, 2, 3, 4, 5}, {6, 7, 8, 9, 10}, {1, 2, 3, 4, 5}, {6, 7, 8, 9, 10}, {1, 2, 3, 4, 5}};
int RES[R][C];

void matmul(int a[][M], int b[][C], int res[][C]){
    for (int i = 0; i < R;i++)
        for (int j = 0; j < C;j++){
            res[i][j] = 0;
            for (int k = 0; k < M; k++)
                res[i][j] += a[i][k] * b[k][j];
        }
}

int main(){
    matmul(B, A, RES);
    for (int i = 0; i < R;i++){
        for (int j = 0; j < C;j++){
            Printd(RES[i][j]);
            Printc(' ');
        }
        Printc('\n'); 
    }
}