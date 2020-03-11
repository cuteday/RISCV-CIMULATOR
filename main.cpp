#include <iostream>
#include <cstring>
#include <cstdio>
//#include "Simulation.h"
#include "Read_Elf.h"
using namespace std;

int main(int argc, char* argv[]){
    debug_on = true;
    printf("hello world!\n");
    ElfReader reader = ElfReader("./sort");
    reader.read_elf();
    return 0;
}