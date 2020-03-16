#include<cstdio>
#include<cstring>
#include<cassert>
#include "utility.h"

// 单独处理nop
// 认为nop == addi x0 x0

typedef struct{
	unsigned char b[8];
}int64;

typedef struct{
	unsigned char b[4];
}int32;

typedef struct{
	unsigned char b[2];
}int16;

typedef struct{
	unsigned char b;
}int8;

typedef int64 Elf64_Addr;
typedef int64 Elf64_Off;
typedef int64 Elf64_Xword;
typedef int64 Elf64_Sxword;
typedef int32 Elf64_Word;
typedef int32 Elf64_Sword;
typedef int16 Elf64_Half;

#define	EI_CLASS 4
#define	EI_DATA 5
#define	EI_VERSION 6
#define	EI_OSABI 7
#define	EI_ABIVERSION 8
#define	EI_PAD 9
#define	EI_NIDENT 16

#define	SHN_UNDEF 0
#define	SHN_LOPROC 0xFF00
#define	SHN_HIPROC 0xFF1F
#define	SHN_LOOS 0xFF20
#define	SHN_HIOS 0xFF3F
#define	SHN_ABS 0xFFF1
#define	SHN_COMMON 0xFFF2

#define PT_NULL		0
#define PT_LOAD		1
#define PT_DYNAMIC	2
#define PT_INTERP	3
#define PT_NOTE		4
#define PT_SHLIB	5
#define PT_PHDR		6
#define PT_TLS    	7
#define PT_NUM    	8
#define PT_LOOS   	0x60000000
#define PT_HIOS   	0x6fffffff
#define PT_LOPROC 	0x70000000
#define PT_HIPROC	0x7fffffff

typedef struct	// File Header
{
	unsigned char e_ident[16]; /* ELF identification : Magic number and others */
	Elf64_Half e_type; /* Object file type */
	Elf64_Half e_machine; /* Machine type : Big/Little Endian? */
	Elf64_Word e_version; /* Object file version */
	Elf64_Addr e_entry; /* Entry point address : <_start> ☆-- */
	Elf64_Off e_phoff; /* Program header offset */
	Elf64_Off e_shoff; /* Section header offset */
	Elf64_Word e_flags; /* Processor-specific flags */
	Elf64_Half e_ehsize; /* ELF header size */
	Elf64_Half e_phentsize; /* Size of program header entry */
	Elf64_Half e_phnum; /* Number of program header entries */
	Elf64_Half e_shentsize; /* Size of section header entry */
	Elf64_Half e_shnum; /* Number of section header entries */
	Elf64_Half e_shstrndx; /* Section name string table index */
} Elf64_Ehdr;

typedef struct	// Section Header in SH Table
{
	Elf64_Word sh_name; /* Section name (offset in .shstrtab☆☆)*/
	Elf64_Word sh_type; /* Section type */
	Elf64_Xword sh_flags; /* Section attributes */
	Elf64_Addr sh_addr; /* Virtual address in memory */
	Elf64_Off sh_offset; /* Offset in file */
	Elf64_Xword sh_size; /* Size of section */
	Elf64_Word sh_link; /* Link to other section */
	Elf64_Word sh_info; /* Miscellaneous information */
	Elf64_Xword sh_addralign; /* Address alignment boundary */
	Elf64_Xword sh_entsize; /* Size of entries, if section has table */
} Elf64_Shdr;

typedef struct	// Symbol in Symble Table
{
	Elf64_Word st_name; /* Symbol name (offset in .strtab☆☆)*/
	unsigned char st_info; /* Type and Binding attributes */
	unsigned char st_other; /* Reserved */
	Elf64_Half st_shndx; /* Section table index */
	Elf64_Addr st_value; /* Symbol value */
	Elf64_Xword st_size; /* Size of object (e.g., common) */
} Elf64_Sym;


typedef struct	// Program Header
{
	Elf64_Word p_type; /* Type of segment */
	Elf64_Word p_flags; /* Segment attributes */
	Elf64_Off p_offset; /* Offset in file */
	Elf64_Addr p_vaddr; /* Virtual address in memory */
	Elf64_Addr p_paddr; /* Reserved */
	Elf64_Xword p_filesz; /* Size of segment in file */
	Elf64_Xword p_memsz; /* Size of segment in memory */
	Elf64_Xword p_align; /* Alignment of segment */
} Elf64_Phdr;



class ElfReader{
public:
	ElfReader(char *filename, char* elfname = NULL);
	void read_elf();
	void read_Elf_header();
	void read_elf_sections();
	void read_symtable();
	void read_Phdr();

	FILE *file;
	FILE *elf;
	Elf64_Ehdr elf64_hdr;

	char *section_name;	//	at Header String Table Index in ELF_HEADER
	char *str_table;; 	//	at Section .strtab

	//代码段在解释文件中的偏移地址
	unsigned int cadr;
	//代码段的长度
	unsigned int csize;
	//代码段在内存中的虚拟地址
	unsigned int cvadr;
	//全局数据段在内存的地址
	unsigned long long gp;
	//main函数在内存中地址
	unsigned int madr;
	//程序结束时的PC
	unsigned int endPC;
	//程序的入口地址
	unsigned int entry;

	unsigned int dadr;
	unsigned int dsize;
	unsigned int dvadr;


	//Program headers
	ull padr;
	unsigned int psize;
	unsigned int pnum;
	//Section Headers
	ull sadr;
	unsigned int ssize;
	unsigned int snum;
	//Symbol table
	unsigned int symnum;
	ull symadr;
	unsigned int symsize;
	//用于指示 包含节名称的字符串是第几个节（从零开始计数）
	unsigned int index;
	//字符串表在文件中地址，其内容包括.symtab和.debug节中的符号表
	ull stradr;
	unsigned int strsize;
};
