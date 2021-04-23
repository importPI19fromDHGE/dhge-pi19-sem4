Rechnerarchitekturen/hardwarenahe Programmierung
================================================

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Inhaltsverzeichnis**

- [Java und Make](#java-und-make)
- [C und Make](#c-und-make)
- [C++ und Make](#c-und-make)
- [Assembler](#assembler)
  - [Inline Assembler in C](#inline-assembler-in-c)
    - [Einfaches Debugging mit `gdb`](#einfaches-debugging-mit-gdb)
    - [Geteilte Variablen zwischen C und Assembler](#geteilte-variablen-zwischen-c-und-assembler)
- [Mögliche Prüfungsaufgaben](#m%C3%B6gliche-pr%C3%BCfungsaufgaben)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!--newpage-->

# Java und Make

- mit ``javac`` kompiliert man eine ``.java``-Datei zu Bytecode
- mit ``java klassenname`` kann man ausführen
- ``make -n`` macht einen Dry-Run

Beispiel-Makefile:

```make
SOURCE=hello.java

OUTPUT=hello

COMPILER=javac

JRE=java

all: $(OUTPUT) # Syntax ziel: vorbedingungen

$(OUTPUT): $(SOURCE) Makefile
        $(COMPILER) $< # $< heißt, der erste Teil wird verwendet

clean:
        rm -rvf ($OUTPUT).class

run: $(OUTPUT)
        $(JRE) $(OUTPUT)
```

# C und Make

- ``gcc -o dateiname source.c`` kompiliert eine C Quelldatei in eine Binary
- make misst am Timestamp einer Datei, ob sie ggf. neu kompiliert o.ä. werden muss
- Vorteil von Make: bei ungeänderten Quellcode wird für ``make run`` nicht neu kompiliert
- ``make -j X`` mit X Prozessorkernen führt Aufgaben parallel aus

Beispiel-Makefile:

```make
SOURCE=main.c

COMPILER=gcc

C-COMP-PARAM=--std=gnu99 -Wall -Wextra #C99 mit lang exts.

OUTFILE=asdf

all: $(COMPILER-OUTPUT)

$(COMPILER-OUTPUT): $(SOURCE) Makefile
        $(COMPILER) $(C-COMP-PARAM) $(SOURCE) -o $(OUTFILE)

clean:
    rm -rvf $(COMPILER-OUTPUT)

run: $(COMPILER-OUTPUT)
    ./$(COMPILER-OUTPUT)

wichtig: aufgabe1 aufgabe2 # zu beachten: $() gehört nur zu Variablen
        ./messung.sh
        @echo "alles fertig" # @ unterdrückt, dass die Aufgabe geprintet wird

aufgabe1:
    echo "a1 start"
    sleep 5
    echo "a1 end"

aufgabe2:
    echo "a2 start"
    sleep 5
    echo "a2 end"
```

# C++ und Make

Aufgabe: jetzt sollen wir ein Makefile schreiben

```make
CPPSOURCE=main.cpp
CSOURCE=main.c
CPPCOMPILER=g++
CCOMPILER=gcc
CPPARAM=-Wall -Wextra
OUTFILE_CPP=asdf
OUTFILE_C=xyz
CPARAM=--std=gnu99 -Wall -Wextra #C99 mit lang exts.


compile-cpp: $(CPPSOURCE) Makefile
	$(CPPCOMPILER) $(CPPARAM) $(CPPSOURCE) -o $(OUTFILE_CPP)

compile-c: $(CSOURCE) Makefile
	$(CCOMPILER) $(CPARAM) $(CSOURCE) -o $(OUTFILE_C)

compile-all: compile-cpp compile-c

clean-all: clean-c clean-cpp

clean-c:
	rm -rvf $(OUTFILE_C)

clean-cpp:
	rm -rvf $(OUTFILE_CPP)

# run unterstützt kein on-demand-kompilieren

run-all: run-c run-cpp

run-c: $(OUTFILE_C)
	./$(OUTFILE_C)

run-cpp: $(OUTFILE_CPP)
	./$(OUTFILE_CPP)
```

# Assembler

## Inline Assembler in C

Über die `asm`-Funktion können Assembler-Befehle direkt in C genutzt werden.

```C
int main(){
	asm("mov rax, 7"); // setze den Wert des Register "rax" auf 7
	asm("mov rbx, 35"); // setze den Wert des Register "rbx" auf 35
	asm("add rbx, rax"); // addiere die Register "rax" und "rbx" -> Ergebnis in "rbx"
	return 0;
}
```

Die Werte in den Registern können mit Hilfe eines Debuggers, wie `gdb` betrachtet werden.

### Einfaches Debugging mit `gdb`

1. Mit `gdb` das zu debuggende compilierte Programm öffnen: `gdb ./main.o`
2. Breakpoint setzen: `break linenumber`
3. Programm auführen: `run [argv]`
4. Programm wird an Breakpoint gestoppt

**Zustand des Programmes inspizieren**

- Wert der Register ausgeben: `info registers`
- Stepping: `step` nächste Instruktion (auch in Funktionen springen)
- Stepping: `next` nächste Instruktion (nicht in Funktionen springen)

### Geteilte Variablen zwischen C und Assembler

```C
long a = 7;
long b = 35;
long c;

asm("mov rax, %1;"
		"mov rbx, %2;"
		"add rbx, rax;"
		"mov %0, rbx;"
		: "=r" (c) /* output operands */
		: "r" (a), "r" (b) /* input operands */
		: "rbx" /* list of clobbered registers */
);
```

- Ein-/Ausgabeoperanden werden durch die Syntax `"contraint" ( operand )` definiert
	- der `constraint` gibt an, in welchem Register `gcc` die Operanden speichern soll (`r` steht dabei für ein beliebiges der Register)
	- für Ausgabe-Operanden wird vor dem `constraint` ein `=` gesetzt (z.B. `"=r"`)
	- gibt es auschließlich Eingabe-Operanden, wird dies durch `::` definiert
	- `operand` gibt an, aus/in welchem Wert die Ein-/Ausgabe gelesen/geschrieben werden soll
	- in den `asm`-Befehlen werden die Operanden durch `%index` verwendet
- die `clobbered registers` geben lediglich an, welche Register von den `asm`-Befehlen verwendet werden

## Binärschnittstelle

- definierte Schnittstelle ähnlich zu Inline-Assembler realisiert
- ermöglicht direkten Aufruf von Assembler-Routinen
- Nutzung:
  - gesuchte Funktion extern deklarieren ``extern unsigned int popcnt(unsigned int a);``
  - ABI aufrufen
  - mittels Assembler die gesuchte Funktion zur Compile-Zeit zu einer Object-File verarbeiten: ``as --64 popcnt.s -o popcnt.o``
  - beim Linken wird mit einer **impliziten Regel** Patternsubstitution verwendet:

```makefile
%.o: %.s Makefile
        $(ASSEMBLER) $(ASM-PARAMETER) $< -o $@
```

- gemäß C Calling Convention muss ein Assemblerprogramm folgenden Rahmen haben, um in einem C-Programm aufrufbar zu sein:

```assembly
global myFunc

section .text

myFunc:

push ebp
mov ebp
```

# Mögliche Prüfungsaufgaben

- wir kriegen ein Konstrukt aus Make-Targets mit definierten Zeitaufwänden, von denen manche nebenläufig ausgeführt werden. Wir haben auch die Anzahl verwendeter Kerne. Wir sollen dann den Gesamtzeitaufwand bestimen
