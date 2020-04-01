#include "Simulation.h"
using namespace std;

char test_file[] = "./tests/ecall.riscv";

int main(int argc, char* argv[]){
    debug_on = true;
    Simulator simulator = Simulator(test_file);
    simulator.simulate();
    return 0;
}