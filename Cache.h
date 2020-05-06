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
#define GETMR(stats) ((double)stats.num_misses / (stats.num_hits + stats.num_misses))
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

typedef struct{
    bool enable;
    int depth;
    int stride;
    bool LIP;
} PrefetchConfig;

typedef struct{
    int associativity;
    size_t block_size;
    int num_sets;
    POLICY policy;
    bool write_through;
    bool write_allocate;
    const char *name;
    StorageLatency latency;
    PrefetchConfig prefetch;

} CacheConfig;

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
    Cache(CacheConfig config, const char* name_ = NULL);

    // inplementation of the virtual functions
    void HandleRequest(addr64_t vaddr, int bytes, bool write,
                       char *data, int &time);
    void printParameters();
    void printStatistics();

    CacheBlock* FindReplace(addr64_t addr, int& time);
    CacheBlock* FindBlock(addr64_t addr);       

    // algorithms
    int BypassDecision();         
    void PrefetchAlgorithm(addr64_t addr, bool write, bool hit, int& time);
    
    // utility functions
    addr64_t getTag(addr64_t addr) { return (addr & tag_mask) >> (set_bits + block_bits); }
    int getSet(addr64_t addr) { return (addr & set_mask) >> block_bits; }
    int getOffset(addr64_t addr) { return addr & block_mask; }

    int associativity;
    size_t block_size;
    int num_sets;
    int cache_size;
    CacheSet **sets;

    // policy things
    POLICY policy;
    int time_stamp;     // LRU
    bool write_through;
    bool write_allocate;
    PrefetchConfig prefetch;    // 

    // mask things
    int block_bits;     // how much bits intra-block takes
    int set_bits;       // ...
    int tag_bits;
    addr64_t block_mask;
    addr64_t set_mask;
    addr64_t tag_mask;

    // cache status
    bool force_read;
};

// Build CacheManager in a linked-list form
// return [head]L1C -> L2C -> ... -> LLC -> Memory
extern Cache *build_cache(std::vector<CacheConfig> &configs, Memory *memory = NULL);
extern std::vector<CacheConfig> cfg_cache_default;