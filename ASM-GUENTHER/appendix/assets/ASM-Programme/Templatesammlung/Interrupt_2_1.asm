/*************************************
*                                    *
* Interrupt Template                 *
*                                    *
* Autor: Grimm / Schäfer             *
* erstellt am:                       *
* Version 0.1                        *
*                                    *
*************************************/

.nolist
.include "m8515def.inc"
.list

/*********************************************
*                                            *
* Hardwarebeschreibung:                      *
*                                            *
* PIN E0 -> Taster -> Int2                   *
* PIN E1 -> LED                              *
*                                            *
*********************************************/

.def status  = R15
.def work    = R16
.def mask    = R17 ;CHANGE ME



/***************************
*                          *
* Interrupt Vektor Tabelle *
*                          *
***************************/
.org 0x0000
rjmp start              ;1  External Pin, Power-on Reset, Brown-out Reset and Watchdog Reset 
reti                    ;2 External Interrupt Request 0
reti                    ;3 External Interrupt Request 1
reti                    ;4 Timer/Counter1 Capture Event
reti                    ;5 Timer/Counter1 Compare Match A
reti                    ;6 Timer/Counter1 Compare Match B
reti                    ;7 Timer/Counter1 Overflow
reti                    ;8 Timer/Counter0 Overflow
reti                    ;9  Serial Transfer Complete
reti                    ;10
reti                    ;11
reti                    ;12
reti                    ;13
reti                    ;14 External Interrupt Request 2
reti                    ;15 Timer/Counter0 Compare Match
reti                    ;16
reti                    ;17


/*********************
*		             *
* Interrupt Handler  *
* 		             *
*********************/

//////////////////////////////////////
//
// toggelt LED
//
//////////////////////////////////////
interrupt: ;CHANGE ME
  //Statusregister sichern
  IN status, SREG

  
  //Statusregister wiederherstellen
  OUT SREG, status
reti


/********************************
*                               *
* Initialisierung               *
*                               *
********************************/
start:
;stack
LDI work, HIGH(RAMEND)
OUT SPH, work
LDI work, LOW(RAMEND)
OUT SPL, work

;init registers
LDI work, 2    		;Ausgabe DDR 1 setzen
OUT DDRE, work
LDI work, 3			;bei Eingabe Pull Up setzen, Ausgabe LED anmachen
OUT PORTE, work

;init int2 

/*Aufbau GCICR,x irrelevant
INT1 INT0 INT2 x x x x
Einerstelle:  Interrupt-Nummer
Zehnerstelle: Identifier*/

in work, GICR       ;durch GICR wird der Interrupt generell aktiviert
ldi mask, 0b00100000 ; 0b1 -> Interrupt 1; 0b01 -> Interrupt 0; 0b001 -> Interrupt 2
or work, mask  
out GICR, work

/*
;Aufbau MCUCR  x irrelevant
x x x x ISC11 ISC10 ISC01 ISC00
Einerstelle:  Interrupt-Nummer
Zehnerstelle: Identifier
EMUCR nur niedrigstes Bit relvant
Für Interrupt 1:
ISC11 ISC01
0	0	low level interrupt
0 	1 	zwei-flankengesteuerter Interrupt
1	0	fallende Flanke
1 	1 	steigende Flanke
Interrupt 2 nur flanken-aktiv 0 --> fallend
ISC2
*/

in work, EMCUCR     ;EMCUCR bei Int2, MCUCR bei Int0+1 s. PP Folie 37+38
ldi mask, 0b11111110
out EMCUCR, work

; Externer Interrupt 1
;in work, MCUCR
;in mask, (1<<ISC11|0x00) ; Interrupt 1 an fallende Flanke
;or work, mask  
;out mcucr, work 

; I Bit für das aktivieren von Interrupts setzen
SEI

/****************
*               *
* Hauptprogramm *
*               *
****************/
main:

rjmp main

