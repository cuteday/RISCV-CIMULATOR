#include "Simulation.h"
using namespace std;

char* test_file = "./tests/add.riscv";

int main(int argc, char* argv[]){

    args = new ArgParser(argc, argv);
    debug_on[DEBUG_D] = args->print_debug;
    debug_on[DEBUG_E] = args->print_elf;
    test_file = args->test_file;

    Simulator simulator = Simulator(test_file);
    simulator.simulate();
    return 0;
}