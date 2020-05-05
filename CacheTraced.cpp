#include "Cache.h"
#include <iostream>
#include <fstream>
using namespace std;
/*
    trace file input formatt:
    [read/write indicator] [space] [addr]
*/

int cfg_access_size = 1; 
// __________________________________________ Default Configs ______________________________________________
// Config Format: assoc, bsize, nsets, policy, WT, WA, name[Optional], latency{hit, bus}
#define cfg_cache_num_layers  1
CacheConfig cfg_cache_[] = {
    {8, 128, 128, LRU, false, true, "L1 Cache", {1, 0}},      // default L1
    {32, 256, 256, LRU, false, true, "L2 Cache", {8, 0}},      // default L2
};
vector<CacheConfig> cfg_cache(cfg_cache_, cfg_cache_ + cfg_cache_num_layers);

vector<StorageStats> run_test(vector<CacheConfig> &cfg, const char *trace_file, bool hex_input){
    fprintf(stdout, "Start running test: %-15s, input: %s\n", trace_file, hex_input ? "hex" : "dec");
    Memory *memory = new Memory(MEMSIZE, "Memory", true);
    Cache *cache = build_cache(cfg, memory);
    ifstream file(trace_file);
    char type;
    int cycles = 0;
    ull addr;
    ull data;                       // 虚假的data指针
    vector<StorageStats> stats_list;   // 存一下多层存储器的统计信息
    while (file >> type){
        if(hex_input)
            file >> hex >> addr;
        else file >> dec >> addr;
        if(type=='r')
            cache->Read(addr, cfg_access_size, &data, cycles);
        else if (type == 'w')
            cache->Write(addr, cfg_access_size, data, cycles);
        else{
            fprintf(stderr, "Unexpected R/W type T T\n");
            assert(false);
        }
    }
    fprintf(stdout, "Total Cycles of %-15s: %d \n", trace_file, cycles);
    cache->printStatisticsAll();
    cache->getStatisticsAll(stats_list);
    return stats_list;
}

// List of test funcs in LAB3
void run_test_ex1();
void run_test_ex1_1(const char *trace_file, const char *out_file);
void run_test_ex1_2(const char *trace_file, const char *out_file);
void run_test_ex1_3(const char *trace_file, const char *out_file);
void run_test_ex3_1(const char *trace_file);

int main(int argc, char *argv[]){
    char *trace_file = NULL;
    bool hex_input = false;

    for (int i = 0; i < argc;i++){
        if(!strcmp(argv[i], "-f")){
            if(i == argc - 1)
                fprintf(stderr, "Trace file not specified!\n");
            trace_file = argv[++i];
        }
        if(!strcmp(argv[i], "-hex"))
            hex_input = true;
        if(!strcmp(argv[i], "-v"))
            debug_on[DEBUG_V] = true;
        if(!strcmp(argv[i], "-runt1")){
            run_test_ex1();
            exit(0);
        }
        if(!strcmp(argv[i], "-runt3")){
            run_test_ex3_1("./tests/trace/01-mcf-gem5-xcg.trace");
            run_test_ex3_1("./tests/trace/02-stream-gem5-xaa.trace");
            exit(0);
        }
    }
    if(trace_file)
        run_test(cfg_cache, trace_file, hex_input);
    return 0;
}


// ____________________________________ Tests ____________________________________

void run_test_ex1_1(const char* trace_file, const char* out_file){
    // 1 在不同的 Cache Size（ 32KB ~ 32MB） 的条件下， Miss Rate 随 Block Size变化的趋势
    // 32kb = 2^15, 32mb = 2^25; assoc is fixed to 8, nsets is changing relatively
    int assoc = 8;
    ofstream ofile(out_file);
    for (int block_size = 1 << 5; block_size <= 1 << 10;block_size<<=1)
        ofile << ",BlockSize:" << block_size;
    for (int cache_size = 1 << 15; cache_size <= 1 << 25; cache_size <<= 1){
        ofile << "\r\n" << cache_size;
        for (int block_size = 1 << 5; block_size <= 1 << 10; block_size <<= 1){
            int nsets = (cache_size / assoc) / block_size;
            CacheConfig cur_cfg[] = {{assoc, block_size, nsets, LRU, false, true, "L1 Cache"}};
            vector<CacheConfig> cfg(cur_cfg, cur_cfg + 1);
            StorageStats stats = run_test(cfg, trace_file, false)[0];
            ofile << "," << GETMR(stats);
        }
    }
    ofile.close();
}

