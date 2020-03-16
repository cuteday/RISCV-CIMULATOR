#include <iostream>
#include <cstring>
#include <cstdio>
#include "Simulation.h"
using namespace std;

char *test_file = "./sort";

int main(int argc, char* argv[]){
    debug_on = true;
    printf("hello world!\n");
    Simulator simulator = Simulator(test_file);
    return 0;
}