#include "Utility.h"

bool debug_on[5];
void DEBUG(DEBUG_MODE mode, const char format[], ...){
    // 变长参数用于调试...!
    if(debug_on[mode]){
        va_list ap;
        va_start(ap, format);
        vfprintf(stderr, format, ap);
        va_end(ap);
    }
}

Logger::Logger() { memset(this, 0, sizeof(Logger)); }

void Logger::printResults(){
    numDataHarzards = numDataForwards + numLoadUseHazards;
    fprintf(stdout, "-------------------Simulator History--------------------\n");
    fprintf(stdout, "Total instructions: %d\n", numInsts);
    fprintf(stdout, "Total CPU cycles: %d\n", numCycles);
    fprintf(stdout, "Average CPI: %.3f\n", (float)numCycles / numInsts);
    fprintf(stdout, "Control harzards happened: %d\n", numControlHazards);
    fprintf(stdout, "Data harzards happended: %d, among which:\n", numDataHarzards);
    fprintf(stdout, "%d used Data Bypass to avoid stalling, but...\n", numDataForwards);
    fprintf(stdout, "%d of them are Load/Use harzards.\n", numLoadUseHazards);
    fprintf(stdout, "Thanks for using and have a nice day! ｄ(･∀･*)♪ﾟ\n\n");
}

ArgParser *args;
ArgParser::ArgParser(int argc, char *argv[]){
    memset(this, 0, sizeof(ArgParser));

    for (int i = 0; i < argc;i++){
        if(!strcmp(argv[i], "-f")){
            if(i == argc - 1){
                fprintf(stderr, "Executable not specified!\n");
                printError();
            }
            test_file = argv[++i];
        }
        else if(!strcmp(argv[i], "-d")){
            single_step = true;
            print_pipelined = true;
        }
        else if(!strcmp(argv[i], "-v")){
            print_verbose = true;
            print_pipelined = true;
        }
        else if(!strcmp(argv[i], "-e")){
            print_elf = true;
        }
        else if(!strcmp(argv[i], "-p")){
            print_pipelined = true;
        }
        else if(!strcmp(argv[i], "-cache")){
            cache_enable = true;
        }
        else if(!strcmp(argv[i], "-h")){
            printHelp();
        }
    }
    if(test_file == NULL){
        fprintf(stderr, "Executable not specified!\n");
        printError();
    }
}

void ArgParser::printHelp(){
    printf("Usage: \n");
    printf("    -f [risc-v64 file]: run executable in simulator\n");
    printf("Optional: \n");
    printf("    -d run in single-step mode for debugging\n");
    printf("    -v print debug imformation for simulator (verbose)\n");
    printf("    -e print elf file parsing results before running\n");
    printf("Help: \n");
    printf("    -h help information\n\n");
    exit(0);
}

void ArgParser::printError(){
    fprintf(stderr, "Incorrect argument format > <\n");
    fprintf(stderr, "run with -h for help.\n\n");
    assert(false);
}

bool BranchPredictor::Predict(){
    switch (mode){
    case PREDICT_AT: 
        return true;
    case PREDICT_ANT:
        return false;
    }
    return false;
}

ull signed_ext(ull src, int size, bool sign){
    ull value;
    switch (size){
    case sizeof(char):
        value = *(char *)&src;
        break;
    case sizeof(short):
        value = *(short *)&src;
        break;
    case sizeof(int):
        value = *(int *)&src;
        break;
    case sizeof(long long):
        value = *(long long *)&src;
        break;
    default:
        fprintf(stderr, "Unsupported size %d for reading memory > <\n", size);
        assert(false);
    }
    return value;
}

ull calc_mulh(ull a, ull b){
    ull    a_lo = (uint)a;
    ull    a_hi = a >> 32;
    ull    b_lo = (uint)b;
    ull    b_hi = b >> 32;
    ull    a_x_b_hi =  a_hi * b_hi;
    ull    a_x_b_mid = a_hi * b_lo;
    ull    b_x_a_mid = b_hi * a_lo;
    ull    a_x_b_lo =  a_lo * b_lo;
    ull    carry_bit = ((ull)(uint)a_x_b_mid +
                            (ull)(uint)b_x_a_mid +
                            (a_x_b_lo >> 32) ) >> 32;
    ull    res = a_x_b_hi +
                (a_x_b_mid >> 32) + (b_x_a_mid >> 32) +
                carry_bit;
    return res;
}

const char *op_names[] = {
    "nop",

    "add",
    "mul",
    "sub",
    "sll",
    "mulh",
    "slt",
    "xor",
    "div",
    "srl",
    "sra",
    "or",
    "rem",
    "and",

    "lb",
    "lh",
    "lw",
    "ld",
    "lbu",
    "lhu",
    "lwu",

    "addi",
    "slli",
    "slti",
    "xori",
    "srli",
    "srai",
    "ori",
    "andi",
    "addiw",
    "Jalr",
    "ecall",

    "sb",
    "sh",
    "sw",
    "sd",

    "beq",
    "bne",
    "blt",
    "bge",

    "auipc",
    "lui",
    "jal",

    "addw",
    "subw",
    "mulw",
    "sllw",
    "srlw",
    "sraw",

    "slliw",
    "srliw", 
    "sraiw",

};

const char *reg_names[] = {
    "zero", // x0
    "ra",   // x1
    "sp",   // x2
    "gp",   // x3
    "tp",   // x4
    "t0",   // x5
    "t1",   // x6
    "t2",   // x7
    "s0",   // x8
    "s1",   // x9
    "a0",   // x10
    "a1",   // x11
    "a2",   // x12
    "a3",   // x13
    "a4",   // x14
    "a5",   // x15
    "a6",   // x16
    "a7",   // x17
    "s2",   // x18
    "s3",   // x19
    "s4",   // x20
    "s5",   // x21
    "s6",   // x22
    "s7",   // x23
    "s8",   // x24
    "s9",   // x25
    "s10",  // x26
    "s11",  // x27
    "t3",   // x28
    "t4",   // x29
    "t5",   // x30
    "t6",   // x31
};

const char *scall_names[] = {
    "exit",
    "printc",
    "printd",
    "prints",
    "getc",
    "getd",
};