#pragma once
#include "Utility.h"
#define MEMSIZE 10000000

// Storage access stats
typedef struct StorageStats_ {
  int access_counter;
  int miss_num;
  int access_time; // In nanoseconds
  int replace_num; // Evict old lines
  int fetch_num; // Fetch lower layer
  int prefetch_num; // Prefetch
} StorageStats;

// Storage basic config
typedef struct StorageLatency{
  int hit_latency; // In nanoseconds
  int bus_latency; // Added to each request
} StorageLatency;

class Storage {
public:
    Storage() {}
    ~Storage() {}

    // Simulator <-> Storage Interface
    void Read(addr64_t addr, int nbytes, ull *data, int &time, bool sign_ext = true);
    void Write(addr64_t addr, int nbytes, ull data, int &time);
    virtual void HandleRequest(addr64_t addr, int nbytes, bool write,
                                char *data, int &time) = 0;
    virtual void printStatistics();
    virtual void printParameters();
    StorageStats stats;
    StorageLatency latency;
};


class Memory: public Storage{
public:
    Memory(int size = 1000000);
    addr64_t Translate(int vaddr);
    void HandleRequest(addr64_t vaddr, int nbytes, bool write,
                       char *data, int &time);
    int MemoryAccess(bool write, int vaddr, int size, char *data);
    void DumpMem(const char filename[] = "./memoryDump");

    char* memory;
    ull memsize;
    ull offset;
};
