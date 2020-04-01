#include "Memory.h"

Memory::Memory(int size):memsize(size){
    memory = new char[size];
    memset(memory, 0, size);
}

//-----------------------------------------
//  符号扩展signed ext:
//  仅与扩展前的类型有关
//  若扩展前为unsigned 则一定是无符号扩展
//  若扩展前为signed 则一定是符号扩展, 即使是转换为unsigned
//-----------------------------------------

ull Memory::ReadMem(int addr, int size, bool sign_ext){
    
    assert((uint)addr + size < memsize);
    ull value;
    switch(size){
        case 1:
            value = sign_ext? *(char*)(memory + addr) : *(uchar*)(memory + addr);
            break;
        case 2:
            value = sign_ext? *(short*)(memory + addr) : *(ushort*)(memory + addr);
            break;
        case 4:
            value = sign_ext? *(int*)(memory + addr) :*(uint *)(memory + addr);
            break;
        case 8:
            value = *(ull *)(memory + addr);
            break;
        default:
            fprintf(stderr, "Unsupported size %d for reading memory > <\n", size);
            assert(false);
        }
        DEBUG( DEBUG_D, "MemoryManager: Reading VA 0x%08x, size %d, value 0x%llx\n", addr, size, value);
        return value;
}

void Memory::WriteMem(int addr, int size, ull value){
    
    assert((uint)addr + size < memsize);
    switch(size){
        case 1:
            memory[addr] = (char)(value & 0xFF);
            break;
        case 2:
            *(short*)(memory+addr) = (short)(value & 0xFFFF);
            break;
        case 4:
            *(int*)(memory+addr) = (int)(value & 0xFFFFFFFF);
            break;
        case 8:
            *(long long*)(memory+addr) = value;
            break;
        default:
            fprintf(stderr, "Unsupported size %d for writing memory > <\n", size);
            assert(false);
        }
    DEBUG( DEBUG_D, "MemoryManager: Writing VA 0x%08x, size %d, value 0x%llx\n", addr, size, value);
}