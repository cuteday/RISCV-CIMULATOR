#pragma once
#include "Utility.h"
#include "Read_Elf.h"
#define MEMSIZE 10000000
#define MEM_HL  100      // memory hit latency

// Storage access stats
typedef struct StorageStats_ {
    int num_hits;
    int num_misses;
    int num_reads;
    int num_writes;
    int num_replaces;
    int num_fetches;
    int num_prefetches;
    int access_time;
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
    // Intra-Storage Interface (using Abstract Functions > <)
    virtual void HandleRequest(addr64_t addr, int nbytes, bool write,
                                char *data, int &time) = 0;
    virtual void printStatistics() = 0;
    virtual void printParameters() = 0;
    void printStatisticsAll(){  // print storage stats recursively > < 
        printStatistics();
        if(lower!=NULL) lower->printStatisticsAll();
    }

    const char *name;
    StorageStats stats;
    StorageLatency latency;
    Storage *lower; // multi-layer cache things (using polymorphism > < )
};

class Memory: public Storage{
public:
    Memory(int size = MEMSIZE, char* name_ = NULL);
    addr64_t Translate(int vaddr);
    void HandleRequest(addr64_t vaddr, int nbytes, bool write,
                       char *data, int &time);
    int MemoryAccess(bool write, int vaddr, int size, char *data);
    void Loader(FILE *elf, std::vector<Elf64_Phdr> &phdrs, ull offset_ = 0);  // Load the Executables
    void DumpMem(const char filename[] = "./memoryDump");

    void printParameters();
    void printStatistics();

    char* memory;
    ull memsize;
    ull offset;
};
