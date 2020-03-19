#include "Memory.h"

Memory::Memory(int size = 1000000){
    memory = new char[size];
    memset(memory, 0, size);
}

void Memory::ReadMem(int addr, int size, ull &value){
    DEBUG("Reading VA 0x%x, size %d, value 0x%x\n", addr, size, value);
    switch(size){
        case 1:
            value = memory[addr];
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
}

void Memory::WriteMem(int addr, int size, ull value){
    DEBUG("Writing VA 0x%x, size %d, value 0x%x\n", addr, size, value);
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