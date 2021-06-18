/***********************************
*                                  *
* Was tut das Programm             *
*                                  *
* Autor: André Grimm               *
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

.equ Pieper=0
.equ pinToToggle= 1
.equ timeToWait= 277
/*****************
*                *
* Macros         *
*                *
*****************/
;Berechnung Basistakt 1MHZ -> 100k HZ --> 1 Mio pro Sekunden
;Takt dauert 1/(1 Mio) Sekunden
; 1 / 440 
;Wechsel alle 440 * 1 / 1 Mio Sekunden = 440*10^-6
;
//////////////////////////////////////////////////////////////
//
// Funktions- und Parameterbeschreibung
//
//////////////////////////////////////////////////////////////
.macro name
.endm

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


/*********************
*		     *
* Interrupt Handler  *
* 		     *
*********************/

//////////////////////////////////////
//
// Funktionsbeschreibung
//
//////////////////////////////////////
intName:
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
rcall warte
rcall togglePin
rjmp main 


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


;warte eine halbe Sekunde





/*****************
*                *
* Unterprogramme *
*                *
*****************/


//////////////////////////////////////////////////////////////
//
// schaltet Pin Um

// Pin steht in Konstante pinToToggle
//
//////////////////////////////////////////////////////////////
togglePin:
  push R15
  in R15, SREG
  push R18
  
  ldi R18, pinToToggle
   
  in work, PORTA
  eor work, R18
  out PORTA, work

  pop R18
  out SREG, R15
  pop R15
ret

warte:
push R15
in R15, SREG
push R24
push R25

ldi R24, LOW(timeToWait)
ldi R25, HIGH(timeToWait)

	markeWarteloop: 
	sbiw R24, 1
	brne markeWarteloop

pop R25
pop R24
out SREG, R15
pop R15
ret




