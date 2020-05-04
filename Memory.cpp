#include "Memory.h"

// _________________________________________________________________________
// Simulator <-> (First Layer)Storage interface warpper
void Storage::Read(addr64_t addr, int nbytes, ull *data, int &time, bool sign_ext){
    if(nbytes==1){
        char value;
        HandleRequest(addr, nbytes, 0, (char*)&value, time);
        *data = sign_ext ? (ll)value : (ll)(uchar)value;
    }else if(nbytes ==2){
        short value;
        HandleRequest(addr, nbytes, 0, (char*)&value, time);
        *data = sign_ext? (ll)value : (ll)(ushort)value;
    }else if(nbytes ==4){
        int value;
        HandleRequest(addr, nbytes, 0, (char*)&value, time);
        *data = sign_ext? (ll)value : (ll)(uint)value;
    }else if(nbytes==8){
        HandleRequest(addr, nbytes, 0, (char*)data, time);
    }else{
        fprintf(stderr, "Unsupported size %d for fetching cache > <\n", nbytes);
    }
    DEBUG( DEBUG_V, "StorageManager: %s Reading VA 0x%08x, size %d, value 0x%llx\n", name, addr, nbytes, *data);
}

void Storage::Write(addr64_t addr, int nbytes, ull data, int &time){
	DEBUG( DEBUG_V, "StorageManager: %s Writing VA 0x%08x, size %d, value 0x%llx\n", name, addr, nbytes, data);
    if(nbytes==1){
        char value = data;
        HandleRequest(addr, nbytes, 1, (char *)&value, time);
    }else if(nbytes ==2){
        short value = data;
        HandleRequest(addr, nbytes, 1, (char *)&value, time);
    }else if(nbytes ==4){
        int value = data;
        HandleRequest(addr, nbytes, 1, (char *)&value, time);
    }else if(nbytes==8){
        HandleRequest(addr, nbytes, 1, (char *)&data, time);
    }else{
        fprintf(stderr, "Unsupported size %d for writing cache > <\n", nbytes);
    }
}

Memory::Memory(int size, const char *name_, bool trace_mode_):memsize(size){
    memory = new char[size];
    name = name_ == NULL ? "Memory" : name_;
    trace_mode = trace_mode_;
    lower = NULL;
    offset = 0;
    memset(memory, 0, size);
}

addr64_t Memory::Translate(int vaddr){
    // paddr + offset = vaddr
    return vaddr - offset;
}

// Cache API ver. returns latency estimated > <
void Memory::HandleRequest(addr64_t vaddr, int nbytes, bool write, char *data, int &time){
    int addr = Translate(vaddr);
    int timing = latency.hit_latency + latency.bus_latency;
    stats.access_time += timing;
    time += timing;
    if(write)stats.num_writes++;
    else stats.num_reads++;
    if(trace_mode) return; // 使用trace 不作实际读写 (地址空间太大了额)

    if (write){
        memcpy(memory + addr, data, nbytes);
    }
    else{
        memcpy(data, memory + addr, nbytes);
    }
    // DEBUG(DEBUG_V, "MemoryManager: Directly accessing -> vaddr 0x%x, write: %d, size: %d, value: %llx\n", vaddr, write, nbytes, *(ll*)data);
}

void Memory::printParameters(){
    fprintf(stdout, "-----------------------%s Parameters--------------------\n", name);
    fprintf(stdout, "Memory Size: %lld\n", memsize);
}
void Memory::printStatistics(){
    fprintf(stdout, "-----------------------%s Statistics--------------------\n", name);
    fprintf(stdout, "Num Reads: %d\n", stats.num_reads);
    fprintf(stdout, "Num Writes: %d\n", stats.num_writes);
}

void Memory::Loader(FILE *elf, std::vector<Elf64_Phdr> &phdrs, ull offset_){
    offset = offset_;
    for (int i = 0; i < phdrs.size(); i++){
        Elf64_Phdr& elf64_phdr = phdrs[i];
		fseek(elf, *(ull *)&elf64_phdr.p_offset, 0);
		fread(memory + *(ull *)&elf64_phdr.p_vaddr - offset, 1, *(ull*)&elf64_phdr.p_filesz, elf);
    }
}

void Memory::DumpMem(const char filename[]){
    FILE *file = fopen(filename, "w");
    //for (int i = 0; i < memsize;i++)
    fwrite(memory, 1, memsize, file);
    fclose(file);
    fprintf(stdout, "Memory dumped to %s \n", filename);
}