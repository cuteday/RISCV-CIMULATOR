#include "Cache.h"

// 写存:
// 命中 -> 写回 / 直接写到下层
// 不命中 -> 写分配loadFromLower, 写不分配直接写到下层(一般下层也是写不分配)
// 访存:
// 不命中 -> loadFromLower

int log2(int x){
    assert(POWER2(x));
    int res = -1;
    while(x)
        res++, x >>= 1;
    return res;
}

Cache *build_cache(int num_layers, int block_size[], int num_sets[], int associativity[], POLICY policy[], bool write_through[], bool write_allocate[]){
    assert(num_layers > 0);
    Cache *first = NULL, *tail = NULL;
    Memory *memory = new Memory(MEMSIZE);
    for (int i = 0; i < num_layers; i++){
        fflush(stdout);
        Cache *cur_layer = new Cache(
            associativity[i],
            block_size[i],
            num_sets[i],
            policy[i],
            write_through[i],
            write_allocate[i]);
        if(first==NULL)
            first = cur_layer;
        else
            tail->lower = cur_layer;
        tail = cur_layer;
        cur_layer->memory = memory;
    }
    DEBUG(DEBUG_V, "Finished constructing a %d-layer cache manager ^ ^\n", num_layers);
    tail->LLC = true, tail->lower = NULL;
    return first;
}

Cache::Cache(
    int associativity_,
    size_t block_size_,
    int num_sets_,
    POLICY policy_,
    bool write_through_,
    bool write_allocate_){
  
    assert(associativity_ > 0);
    assert(block_size_ >= 8 && POWER2(block_size_));    // ignored lower bits
    assert(num_sets_ > 0 && POWER2(num_sets_)); // lower log(nsets) bits

    associativity = associativity_;
    block_size = block_size_;
    num_sets = num_sets_;
    policy = policy_;
    write_through = write_through_;
    write_allocate = write_allocate_;
    cache_size = associativity * block_size * num_sets;

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
    int min = 0x7fff, minChoice = 0;
    for (int i = 0; i < associativity; i++){
        CacheBlock *block = (*sets[set])[i];
        if(block->status == CACHEBLK_INVALID)
            return block;
        if(block->last_access < min){
            min = block->last_access, minChoice = i;
        }
    }
    
    CacheBlock *replace = (*sets[set])[minChoice];
    addr64_t replace_addr = (replace->tag << (block_bits + set_bits)) | (set << block_bits);
    // LRU下 被替换的块 一般在下层存在...
    // 在某些极端的替换策略下除外...
    if(replace->status == CACHEBLK_DIRTY){
        AccessLowerLayer(replace_addr, block_size, 1, replace->dataptr, time);
    }
    return replace;
}

// sub to Cache::AccessCache, Cache <-> Mem Interface  
void Cache::AccessLowerLayer(addr64_t vaddr, int nbytes, bool write, char *data, int& time){
    DEBUG(DEBUG_D, "Accessing lower layer from current layer...\n");
    if (LLC) // LLC, write to memory
        memory->HandleRequest(vaddr, nbytes, write, data, time);
    else
        lower->HandleRequest(vaddr, nbytes, write, data, time);
}

void Cache::HandleRequest(addr64_t vaddr, int nbytes, bool write, char *data, int &time){
    assert(POWER2(nbytes));

    addr64_t tag = getTag(vaddr);
    int set = getSet(vaddr);
    int offset = getOffset(vaddr);
    CacheBlock* target = FindBlock(vaddr);   // attempt to find it
    DEBUG(DEBUG_V, "CacheManager: Access Request, tag 0x%llx, set 0x%x, offset 0x%x, length %d\n", tag, set, offset, nbytes);
    
    if(write)
        history.num_writes++;
    else history.num_reads++;

    if(target == NULL){     // miss
        history.num_misses++;
        if (write && !write_allocate){
            AccessLowerLayer(vaddr, nbytes, write, data, time);
        }
        // else, need to find a block for replacement:
        target = FindReplace(vaddr, time);
        // fetch from lower cache when...
        // READ enable OR write allocate
        AccessLowerLayer(vaddr & ~block_mask, (int)block_size, 0, target->dataptr, time);
        target->status = CACHEBLK_VALID;
        target->tag = tag;
        // data transaction
        if(!write)
            memcpy(data, target->dataptr + offset, nbytes);
        else{
            memcpy(target->dataptr + offset, data, nbytes);
            target->status = CACHEBLK_DIRTY;
        }
    }else{      // hit
        // READ enable: 
        // just cpy data and return
        history.num_hits++;
        if(write){
            memcpy(target->dataptr + offset, data, nbytes);
            if(write_through)   // write through: change cache and lower layer cache... until memory
                AccessLowerLayer(vaddr, nbytes, write, data, time);
            else target->status = CACHEBLK_DIRTY;
            // fprintf(stdout, "wrote data: 0x%llx\n", *(ull*)target->dataptr);
        }
        else    // read 
            memcpy(data, target->dataptr + offset, (size_t)nbytes);
    }
    target->last_access = ++time_stamp;   // LRU
}


void Cache::printHistory(){
    fprintf(stdout, "-----------------------Cache History--------------------\n");
    fprintf(stdout, "Num Reads: %d\n", history.num_reads);
    fprintf(stdout, "Num Writes: %d\n", history.num_writes);
    fprintf(stdout, "Num Hits: %d\n", history.num_hits);
    fprintf(stdout, "Num Misses: %d\n", history.num_misses);
    fprintf(stdout, "Miss Rate: %.2f\n", (float)history.num_misses / (history.num_hits + history.num_misses));
}

void Cache::printParameters(){
    fprintf(stdout, "----------------------Cache Parameters-------------------\n");
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

// ____________________________ Configs ________________________________
int cfg_nlayers = 1;
int cfg_bsize[] = {8};
int cfg_nsets[] = {8};
int cfg_assoc[] = {1};
POLICY cfg_policy[] = {LRU};
bool cfg_through[] = {false};
bool cfg_allocate[] = {true};
