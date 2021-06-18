C-SOURCE=main.c
ASM-SOURCE=popcnt.s

ASM-OUTPUT=$(ASM-SOURCE:%.s=%.o)
C-OUTPUT=$(C-SOURCE:%.c=%.o)

MAIN-TARGET=main

BIT-ARCH=32

C-PARAMETER=--std=gnu99 -m$(BIT-ARCH)
ASM-PARAMETER=--$(BIT-ARCH)

LINK-PARAMETER=-m$(BIT-ARCH)

ASSEMBLER=as
COMPILER=gcc
#erst
#as --32 popcnt.s -o popcnt.o 
#dann
#gcc -m32  main.o popcnt.o -o main

all: $(MAIN-TARGET)

$(MAIN-TARGET):  $(ASM-OUTPUT) $(C-OUTPUT)
	$(COMPILER) $(LINK-PARAMETER) $^ -o $@


%.o: %.s Makefile
	$(ASSEMBLER) $(ASM-PARAMETER) $< -o $@
	
%.o: %.c Makefile
	$(COMPILER) -c  $(C-PARAMETER) $< -o $@

clean:
	rm -rf $(MAIN-TARGET) $(ASM-OUTPUT) $(C-OUTPUT)
	
run: $(MAIN-TARGET)
	./$(MAIN-TARGET)