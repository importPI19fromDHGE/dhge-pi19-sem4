/***********************************
*                                  *
* 4-Bit Z�hler, z�hlt die Sekunden *
*                                  *
* Autor: Andr� Grimm                *
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
* CPU-Takt 245760Hz                          *
* Port B -> LEDs			     *
*                                            *
*********************************************/

.def work    = R16

.equ Taster0 = 0
.equ count   = 256-240 ; Tats�chlich wird diese Berechnung durchgef�hrt = 16

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
rjmp timer0OFHandle
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
*		             *
* Interrupt Handler  *
* 		             *
*********************/

//////////////////////////////////////
//
// Funktionsbeschreibung
//
//////////////////////////////////////
; Hier �ndern
timer0OFHandle:
  in work, PINB ;Status von PINB lesen
  inc work ; Work +1
  cpi work, 16 ; compare with immediate: 16 
  breq nullen ; wenn equal -> jump nullen
back:
  out PORTB, work ; Ausgabe
reti ; Ende des Interrupt

nullen: ; Work auf 0
  ldi work, 0
  rjmp back

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
ldi work, 255
out DDRB, work    //alle Ports sind Ausg�nge

;init TIMER
;239 Timer-Takte z�hlen
ldi work, count ; count ist 16 -> von 16 bis 255 z�hlen
out TCNT0, work ; TCNT0 ist Register mit Start-Wert des Timers

ldi work, 1<<TOIE0 ; Overflow-Interrupt aktivieren
out TIMSK, work	 

;Unbedingt Prescaler Tabelle anschauen!
ldi work, 1<<CS00 | 1<<CS01 ; Prescaler 64 (wohl falsch, f�r diese Aufgabe)
out TCCR0, work

SEI ; global Interrupts aktivieren

/****************
*               *
* Hauptprogramm *
*               *
****************/
main:

rjmp main


