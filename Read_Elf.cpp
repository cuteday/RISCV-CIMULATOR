#include"Read_Elf.h"

ElfReader::ElfReader(const char filename[]){
	// print to stdout by default
	file = fopen(filename, "r");
	elf = stdout;
	mem_offset = 0x7FFFFFFF;

	assert(file != NULL);
	assert(elf != NULL);
	read_elf();
}

void ElfReader::read_elf(){
	DEBUG(DEBUG_E,"ELF Header:\n");
	read_Elf_header();

	DEBUG(DEBUG_E,"\n\nSection Headers:\n");
	read_elf_sections();

	DEBUG(DEBUG_E,"\n\nProgram Headers:\n");
	read_Phdr();

	DEBUG(DEBUG_E,"\n\nSymbol table:\n");
	read_symtable();

	parse_results();

	if(elfname)fclose(elf);
}

void ElfReader::read_Elf_header(){
	//file should be relocated

	fread(&elf64_hdr,1,sizeof(elf64_hdr),file);

	assert(*((uint*)elf64_hdr.e_ident) == 0x464c457f);	// secret code > <
	assert(elf64_hdr.e_ident[4] == 2);					// only type elf64 supported
	assert(elf64_hdr.e_ident[5] == 1);					// little endian

	pnum = *(ushort *)&elf64_hdr.e_phnum;
	padr = *(ull *)&elf64_hdr.e_phoff;
	psize = *(ushort *)&elf64_hdr.e_phentsize;
	snum = *(ushort *)&elf64_hdr.e_shnum;
	sadr = *(ull *)&elf64_hdr.e_shoff;
	ssize = *(ushort *)&elf64_hdr.e_shentsize;

	DEBUG(DEBUG_E," magic number:  ");
	for (int i = 0; i < 16;i++)
		DEBUG(DEBUG_E, "%02x ", elf64_hdr.e_ident[i]);
	DEBUG(DEBUG_E, "\n Class:  ELFCLASS64\n");
	DEBUG(DEBUG_E," Data:  little-endian\n");
	DEBUG(DEBUG_E," Version:  %d \n", elf64_hdr.e_ident[6]);
	DEBUG(DEBUG_E," OS/ABI:	 System V ABI\n");
	DEBUG(DEBUG_E," ABI Version:  %d \n", elf64_hdr.e_ident[8]);
	DEBUG(DEBUG_E," Type: 0x%08x ", *(uint*)&elf64_hdr.e_type);
	DEBUG(DEBUG_E, " Machine:  %d \n", *(uint*)&elf64_hdr.e_machine);
	DEBUG(DEBUG_E," Version: 0x%x \n", *(uint*)&elf64_hdr.e_version);
	DEBUG(DEBUG_E," Entry point address:  0x%x\n", *(uint*)&elf64_hdr.e_entry);
	DEBUG(DEBUG_E, " Start of program headers:  %lld  bytes into  file\n", padr);
	DEBUG(DEBUG_E, " Start of section headers:  %lld  bytes into  file\n", sadr);
	DEBUG(DEBUG_E," Flags:  0x%08x\n", *(uint*)&elf64_hdr.e_flags);
	DEBUG(DEBUG_E," Size of this header: %u Bytes\n", *(ushort*)&elf64_hdr.e_ehsize);
	DEBUG(DEBUG_E," Size of program headers: %u Bytes\n", psize);
	DEBUG(DEBUG_E," Number of program headers: %u \n", pnum);
	DEBUG(DEBUG_E, " Size of section headers: %u Bytes\n", ssize);
	DEBUG(DEBUG_E," Number of section headers: %u \n", snum);
	DEBUG(DEBUG_E, " Section header string table index: %u \n", *(ushort*)&elf64_hdr.e_shstrndx);

}

