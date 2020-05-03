TEST_FILES = add.c\
			mul-div.c\
			qsort.c\
			simple-fuction.c\
			n!.c\

OBJS := $(patsubst %c,%riscv,$(TEST_FILES))
REFS := $(patsubst %c,%asm,$(TEST_FILES))

CC = riscv64-unknown-elf-gcc -Wa,-march=rv64im
OBJDUMP = riscv64-unknown-elf-objdump -D
CFLAGS = 

all: $(OBJS)  $(REFS)

%.riscv: %.c
	$(CC) $(CFLAGS)  -o $@ $^ 

%.asm: %.riscv
	$(OBJDUMP)  $< > $@

.PHONY: clean
clean:
	rm *.riscv *.asm
