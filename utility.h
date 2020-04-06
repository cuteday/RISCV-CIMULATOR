#ifndef HAPPY_HAPPY_FRIENDS
#define HAPPY_HAPPY_FRIENDS

#include <iostream>
#include <cstring>
#include <cstdio>
#include <cmath>
#include <ctime>
#include <cstdlib>
#include <cstdarg>
#include <vector>
#include <cassert>

#define FALSE false
#define TRUE true

typedef unsigned int uint;
typedef long long ll;
typedef unsigned long long ull;
typedef unsigned char uchar;
typedef unsigned short ushort;

enum DEBUG_MODE{
    DEBUG_D,
    DEBUG_E,
    DEBUG_V,
    DEBUG_P,
};

extern bool debug_on[5];
extern void DEBUG(DEBUG_MODE mode, const char format[], ...);

class ArgParser{
public:
    char* test_file;
    bool single_step;
    bool print_verbose;
    bool print_pipelined;
    bool print_elf;
    ArgParser(int argc, char *argv[]);

private:
    void printHelp();
    void printError();
};
extern ArgParser *args;

class Logger{
public:
    Logger();
    void printResults();

    int numCycles;
    int numInsts;
    int numDataHarzards;
    int numLoadUseHazards;
    int numDataForwards;
    int numControlHazards;
};

enum PREDICT_MODE{
    PREDICT_ANT,
    PREDICT_AT,
};

class BranchPredictor{
public:
    BranchPredictor(PREDICT_MODE m = PREDICT_ANT):mode(m){}
    bool Predict();

private:
    PREDICT_MODE mode;
};

extern const char *op_names[];
extern const char *reg_names[];
extern const char *scall_names[];



extern ull calc_mulh(ull a, ull b);

#endif
