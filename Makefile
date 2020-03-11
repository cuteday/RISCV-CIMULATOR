# Hi Hi!
# <target> : <prerequisites> 
# [tab]  <commands>	

CC = c++
CFLAGS = 
LIBS = 

EXEC = run

H_COMMON = ./utility.h\
		./Reg_def.h \

H_FILES = ./utility.h\
		./Read_Elf.h\
		./Reg_def.h\
		./Simulation.h\

C_FILES = ./main.cpp\
		./Read_Elf.cpp\
		./Simulation.cpp\

O_FILES = main.o Read_Elf.o Simulation.o utility.o

$(EXEC): $(O_FILES)
	$(CC) $(CFLAGS) -o $(EXEC) $(O_FILES)

main.o:	./Read_Elf.h \
		$(H_COMMON)

Simulation.o: ./Simulation.h \
			./Read_Elf.h \
			$(H_COMMON)

Read_Elf.o: ./Read_Elf.h \
			$(H_COMMON)

utility.o: $(H_COMMON)

clean: 
	rm $(O_FILES) $(EXEC)