# Hi Hi!

CC = g++
CFLAGS = 
LIBS = 
MAKE = make

EXEC = run

H_COMMON = ./Utility.h\
		./Reg_def.h \

H_FILES = ./Utility.h\
		./Read_Elf.h\
		./Reg_def.h\
		./Simulation.h\
		./Memory.h\
		./Instruction.h\
		./Cache.h\

C_FILES = ./main.cpp\
		./Read_Elf.cpp\
		./Simulation.cpp\
		./Memory.cpp\
		./Decode.cpp\
		./Execute.cpp\
		./Cache.cpp\
		./CacheTraced.cpp\

O_FILES = main.o Read_Elf.o Simulation.o Memory.o Utility.o Decode.o Execute.o Cache.o

all: $(EXEC)
	mkdir -p build
	mv $(O_FILES) ./build/
	make runtrace

$(EXEC): $(O_FILES)
	$(CC) $(CFLAGS) -o $(EXEC) $(O_FILES)
	
runtrace: CacheTraced.o Memory.o Utility.o Read_Elf.o Cache.o
	$(CC) $(CFLAGS) -o runtrace $^
	mkdir -p build
	rm -f *.o

main.o:	./Read_Elf.h \
		$(H_COMMON)

Simulation.o: ./Simulation.h \
			./Read_Elf.h \
			./Instruction.h\
			./Memory.h\
			$(H_COMMON)

Memory.o: ./Memory.h\
		./Read_Elf.h \
		$(H_COMMON)

Cache.o: ./Memory.h\
		Cache.h\
		$(H_COMMON)

Decode.o: ./Simulation.h\
		./Instruction.h\
		$(H_COMMON)

Execute.o: ./Simulation.h\
		./Instruction.h\
		$(H_COMMON)

Read_Elf.o: ./Read_Elf.h \
			$(H_COMMON)

Utility.o: $(H_COMMON)

CacheTraced.o: ./Memory.h \
			./Cache.h\
			$(H_COMMON)

.PHONY: clean
clean: 
	rm -f *.o
	rm -f run runtrace
	rm -rf build

cache: Cache.o