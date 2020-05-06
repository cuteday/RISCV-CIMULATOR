#include "Cache.h"
using namespace std;
// 写存:
// 命中 -> 写回 / 直接写到下层
// 不命中 -> 写分配loadFromLower, 写不分配直接写到下层(一般下层也是写不分配)
// 访存:
// 不命中 -> loadFromLower

#define LIP

int log2(int x){
    assert(POWER2(x));
    int res = -1;
    while(x)
        res++, x >>= 1;
    return res;
}

Cache *build_cache(vector<CacheConfig> &configs, Memory *memory){
    if(memory == NULL)
        memory = new Memory(MEMSIZE);
    // if(!configs.size())
    //     return memory;
    Cache *first = NULL, *last = NULL;
    for (int i = 0; i < configs.size();i++){
        Cache *cur_layer = new Cache(configs[i], configs[i].name);
        if(first==NULL)
            first = cur_layer;
        else
            last->lower = cur_layer;
        last = cur_layer;
    }
    DEBUG(DEBUG_V, "Finished constructing a %d-layer cache manager ^ ^\n", (int)configs.size());
    last->lower = memory;
    return first;
}

Cache::Cache(CacheConfig config, const char* name_){
    name = name_ == NULL ? "Cache" : name_;
    associativity = config.associativity;
    block_size = config.block_size;
    num_sets = config.num_sets;
    policy = config.policy;
    write_through = config.write_through;
    write_allocate = config.write_allocate;
    cache_size = associativity * block_size * num_sets;
    latency = config.latency;
    prefetch = config.prefetch;

    assert(associativity > 0);
    assert(block_size >= 8 && POWER2(block_size));    // ignored lower bits
    assert(num_sets > 0 && POWER2(num_sets)); // lower log(nsets) bits

    // initiate masks:
    set_bits = log2(num_sets);
    block_bits = log2(block_size);
    tag_bits = 64 - set_bits - block_bits;
    set_mask = ((1 << set_bits) - 1) << block_bits;
    block_mask = (1 << block_bits) - 1;
    tag_mask = ((1 << tag_bits) - 1) << (set_bits + block_bits);

    sets = (CacheSet **)calloc(num_sets, sizeof(CacheSet *));
    for (int i = 0; i < num_sets; i++)
        sets[i] = new CacheSet(associativity, block_size);
}


CacheBlock* Cache::FindBlock(addr64_t addr){
    addr64_t tag = getTag(addr);
    int set = getSet(addr);
    // find if exists in its cache set
    for (int i = 0; i < associativity;i++){
        CacheBlock *block = (*sets[set])[i];
        if(block->status!=CACHEBLK_INVALID && block->tag==tag)
            return block;
    }
    return NULL;
}

CacheBlock* Cache::FindReplace(addr64_t addr, int& time){
    // policy dependent
    int set = getSet(addr);
    // 1. LRU
    int min = 0x7fffff, minChoice = 0;
    for (int i = 0; i < associativity; i++){
        CacheBlock *block = (*sets[set])[i];
        if(block->status == CACHEBLK_INVALID || block->tag == getTag(addr))
            return block;
        if (block->last_access < min){
            min = block->last_access, minChoice = i;
        }
    }
    
    CacheBlock *replace = (*sets[set])[minChoice];
    addr64_t replace_addr = (replace->tag << (block_bits + set_bits)) | (set << block_bits);
    // LRU下 被替换的块 一般在下层存在...
    // 在某些极端的替换策略下除外...
    if(replace->status == CACHEBLK_DIRTY){
        lower->HandleRequest(replace_addr, block_size, 1, replace->dataptr, time);
    }
    return replace;
}

