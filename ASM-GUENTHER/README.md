Rechnerarchitekturen/hardwarenahe Programmierung
================================================

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
undefined
<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!--newpage-->

# Java und Make

- mit ``javac`` kompiliert man eine ``.java``-Datei zu Bytecode kompilieren
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

# Mögliche Prüfungsaufgaben

- wir kriegen ein Konstrukt aus Make-Targets mit definierten Zeitaufwänden, von denen manche nebenläufig ausgeführt werden. Wir haben auch die Anzahl verwendeter Kerne. Wir sollen dann den Gesamtzeitaufwand bestimen
