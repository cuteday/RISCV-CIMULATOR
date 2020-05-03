#include "Cache.h"
#include <iostream>
#include <fstream>
using namespace std;
/*
    input formatt:
    [read/write indicator] [space] [addr]
*/

int cfg_num_layers = 1;
int cfg_block_size[] = {};
int cfg_num_sets[] = {};
int cfg_associativity[] = {};
bool cfg_write_through[] = {};
bool cfg_write_allocate[] = {};
POLICY cfg_policy[] = {};
int cfg_access_size = 1;    

void run_test(Cache* cache, char trace_file[], bool hex_input){
    fprintf(stdout, "Start running test: %-15s, input: %s\n", trace_file, hex_input ? "hex" : "dec");
    ifstream file;
    file.open(trace_file);
    char type;
    uint cycles;
    ull addr;
    ull data;   // 虚假的data指针
    while (cin >> type){
        if(hex_input)
            cin >> hex >> addr;
        else cin >> dec >> addr;
        if(type=='r')
            cycles+=cache->CacheToReg(addr, 1, &data);
        else if(type=='w')
            cycles+=cache->RegToCache(addr, 1, data);
        else{
            fprintf(stderr, "Unexpected R/W type T T\n");
            assert(false);
        }
    }
    fprintf(stdout, "Total Cycles of %-15s: %d \n", trace_file, cycles);
    cache->printHistory();
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

    Cache *cache = build_cache(cfg_num_layers, 
                            cfg_block_size, 
                            cfg_num_sets, 
                            cfg_associativity, 
                            cfg_policy, 
                            cfg_write_through, 
                            cfg_write_allocate);

    run_test(cache, trace_file, hex_input);
    return 0;
}