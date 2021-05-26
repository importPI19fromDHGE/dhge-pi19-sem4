Praktikum hardwarenahe Programmierung
=====================================

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Inhaltsverzeichnis**

- [AVR ATmega 8515L](#avr-atmega-8515l)
- [Direktiven und Kommandos](#direktiven-und-kommandos)
- [Programmieren mit AVR Studio](#programmieren-mit-avr-studio)
  - [Dateistruktur](#dateistruktur)
  - [I/O](#io)
  - [Register](#register)
- [Interrupts](#interrupts)
  - [Aufbau der IV-Tabelle](#aufbau-der-iv-tabelle)
  - [externe Interrupts](#externe-interrupts)
- [Stack](#stack)
- [Funktionen und Makros](#funktionen-und-makros)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!--newpage-->

# AVR ATmega 8515L

- 40 Pins, 4 Ports, 2 Pins f. externen Takt
- 8 Bit RISC Microcontroller
- 8 kB Flash <!--Whoa-->
- 512 Byte EEPROM
- 512 Byte SRAM
- bis zu 64 kB externen SRAM
- 8 Bit + 16 Bit Zähler
- 0 bis 8 MHz
- interne und externe Interrupts
- interner Watchdog (mit Brownout Detection)
- CPU entspricht Harvard-Architektur und unterstützt Single Level Pipelining
- RAM: Adresse ``0x60``
- Stack: wächst von unten nach oben; Pointer muss initialisiert werden
- LED und Taster *auf dem Entwicklerboard* sind **Low-aktiv** (verhindert Störungen beim Start)
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

## I/O

- Port $\rightarrow$ Sammlung verschiedener Speicher
- ``DDRx``-Register: "Data Direction Register"; deklariert, ob ein Pin an einem Port ``x`` mithilfe des dazugehörigen Bits ein Eingang oder Ausgang ist
  - Beispiel: ``DDRB`` hat Wert 255 $\rightarrow$ alle Pins sind Ausgänge
- ``PORTx`` sendet Daten an Ausgänge
- ``PINx`` ist ein nur-lesen-Register $\rightarrow$ hier können Daten ausgelesen werden
- Befehle:
  - ``OUT``: schreibt Daten
  - ``IN``: liest Daten in ein Arbeitsregister
  - ``LDI``: liest Bit aus I/O-Register
  - ``SBI``: schreibt Bit in I/O-Register
  - ``CBI``: löscht Bit aus I/O-Register
  - ``SBIC``: Wenn Register cleared, dann überspringe nächste Anweisung

## Register

- 32 General Purpose Register sowie Spezialregister
- Register ``R16`` bis ``R31`` für spezielle Aufgaben
  - ``LDI``,  ``ANDI``, ``CBR``, ``SBR``, ``CPI``, ``SER``, ``ORI``, ``SBCI``, ``SUBI`` funktionieren erst ab ``R16``
- Zeigerregister ``X``, ``Y``, ``Z``
- Empfehlungen:
  - verwendeten Registern Namen zuweisen
  - für Zeiger R26 bis R31 reservieren
  - 16-Bit-Zähler mit R24/R25
  - für Zugriff auf Programmspeicher Z (R30/R31) und R0 reservieren
  - für Verwendung von Konstanten oder Bit-Auswertung R16 bis R23 vorsehen
  - Sichern des Status-Registers wenn möglich in R15

Hausaufgabe: LED-Zustand beim Drücken des Tasters umschalten

<details>

<summary>Lösung der Hausaufgabe</summary>

```asm
/***********************************
*                                  *
* Programm wechselt LED-Zustand    *
* beim Drücken des Tasters         *
*                                  *
* Autor: Maximilian Kerst          *
* erstellt am: 18.05.2021          *
* Version 0.1                      *
*                                  *
***********************************/

.nolist
.include "m8515def.inc"
.list

/*********************************************
*                                            *
* Hardwarebeschreibung:                      *
*                                            *
* STK500 -> 4MHz; LED an Pin A0, Taster an A1*
*                                            *
*********************************************/

.def work   = R16
.def eins   = R17

.equ LED = 0



/********************************
*                               *
* Initialisierung               *
*                               *
********************************/
start:

;init registers
;LDI work, 255
;OUT DDRB, work
LDI work, 253
OUT DDRA, work ; set Output-Flag on all Bits but 1
LDI work, 2
OUT PORTA, work ;  set Pull-Up Resistor on Bit 1
LDI work, 0
LDI eins, 1

/****************
*               *
* Hauptprogramm *
*               *
****************/
main:

sbis PINA, 1
  rjmp main ; jump back if button not pressed

in work, PINA
eor work, eins
out PINA, work

loop:
sbic PINA, 1
rjmp loop
rjmp main

rjmp main

```

</details>

# Interrupts

- Aktivierung über Register
- Behandlung via Interrupt Service Routinen (ISR) in Interrupt-Vektortabelle
- erfordert initialisierten Stack (ist standardmäßig 0)
- setzen des I-Bit mit ``SEI``

Abarbeitung:

- Microcontroller beendet aktuellen Befehl
- MC löscht I-Bit $\rightarrow$ muss gesetzt sein, damit Interrupts behandelt werden $\rightarrow$ Behandlungsroutine kann nicht unterbrochen werden
- MC speichert Program Counter auf den Stack $\rightarrow$ Fortsetzung des Programmablaufs wird gesichert
- Interrupt-Vektor des ausgelösten Interrupts in PC laden; IV ist eine festzulegende Adresse im Programmspeicher (**Interrupt-Vektor-Tabelle**)
  - wird abgearbeitet, bis ``reti`` ("REturn To Interrupt") erreicht
- PC vom Stack laden
- I-Bit setzen
- Programmablauf fortsetzen
- **Statusregister wird nicht automatisch gesichert!**<!--!!1!1elf11!-->
- möglichst kurz halten, um keine Interrupts zu verpassen

Standardmäßige, leere IVT:

```asm
.org 0x0000
rjmp start
reti
reti
reti
reti
reti
reti
reti
reti
reti
reti
reti
reti
reti
reti
reti
reti
```

## Aufbau der IV-Tabelle

- rjmp zur ISR
- innerhalb kein ``.org``
- Länge der Sprungtabelle = Anzahl der Interrupts

## externe Interrupts

![Interrupts](8515_interrupts.jpg)<!--width=600px-->

- ``RESET`` ist Low-aktiv
- General Interrupt Flag Register (GIFR): gesetzt bei entsprechendem Ereignis
- vom MC gelöscht
- General Interrupt Control Register (GICR): Wenn entsprechendes Bit gesetzt, ist ein Interrupt aktiviert
- Microcontroller-Unit-Control-Register (MCUCR): Konfiguriert, welche Konfiguration von INT0 und INT1 einen Interrupt auslöst und ob auf steigende oder fallende Flanken reagiert wird
- INT2 wird in EMCUCR konfiguriert, wobei hier nur die Flanke eingestellt werden kann

# Stack

- 16 Bit Stackregister
- beginnt bei ``0x60`` und hört bei ``0x25F``
- Es gibt die Konstante ``RAMEND`` :-)

Initialisierung:

```asm
ldi work, LOW(RAMEND)
out SPL, work
ldi work, HIGH, RAMEND
out SPH, work
```

Ein Beispielprogramm zeigt die Nutzung von Stack und Interrupts anhand von zwei Tastern (lt. Datenblatt an ``PORTB``)

```asm
/***********************************
*                                  *
* LED Toggle Interrupt             *
*                                  *
* Autor: Max KErst                 *
* erstellt am: 26.05.2021          *
* Version 0.1                      *
*                                  *
***********************************/

.nolist
.include "m8515def.inc"
.list

/*********************************************
*                                            *
* Hardwarebeschreibung:                      *
*                                            *
* Taster E0; LED E1                          *
*                                            *
*********************************************/

.def status = R15
.def work   = R16
.def mask = R17
.include "m8515def.inc"

/***************************
*                          *
* Interrupt Vektor Tabelle *
*                          *
***************************/
.org 0x0000
rjmp start
rjmp int0handle 
rjmp int1handle
reti
reti
reti
reti
reti
reti
reti
reti
reti
reti
reti
reti
reti
reti


/*********************
*		     *
* Interrupt Handler  *
* 		     *
*********************/

//////////////////////////////////////
//
// Reagiert bei Int0; ändert den LED-Zustand B1
//
//////////////////////////////////////
int0handle:

in status, SREG
in work, PORTB
ldi mask, 1
eor work, mask
out PORTB, work
out SREG, status

reti

int1handle:

in status, SREG
in work, PORTB
ldi mask, 2
eor work, mask
out PORTB, work
out SREG, status

reti


/********************************
*                               *
* Initialisierung               *
*                               *
********************************/
start:
;init Stack
ldi work, LOW(RAMEND)
out SPL, work
ldi work, HIGH(RAMEND)
out SPH, work

;init registers
LDI work, 0b11111111
out DDRB, work
LDI work, 0b11000001
out portB, work

;init INT
ldi work, 0xff
out portd, work
ldi work, 0b11000000
out gicr, work ; aktiviert den Interrupt
ldi work, 0b00001111
out mcucr, work ; rising edge

SEI


/****************
*               *
* Hauptprogramm *
*               *
****************/
main:

rjmp main

```

# Funktionen und Makros

- vermeidet Spaghetticode
- sind sich wiederholende Programmabläufe
- Parameterübergabe möglich
- Definition von Makros am Anfang, da sie vor dem Aufruf bekannt sein müssen
- Makros werden in-place ersetzt
- Unterprogramme werden via Sprungadresse definiert, abgeschlosssen mit ``RET``, Aufruf mit ``RCALL``
- Parameterübergabe mittels Registern, Stack oder globalen Variablen

| Makro                | Unterprogramm             |
| :------------------: | :-----------------------: |
| in-place Ersetzung   | Sprung                    |
| große Binary         | kleine Binary             |
| hohe Geschwindigkeit | geringere Geschwindigkeit |

- Register<!--Kranplätze--> müssen gesichert<!--verdichtet--> sein und danach wiederhergestellt werden
  - Ausnahme: Register für Rückgabewerte
- bei Makros bis zu 10 Parameter möglich

Das obige Beispiel kann durch die Verwendung von Makros aufgewertet werden; ``@0`` ist der erste Parameter und ``@1`` der zweite:

```asm
// @0 Portregister LED
// @1 Bitmaske XOR
.macro togglePin
in work, @0
ldi mask, @1
eor work, mask
out @0, work
.endm
```
