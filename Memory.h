#include "Utility.h"

class Memory{
public:
    Memory(int size = 1000000);
    ull Translate(int vaddr);
    ull ReadMem(int vaddr, int size, bool sign_ext = true);
    void WriteMem(int vaddr, int size, ull value);
    void DumpMem(const char filename[] = "./memoryDump");

    char* memory;
    ull memsize;
    ull offset;
};