void ElfReader::read_elf_sections()
{
	Elf64_Shdr elf64_shdr;
	fseek(file, sadr + *(ushort*)&elf64_hdr.e_shstrndx * sizeof(Elf64_Shdr), 0);
	fread(&elf64_shdr, 1, sizeof(Elf64_Shdr), file);
	section_name = new char[*(ull *)&elf64_shdr.sh_size + 1];
	fseek(file, *(ull *)&elf64_shdr.sh_offset, 0);
	fread(section_name, 1, *(ull *)&elf64_shdr.sh_size, file);
	// read the header string table into memory...
	fseek(file, sadr, 0);
	
	for(int c=0;c<snum;c++){
		DEBUG(DEBUG_E," [%3d]\n",c);
	
		//file should be relocated
		fread(&elf64_shdr,1,sizeof(elf64_shdr),file);

		char *sector_name = section_name + *(uint *)&elf64_shdr.sh_name;

		DEBUG(DEBUG_E, " Name: %-13s", sector_name);
		DEBUG(DEBUG_E," Type: %03u", *(uint*)&elf64_shdr.sh_flags);
        DEBUG(DEBUG_E,"  Address: 0x%016llx", *(ull*)&elf64_shdr.sh_addr);
        DEBUG(DEBUG_E,"  Offest: 0x%016llx\n", *(ull*)&elf64_shdr.sh_offset);
        DEBUG(DEBUG_E,"  Size: 0x%016llx", *(ull*)&elf64_shdr.sh_size);
        DEBUG(DEBUG_E,"  Entsize: 0x%016llx", *(ull*)&elf64_shdr.sh_entsize);
        DEBUG(DEBUG_E,"  Link: %u", *(uint*)&elf64_shdr.sh_link);
        DEBUG(DEBUG_E,"  Info: %u", *(uint*)&elf64_shdr.sh_info);
        DEBUG(DEBUG_E,"  Align: %llu\n", *(ull*)&elf64_shdr.sh_addralign);

		if(!strcmp(sector_name, ".symtab")){
			symadr = *(ull *)&elf64_shdr.sh_offset;
			symsize = *(ull *)&elf64_shdr.sh_size;
			symnum = symsize / sizeof(Elf64_Sym);
		}

		if(!strcmp(sector_name, ".strtab")){
			stradr = *(ull *)&elf64_shdr.sh_offset;
			strsize = *(ull *)&elf64_shdr.sh_size;
		}
	}
	str_table = new char[strsize + 1];
	fseek(file, stradr, 0);
	fread(str_table, 1, strsize, file);
}

void ElfReader::read_Phdr(){
	fseek(file, padr, 0);
	Elf64_Phdr elf64_phdr;
	for(int c=0;c<pnum;c++){
		fread(&elf64_phdr,1,sizeof(elf64_phdr),file);

		DEBUG(DEBUG_E," [%3d]\n",c);	
		//file should be relocated
		DEBUG(DEBUG_E," Type: %d ",*(uint*)&elf64_phdr.p_type);
		DEBUG(DEBUG_E," Flags: 0x%08x ", *(uint*)&elf64_phdr.p_flags);
		DEBUG(DEBUG_E," Offset: 0x%016llx", *(ull*)&elf64_phdr.p_offset);
        DEBUG(DEBUG_E," VirtAddr: 0x%016llx", *(ull*)&elf64_phdr.p_vaddr);
        DEBUG(DEBUG_E," PhysAddr: 0x%016llx\n", *(ull*)&elf64_phdr.p_paddr);
        DEBUG(DEBUG_E," FileSiz: 0x%016llx", *(ull*)&elf64_phdr.p_filesz);
        DEBUG(DEBUG_E," MemSiz: 0x%016llx", *(ull*)&elf64_phdr.p_memsz);
		DEBUG(DEBUG_E," Align: 0x%llx\n", *(ull*)&elf64_phdr.p_align);

		mem_offset = min((ull)mem_offset, *(ull *)&elf64_phdr.p_vaddr);
		phdrs.push_back(elf64_phdr);

		// if (*(uint*)&elf64_phdr.p_flags == 0x05 && *(uint*)&elf64_phdr.p_type == PT_LOAD){
			
		// 	cadr = *(ull*)&elf64_phdr.p_offset;
        //     csize = *(ull*)&elf64_phdr.p_filesz;
        //     cvadr = *(ull*)&elf64_phdr.p_vaddr;
        // }
	}
}


void ElfReader::read_symtable(){
	fseek(file, symadr, 0);
	Elf64_Sym elf64_sym;

	for(int c=0;c<symnum;c++){
		
		fread(&elf64_sym,1,sizeof(Elf64_Sym),file);
		DEBUG(DEBUG_E," [%3d]   ",c);

		char *sym_name = str_table + *(uint *)&elf64_sym.st_name;
		//file should be relocated
		DEBUG(DEBUG_E," Name:   %-20s  ", sym_name);
		DEBUG(DEBUG_E," Bind: %012x ", *(uint*)&elf64_sym.st_info>>4);
		DEBUG(DEBUG_E," Type: %d ", *(uint*)&elf64_sym.st_info&0xf);
		DEBUG(DEBUG_E,"  NDX: %-6hu", *(ushort*)&elf64_sym.st_shndx);
        DEBUG(DEBUG_E,"  Size: 0x%-16llx", *(ull*)&elf64_sym.st_size);
        DEBUG(DEBUG_E,"  Value: %016llx\n", *(ull*)&elf64_sym.st_value);

		if(!strcmp(sym_name, "main")){
			entry = madr = *(ull*)&elf64_sym.st_value;
			endPC = madr + *(ull *)&elf64_sym.st_size;
		}
		if (!strcmp(sym_name, "__global_pointer$")){
            gp = *(ull*)&elf64_sym.st_value;
        }
	}
}


void ElfReader::parse_results(){
	DEBUG(DEBUG_E, "Elf parsing results:\n");
	DEBUG(DEBUG_E, "entry: %08x, endPC: %08x\n", entry, endPC);
	// DEBUG(DEBUG_E, "code section: 0x%08x, size: 0x%05x, at file 0x%08x\n", cvadr, csize, cadr);
}