void run_test_ex1_2(const char* trace_file, const char* out_file){
    // 2 在不同的 Cache Size 的条件下， Miss Rate 随 Associativity（1-32） 变化的趋势
    // block size is fixed to 256, nsets is changing relatively
    int bsize = 256;
    ofstream ofile(out_file);
    for (int associativity = 1; associativity  <=  32; associativity <<=1)
        ofile << ",Associativity:" << associativity;
    for (int cache_size = 1 << 15; cache_size <= 1 << 25; cache_size <<= 1){
        ofile << "\r\n" << cache_size;
        for (int associativity = 1; associativity  <=  32; associativity <<=1){
            int nsets = (cache_size / bsize) / associativity;
            CacheConfig cur_cfg[] = {{associativity, bsize, nsets, LRU, false, true, "L1 Cache"}};
            vector<CacheConfig> cfg(cur_cfg, cur_cfg + 1);
            StorageStats stats = run_test(cfg, trace_file, false)[0];
            ofile << "," << GETMR(stats);
        }
    }
    ofile.close();
}

void run_test_ex1_3(const char* trace_file, const char* out_file){
    // 3 比较 Write Through 和 Write Back、 Write Allocate 和 No-write Allocate 的总访问延时的差异。    
    // fixed params: bsize 128, nsets 256, assoc 8
    int bsize = 256, nsets = 128, assoc = 8;
    ofstream ofile(out_file);
    ofile << "WriteThrough,WriteAllocate,MissRate\r\n";
    for (int write_through = 0; write_through <= 1;write_through++)
        for (int write_allocate = 0;write_allocate<=1;write_allocate++){
            CacheConfig cur_cfg[] = {{assoc, bsize, nsets, LRU, write_through, write_allocate, "L1 Cache"}};
            vector<CacheConfig> cfg(cur_cfg, cur_cfg + 1);
            StorageStats stats = run_test(cfg, trace_file, false)[0];
            double missrate = GETMR(stats);
            ofile << write_through << "," << write_allocate << "," << missrate << "\r\n";
        }
    ofile.close();
}

void run_test_ex3_1(const char* trace_file){
    CacheConfig cfg_[] = {
        {8, 64, 64, LRU, false, true, "L1 Cache", {3, 0}},          // default L1
        {8, 64, 512, LRU, false, true, "L2 Cache", {4, 0}},         // default L2
        {8, 64, 16384, LRU, false, true, "L3 Cache", {10, 0}},      // default L3
    };
    vector<CacheConfig> cfg(cfg_, cfg_ + 3);
    vector<StorageStats> stats = run_test(cfg, trace_file, true);
}

void run_test_ex1(){
    POLICY policy = LRU;
    bool wthrough = false;
    bool wallocate = false;

    run_test_ex1_1("./tests/trace/1.trace", "./ex1_1_csize_bsize_trace1.csv");
    run_test_ex1_1("./tests/trace/2.trace", "./ex1_1_csize_bsize_trace2.csv");

    run_test_ex1_2("./tests/trace/1.trace", "./ex1_2_csize_assoc_trace1.csv");
    run_test_ex1_2("./tests/trace/2.trace", "./ex1_2_csize_assoc_trace2.csv");

    run_test_ex1_3("./tests/trace/1.trace", "./ex1_3_WA_WT_trace1.csv");
    run_test_ex1_3("./tests/trace/2.trace", "./ex1_3_WA_WT_trace2.csv");

}