/***********************************
*                                  *
* Was tut das Programm             *
*                                  *
* Autor: Maximilian Kerst          *
*        G190367PI                 *
* erstellt am:                     *
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
.def status = R15

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
.macro name
.endm

/***************************
*                          *
* Interrupt Vektor Tabelle *
*                          *
***************************/
.org 0x0000
rjmp start
rjmp t1h ; 2 External Interrupt 0
rjmp t2h ; 3 External Interrupt 1
reti ; 4 Timer1 Cature Event
reti ; 5 Timer1 Compare Match A
reti ; 6 Timer1 Compare Match B
reti ; 7 Timer1 Overflow
reti ; 8 Timer0 Overflow
reti ; 9 Serial Transfer Complete
reti ; 10
reti ; 11
reti ; 12
reti ; 13
reti ; 14 External Interrupt 2
reti ; 15 Timer0 Compare Match
reti ; 16
reti ; 17


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
t1h:

in status, SREG
in work, PORTB
ldi R17, 0b00000001
eor work, R17
out PORTB, work
out SREG, status
reti

t2h:

in status, SREG
in work, PORTB
ldi R17, 0b00000010
eor work, R17
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

ldi work, 0xFF
out DDRB, work

ldi work, 0b11000010
out PORTB, work

ldi work, 0b00001100
out PORTD, work

ldi work, 0b11000000
out gicr, work

ldi work, 0x0F
out mcucr, work

SEI


/****************
*               *
* Hauptprogramm *
*               *
****************/
main:

rjmp main
