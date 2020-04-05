#include "Simulation.h"

char* test_file = NULL;

int main(int argc, char* argv[]){

    args = new ArgParser(argc, argv);
    debug_on[DEBUG_D] = args->single_step;
    debug_on[DEBUG_E] = args->print_elf;
    debug_on[DEBUG_V] = args->print_verbose;
    debug_on[DEBUG_P] = args->print_pipelined;
    test_file = args->test_file;

    Simulator simulator = Simulator(test_file);
    simulator.simulate();
    return 0;
}