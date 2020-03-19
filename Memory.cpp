#include "Memory.h"

Memory::Memory(int size){
    memory = new char[size];
    memset(memory, 0, size);
}

//----------------------------
//  直接返回ull 如果size<8会自己截断的...
//----------------------------

ull Memory::ReadMem(int addr, int size){
    ull value;
    switch(size){
        case 1:
            value = *(uchar*)memory[addr];
            break;
        case 2:
            value = *(ushort *)(memory + addr);
            break;
        case 4:
            value = *(uint *)(memory + addr);
            break;
        case 8:
            value = *(ull *)(memory + addr);
            break;
        default:
            fprintf(stderr, "Unsupported size for reading memory > <\n");
            assert(false);
        }
    DEBUG("Reading VA 0x%08x, size %d\n", addr, size);
    return value;
}

void Memory::WriteMem(int addr, int size, ull value){
    DEBUG("Writing VA 0x%08x, size %d, value 0x%llx\n", addr, size, value);
    switch(size){
        case 1:
            memory[addr] = (uchar)(value & 0xFF);
            break;
        case 2:
            memory[addr] = (ushort)(value & 0xFFFF);
            break;
        case 4:
            memory[addr] = (uint)(value & 0xFFFFFFFF);
            break;
        case 8:
            memory[addr] = value;
            break;
        default:
            fprintf(stderr, "Unsupported size for writing memory > <\n");
            assert(false);
        }
}