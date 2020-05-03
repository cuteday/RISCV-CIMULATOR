#include "Cache.h"
#include <iostream>
#include <fstream>
using namespace std;
/*
    input formatt:
    [read/write indicator] [space] [addr]
*/

int cfg_access_size = 1; 
#define cfg_cache_num_layers  1
CacheConfig cfg_cache_l1 = {8, 8, 8, LRU, false, true};
CacheConfig cfg_cache_[] = {cfg_cache_l1};
vector<CacheConfig> cfg_cache(cfg_cache_, cfg_cache_ + cfg_cache_num_layers);

void run_test(Cache* cache, char trace_file[], bool hex_input){
    fprintf(stdout, "Start running test: %-15s, input: %s\n", trace_file, hex_input ? "hex" : "dec");
    ifstream file;
    file.open(trace_file);
    char type;
    int cycles;
    ull addr;
    ull data;   // 虚假的data指针
    while (cin >> type){
        if(hex_input)
            cin >> hex >> addr;
        else cin >> dec >> addr;
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
}

int main(int argc, char *argv[]){
    char *trace_file;
    bool hex_input;

    for (int i = 0; i < argc;i++){
        if(!strcmp(argv[i], "-f")){
            if(i == argc - 1)
                fprintf(stderr, "Trace file not specified!\n");
            trace_file = argv[++i];
        }
        if(!strcmp(argv[i], "-hex"))
            hex_input = true;
    }

    Cache *cache = build_cache(cfg_cache);
    run_test(cache, trace_file, hex_input);
    return 0;
}