void Cache::HandleRequest(addr64_t vaddr, int nbytes, bool write, char *data, int &time){
    assert(POWER2(nbytes));

    addr64_t tag = getTag(vaddr);
    bool hit = false;
    int timing = 0; // time used in this layer
    int set = getSet(vaddr);
    int offset = getOffset(vaddr);
    CacheBlock* target = FindBlock(vaddr);   // attempt to find it
    // DEBUG(DEBUG_V, "CacheManager: Access Req, addr 0x%016llx, tag 0x%llx, set 0x%x, offset 0x%x, length %d\n", vaddr, tag, set, offset, nbytes);
    
    if(write)
        stats.num_writes++;
    else stats.num_reads++;

    if(target == NULL){     // miss
        timing += latency.bus_latency;   // and lower layer hit latency...
        if (write && !write_allocate){
            lower->HandleRequest(vaddr, nbytes, write, data, time);
        }
        else{
            // else, need to find a block for replacement:
            target = FindReplace(vaddr, time);
            // fetch from lower cache when...
            // READ enable OR write allocate
            lower->HandleRequest(vaddr & ~block_mask, (int)block_size, 0, target->dataptr, time);
            target->status = CACHEBLK_VALID;
            target->tag = tag;
            // data transaction
            if(!write)
                memcpy(data, target->dataptr + offset, nbytes);
            else{
                memcpy(target->dataptr + offset, data, nbytes);
                target->status = CACHEBLK_DIRTY;
            }
        }
    }else{      // hit
        hit = true;
        timing += latency.bus_latency + latency.hit_latency;
        if(write){
            memcpy(target->dataptr + offset, data, nbytes);
            if(write_through)   // write through: change cache and lower layer cache... 
                lower->HandleRequest(vaddr, nbytes, write, data, time);
            else target->status = CACHEBLK_DIRTY;
        }
        else    // read
            memcpy(data, target->dataptr + offset, (size_t)nbytes);
    }
    if(hit)
        stats.num_hits++;
    else stats.num_misses++;
    PrefetchAlgorithm(vaddr, write, hit, time);
    time += timing, stats.access_time += timing;
#ifdef LIP
    if(hit) // LIP, Qureshi et al.  Adaptive Insertion Policies for High Performance Caching
        target->last_access = ++time_stamp;     
#else 
    if(target)  
        target->last_access = ++time_stamp;     // LRU
#endif
}

void Cache::PrefetchAlgorithm(addr64_t addr, bool write, bool hit, int& time){
    if(!prefetch.enable || hit) return;   // dont prefetch on these situations...
    addr &= ~block_mask;    // align with a block
    for (int k = 1; k <= prefetch.depth; k++){
        addr64_t fetch_addr = addr + k * prefetch.stride * block_size;
        addr64_t tag = getTag(fetch_addr);
        CacheBlock *replace = FindReplace(fetch_addr, time);
        if(replace->tag != tag){
            lower->HandleRequest(addr, block_size, 0, replace->dataptr, time);
            replace->status = CACHEBLK_VALID;
            replace->tag = tag;
        }
    }
}

// Implement virtual funcs
void Cache::printStatistics(){
    fprintf(stdout, "-----------------------%s Statistics--------------------\n", name);
    fprintf(stdout, "Num Reads: %d\n", stats.num_reads);
    fprintf(stdout, "Num Writes: %d\n", stats.num_writes);
    fprintf(stdout, "Num Hits: %d\n", stats.num_hits);
    fprintf(stdout, "Num Misses: %d\n", stats.num_misses);
    fprintf(stdout, "Miss Rate: %.5f\n", (float)stats.num_misses / (stats.num_hits + stats.num_misses));
}

void Cache::printParameters(){
    fprintf(stdout, "----------------------%s Parameters-------------------\n", name);
    fprintf(stdout, "Cache Size: %d\nBlock Size: %d\nAssociativity: %d\nNum Sets: %d\nPolicy: LRU\nWrite Back: %d\nWrite Allocate: %d\n",
                cache_size, (int)block_size, associativity, num_sets, !write_through, write_allocate);
}

CacheSet::CacheSet(int associativity_, size_t block_size){
    associativity = associativity_;
    blocks = (CacheBlock **)calloc(associativity, sizeof(CacheBlock *));
    for (int i = 0; i < associativity;i++)
        blocks[i] = new CacheBlock(block_size);
}

CacheBlock::CacheBlock(size_t block_size) {
    assert(block_size >= 0);
    assert(POWER2(block_size));
    memset(this, 0, sizeof(CacheBlock));
    dataptr = (char*)calloc(block_size, 1);
}

// __________________________________________ Default Configs ______________________________________________
// Config Format: 
// {assoc, bsize, nsets, policy, WT, WA, 
// name[Optional], 
// latency{hit, bus}[optional],                     default: 0
// prefetchconfig{enable, dep, stride}[optional]    default: disabled
// } 
#define cfg_cache_nlayers  3
CacheConfig cfg_cache_default_[] = {
    {8, 64, 64, LRU, false, true, "L1 Cache", {1, 0}},          // default L1
    {8, 64, 512, LRU, false, true, "L2 Cache", {8, 0}},         // default L2
    {8, 64, 16384, LRU, false, true, "L3 Cache", {8, 0}},       // default L3
};
vector<CacheConfig> cfg_cache_default(cfg_cache_default_, cfg_cache_default_ + cfg_cache_nlayers);