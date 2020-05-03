// 联调：
// Execution Driven: 直接在执行中调用
// Trace Driven:  模拟器存储I/D trace
// 取指 访问I-cache
// 访写存 D-cache

// libcheetah
// simple scalar
// Hit Time: 使用cacti模型估值 size association 

// Cache设计模式：
// Exclusive 
// Strictly Inclusive [本模拟器采用的]
// Third One (不要求Ex或Inc)
#include <cassert>
#include <cstring>
#include "Memory.h"
#define POWER2(x) (((x)&((x)-1))==0)

typedef unsigned long long ull;

// typedef unsigned int size_t;

extern int log2(int x);

enum POLICY{
    FIFO,
    LRU,
};

enum CACHEBLK_STATUS{
    CACHEBLK_INVALID = 0,
    CACHEBLK_VALID,
    CACHEBLK_DIRTY,
};

class CacheBlock{
public:

    CacheBlock(size_t block_size);
    CACHEBLK_STATUS status;
    addr64_t tag;
    // size_t block_size;
    int last_access; // time stamp
    char *dataptr;
};

class CacheSet{
public:
    CacheSet(int associativity_, size_t block_size);
    CacheBlock* operator [] (int index){
        return blocks[index];
    }

private:
    int associativity;
    size_t block_size;
    CacheBlock **blocks;
};

class Cache: public Storage{
public:
    Cache(int associativity_,
        size_t block_size_,
        int num_sets_,
        POLICY policy_,
        bool write_through_ = false,
        bool write_allocate_ = false);

    // inplementation of the virtual func
    void HandleRequest(addr64_t vaddr, int bytes, bool write,
                       char *data, int &time);

    CacheBlock* FindReplace(addr64_t addr, int& time);
    CacheBlock* FindBlock(addr64_t addr);       
    // int LoadBlock(addr64_t addr, CacheBlock *src); // when a block exchanged to lower layer...

    struct History{
        int num_hits;
        int num_misses;
        int num_reads;
        int num_writes;
    } history;
    void printHistory();
    void printParameters();

    // algorithms
    void PartitionAlgorithm();    // Partitioning
    int BypassDecision();    // Bypassing
    int PrefetchDecision();    // Prefetching
    void PrefetchAlgorithm();

    // access to lower (recursive); LLC should try access memory > <
    void AccessLowerLayer(addr64_t vaddr, int nbytes, bool write, char *data, int &time);

    // utility functions
    addr64_t getTag(addr64_t addr) { return (addr & tag_mask) >> (set_bits + block_bits); }
    int getSet(addr64_t addr) { return (addr & set_mask) >> block_bits; }
    int getOffset(addr64_t addr) { return addr & block_mask; }

    int associativity;
    size_t block_size;
    int num_sets;
    int cache_size;
    CacheSet **sets;

    // multi-layer cache things
    Cache *lower;
    Memory *memory;
    bool LLC;   // is last layer cache? (connected to memory manager...)

    // policy things
    POLICY policy;
    int time_stamp;     // LRU
    bool write_through;
    bool write_allocate;

    // mask things
    int block_bits;     // how much bits intra-block takes
    int set_bits;       // ...
    int tag_bits;
    addr64_t block_mask;
    addr64_t set_mask;
    addr64_t tag_mask;
};

// Build CacheManager in a linked-list form
// return [head]L1C -> L2C -> ... -> LLC -> Memory
extern Cache *build_cache(int num_layers, int block_size[], int num_sets[], int associativity[], POLICY policy[], bool write_through[], bool write_allocate[]);

extern int cfg_nlayers;
extern int cfg_bsize[];
extern int cfg_nsets[];
extern int cfg_assoc[];
extern POLICY cfg_policy[];
extern bool cfg_through[];
extern bool cfg_allocate[];
