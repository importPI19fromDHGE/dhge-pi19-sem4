/***********************************
*                                  *
* Was tut das Programm             *
*                                  *
* Autor: André Grimm  / Süße       *
* erstellt am:                     *
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
* STK500 ->                                  *
*                                            *
*********************************************/

.def work   = R16

.equ Taster0 = 0

/*****************
*                *
* Macros         *
*                *
*****************/

//////////////////////////////////////////////////////////////
//
// Funktions- und Parameterbeschreibung
//
//////////////////////////////////////////////////////////////
;.macro name 
;.endm
.equ count = 24996
/***************************
*                          *
* Interrupt Vektor Tabelle *
*                          *
***************************/
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
ldi R16, 0xFF ; de facto work
out DDRA, R16 ; alle pins am port A sind Ausgänge

;init TIMER


/****************
*               *
* Hauptprogramm *
*               *
****************/
;CPU Takt 200kHz

main:

sbi PORTA, 0

;warte eine halbe Sekunde
;nachschauen, wie viele Takte Kommando braucht
;25k Takte sind abzuarbeiten


rcall warte

/*ldi R18, 100
outerloop:
	ldi R17, 248
	loop:
		nop 		; 1 Takt
		dec R17 	; 1 Takt
					;wiederholen solange R17 nicht null
		BRNE loop 	; 1 if condition is false, 2 if condition is true
		;2 Takte	
	dec R18 	; 1 Takt
	;wiederholen solange R17 nicht null
	BRNE loop2
*/

cbi PORTA,0
rjmp main

warte:
;Register, die geändert werden, müssen noch gesichert werden
push R15 ;optional, denn R15 wird nicht benutzt; als Best-Practice
in R15, SREG
push R24
push R25
ldi R24, LOW(count)
ldi R25, HIGH(count)

	markeWarteloop: 
	sbiw R24, 1
	brne markeWarteloop

pop R25
pop R24
out SREG, R15
pop R15
ret
;warte eine halbe Sekunde



