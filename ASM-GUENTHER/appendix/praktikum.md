Praktikum hardwarenahe Programmierung
=====================================

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!--newpage-->

# AVR ATmega 8515L

- 40 Pins, 4 Ports, 2 Pins f. externen Takt
- 8 Bit RISC Microcontroller
- 8 kB Flash <!--Whoa-->
- 512 Byte EEPROM
- 512 Byte SRAM
- bis zu 64kB externen SRAM
- 8Bit + 16Bit Zähler
- 0 bis 8 MHz
- interne und externe Interrupts
- interner Watchdog (mit Brownout Detection)
- CPU entspricht Havard-Architektur und unterstützt Single Level Pipelining
- RAM: Adresse ``0x60``
- Stack: wächst von unten nach oben; Pointer muss initialisiert werden
- LED und Taster sind **Low-aktiv** (verhindert Störungen beim Start)

## Besonderheiten bei Registern

- Statusregister: Informationen zu Ergeignissen von arithmetischen und logischen Operationen, wie z.B. Zero-Flag
  - Besonderheit `I`-Flag: muss manuell auf 1 gesetzt werden, wenn Interrupts behandelt werden sollen
- PIN-Register laufen dem PORT-Register um einen Takt nach

# Direktiven und Kommandos

- Direktiven: Anweisungen für den Assembler (die Software), ähnlich zu C-Präprozessor
  - keine Maschinenbefehle
  - wichtig:
    - ``.include`` - analog zu C
    - ``.def`` - Aliase für Register
    - ``.equ`` - Definition einer Konstante, ähnlich zu ``#define``
    - ``.set`` - wie ``.equ``, aber nicht konstant <!--???-->
- Kommandos: entsprechen genau einem Maschinenbefehl; ca. 130
  - Speicheroperationen: ``LDI``, ``MOV``,...
  - Arithmetische und logische Operationen: ``ADD``, ``SUB``, ...
  - Manipulationen im Programmablauf: ``SIBS``, ``BREQ``,...
  - Kommentare
  - Ziel von Ergebnisdaten ist der **linke Operand**
  - jede Kombination von verwendeten Registern in einem Befehl bildet eigentlich einen separaten Befehl $\rightarrow$ Befehlssatz begrenzt

# Programmieren mit AVR Studio

## Dateistruktur

- in einem Kommentarblock soll Zweck des Programms festgehalten werden
- wir benötigen zunächst einen Dateikopf, in der wir die Gerätedatei laden:

```asm
.nolist
.include "m8515def.inc"
.list
```

- anschließend soll in einem Kommentarblock die Hardwarebeschreibung festgehalten werden, u.a.
  - welche Komponenten an welchen Pins?
  - welcher Takt?
- f

```asm
.def work   = R16

.equ Taster0 = 0
```

- falls verwendet, folgen Makros, Funktionsbeschreibungen und Vektor-Interrupt-Tabelle
- es folgt die Initialisierung, z.B. mit Stack:

```asm
start:
;init Stack
ldi work, LOW(RAMEND)
out SPL, work
ldi work, HIGH(RAMEND)
out SPH, work
```

- Das Hauptprogramm läuft in einer Endlos-Schleife:

```asm
main:

rjmp main
```

- zuletzt folgen Unterprogramme und Nutzdaten
