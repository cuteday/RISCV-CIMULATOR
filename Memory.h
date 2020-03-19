#include "Utility.h"

class Memory{
public:
    Memory(int size = 1000000);

    void ReadMem(int addr, int size, ull &value);
    void WriteMem(int addr, int size, ull value);

    char* memory;
};