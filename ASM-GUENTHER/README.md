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
- 

Beispiel-Makefile:

```make
SOURCE=main.c

COMPILER=gcc

C-COMP-PARAM=--std=gnu99 -Wall -Wextra #C99 mit lang exts.

all: $(COMPILER-OUTPUT)

$(COMPILER-OUTPUT): $(SOURCE) Makefile
        $(COMPILER) $(C-COMP-PARAM) $(SOURCE) -o $(COMPILER-OUTPU)

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
