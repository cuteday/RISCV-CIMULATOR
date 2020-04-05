TEST_FILES = ackerman.c\
			mat-mul.c\
			qsort.c\
			ecall.c\

OBJS := $(patsubst %c,%riscv,$(TEST_FILES))
REFS := $(patsubst %c,%asm,$(TEST_FILES))

CC = riscv64-unknown-elf-gcc -Wa,-march=rv64im
OBJDUMP = riscv64-unknown-elf-objdump -D
CFLAGS = 

all: $(OBJS) $(REFS)

%.riscv: %.c syscall.c
	$(CC) $(CFLAGS)  -o $@ $^ 

%.asm: %.riscv
	$(OBJDUMP)  $< > $@

.PHONY: clean
clean:
	rm *.riscv *.asm

# 学习时间到！灯花小课堂开课啦
# 关于gcc -march参数 其指定的是目标机器ISA
# 常用的就是RV32I和RV64I
# 扩展指令集需要在后面加扩展类型：
# M(mult)
# A(atomic)
# F(single precision float)
# D(double precision float)
# C(compressed instruction)
# 例如：-march=rv64im