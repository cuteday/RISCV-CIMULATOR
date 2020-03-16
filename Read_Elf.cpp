#include"Read_Elf.h"

ElfReader::ElfReader(char* filename, char* elfname){
	// print to stdout bu default
	file = fopen(filename, "r");
	if(elfname == NULL)
		// elf = stdin;
		elf = stdout;
	else
		elf = fopen(elfname, "rw");
	assert(file != NULL);
	assert(elf != NULL);
}

void ElfReader::read_elf(){
	fprintf(elf,"ELF Header:\n");
	read_Elf_header();

	fprintf(elf,"\n\nSection Headers:\n");
	read_elf_sections();

	fprintf(elf,"\n\nProgram Headers:\n");
	read_Phdr();

	fprintf(elf,"\n\nSymbol table:\n");
	read_symtable();

	fclose(elf);
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

	fprintf(elf," magic number:  ");
	for (int i = 0; i < 16;i++)
		fprintf(elf, "%02x ", elf64_hdr.e_ident[i]);
	fprintf(elf, "\n Class:  ELFCLASS64\n");
	fprintf(elf," Data:  little-endian\n");
	fprintf(elf," Version:  %d \n", elf64_hdr.e_ident[6]);
	fprintf(elf," OS/ABI:	 System V ABI\n");
	fprintf(elf," ABI Version:  %d \n", elf64_hdr.e_ident[8]);
	fprintf(elf," Type: 0x%08x ", *(uint*)&elf64_hdr.e_type);
	fprintf(elf, " Machine:  %d \n", *(uint*)&elf64_hdr.e_machine);
	fprintf(elf," Version: 0x%x \n", *(uint*)&elf64_hdr.e_version);
	fprintf(elf," Entry point address:  0x%x\n", *(uint*)&elf64_hdr.e_entry);
	fprintf(elf, " Start of program headers:  %lld  bytes into  file\n", padr);
	fprintf(elf, " Start of section headers:  %lld  bytes into  file\n", sadr);
	fprintf(elf," Flags:  0x%08x\n", *(uint*)&elf64_hdr.e_flags);
	fprintf(elf," Size of this header: %u Bytes\n", *(ushort*)&elf64_hdr.e_ehsize);
	fprintf(elf," Size of program headers: %u Bytes\n", psize);
	fprintf(elf," Number of program headers: %u \n", pnum);
	fprintf(elf, " Size of section headers: %u Bytes\n", ssize);
	fprintf(elf," Number of section headers: %u \n", snum);
	fprintf(elf, " Section header string table index: %u \n", *(ushort*)&elf64_hdr.e_shstrndx);

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
		fprintf(elf," [%3d]\n",c);
	
		//file should be relocated
		fread(&elf64_shdr,1,sizeof(elf64_shdr),file);

		char *sector_name = section_name + *(uint *)&elf64_shdr.sh_name;

		fprintf(elf, " Name: %-13s", sector_name);
		fprintf(elf," Type: %03u", *(uint*)&elf64_shdr.sh_flags);
        fprintf(elf,"  Address: 0x%016llx", *(ull*)&elf64_shdr.sh_addr);
        fprintf(elf,"  Offest: 0x%016llx\n", *(ull*)&elf64_shdr.sh_offset);
        fprintf(elf,"  Size: 0x%016llx", *(ull*)&elf64_shdr.sh_size);
        fprintf(elf,"  Entsize: 0x%016llx", *(ull*)&elf64_shdr.sh_entsize);
        fprintf(elf,"  Link: %u", *(uint*)&elf64_shdr.sh_link);
        fprintf(elf,"  Info: %u", *(uint*)&elf64_shdr.sh_info);
        fprintf(elf,"  Align: %llu\n", *(ull*)&elf64_shdr.sh_addralign);

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

		fprintf(elf," [%3d]\n",c);	
		//file should be relocated
		fprintf(elf," Type: %d ",*(uint*)&elf64_phdr.p_type);
		fprintf(elf," Flags: 0x%08x ", *(uint*)&elf64_phdr.p_flags);
		fprintf(elf," Offset: 0x%016llx", *(ull*)&elf64_phdr.p_offset);
        fprintf(elf," VirtAddr: 0x%016llx", *(ull*)&elf64_phdr.p_vaddr);
        fprintf(elf," PhysAddr: 0x%016llx\n", *(ull*)&elf64_phdr.p_paddr);
        fprintf(elf," FileSiz: 0x%016llx", *(ull*)&elf64_phdr.p_filesz);
        fprintf(elf," MemSiz: 0x%016llx", *(ull*)&elf64_phdr.p_memsz);
		fprintf(elf," Align: 0x%llx\n", *(ull*)&elf64_phdr.p_align);

		if (*(uint*)&elf64_phdr.p_flags == 0x05 && *(uint*)&elf64_phdr.p_type == PT_LOAD){
            cadr = *(ull*)&elf64_phdr.p_offset;
            csize = *(ull*)&elf64_phdr.p_filesz;
            cvadr = *(ull*)&elf64_phdr.p_vaddr;
        }
		if (*(uint*)&elf64_phdr.p_flags == 0x06 && *(uint*)&elf64_phdr.p_type == PT_LOAD){
            dadr = *(ull*)&elf64_phdr.p_offset;
            dsize = *(ull*)&elf64_phdr.p_filesz;
			dvadr = *(ull*)&elf64_phdr.p_vaddr;
        }
	}
}


void ElfReader::read_symtable(){
	fseek(file, symadr, 0);
	Elf64_Sym elf64_sym;

	for(int c=0;c<symnum;c++){
		
		fread(&elf64_sym,1,sizeof(Elf64_Sym),file);
		fprintf(elf," [%3d]   ",c);

		char *sym_name = str_table + *(uint *)&elf64_sym.st_name;
		//file should be relocated
		fprintf(elf," Name:   %-20s  ", sym_name);
		fprintf(elf," Bind: %d ", *(uint*)&elf64_sym.st_info>>4);
		fprintf(elf," Type: %d ", *(uint*)&elf64_sym.st_info&0xf);
		fprintf(elf,"  NDX: %-4hu", *(ushort*)&elf64_sym.st_shndx);
        fprintf(elf,"  Size: %-16llu", *(ull*)&elf64_sym.st_size);
        fprintf(elf,"  Value: %016llx\n", *(ull*)&elf64_sym.st_value);

		if(!strcmp(sym_name, "main")){
			entry = madr = *(ull*)&elf64_sym.st_value;
			endPC = madr + *(ull *)&elf64_sym.st_size;
		}
		if (!strcmp(sym_name, "__global_pointer$")){
            gp = *(ull*)&elf64_sym.st_value;
        }
	}
}


