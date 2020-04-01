#ifndef HAPPY_HAPPY_FRIENDS
#define HAPPY_HAPPY_FRIENDS

#include <iostream>
#include <cstring>
#include <cstdio>
#include <cmath>
#include <ctime>
#include <cstdlib>
#include <cstdarg>

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
};

extern bool debug_on[2];
extern void DEBUG(DEBUG_MODE mode, const char format[], ...);

class ArgParser{
public:
    char* test_file;
    bool print_debug;
    bool print_elf;
    ArgParser(int argc, char *argv[]);

private:
    void printHelp();
    void printError();
};

extern ArgParser *args;

extern const char *op_names[];
extern const char *reg_names[];
extern const char *scall_names[];



extern ull calc_mulh(ull a, ull b);

#endif
