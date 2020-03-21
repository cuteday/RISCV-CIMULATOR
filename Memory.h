#include "Utility.h"

class Memory{
public:
    Memory(int size = 1000000);

    ull ReadMem(int addr, int size, bool sign_ext = true);
    void WriteMem(int addr, int size, ull value);

    char* memory;
    uint memsize;
};