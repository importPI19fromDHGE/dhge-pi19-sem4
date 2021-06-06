/***********************************
*                                  *
* Auf Knopfdruck 1 mal "Alle meine *
* Entchen" spielen                 *
* "Siehe Video!" ~J. Süße          *
* Autor: André Grimm               *
* erstellt am: 24.02.2015          *
*                                  *
***********************************/

.nolist
.include "m8515def.inc"
.list

.def work    = R16
.def ton     = R17
.def dauer   = R18
.def count   = R19
.def adressh = R20
.def adressl = R21
.def flags   = R22

.equ csek    = 9999
.equ schluss = 0
.equ voegel  = 0


/*********************************************
*                                            *
* STK500 -> interner Takt vom STK 8 MHz      *
*                                            * 
* Pin B0 -> Piepser                          *
*                                            *
*********************************************/

/*****************
*                *
* Macros         *
*                *
*****************/

/////////////////////////////////////////////////////////////////
//
// sichert den Wert des Registers work und des Statusregisters
// auf dem Stack
// Parameter: keine
//
/////////////////////////////////////////////////////////////////
.macro saveState
  push work
  in work, SREG
  push work
.endmacro

/////////////////////////////////////////////////////////////////
//
// lädt den Wert des Registers work und des Statusregisters
// vom Stack
// Parameter: keine
//
/////////////////////////////////////////////////////////////////
.macro loadState
  pop work
  out SREG, work
  pop work
.endmacro

/********************************
*                               *
* IV-Tabelle                    *
*                               *
********************************/
.org 0x0000
rjmp start
reti
reti
reti
rjmp timer1CM_ISR
reti
reti
reti
reti
reti
reti
reti
reti
rjmp ExtInt2
reti
reti
reti

timer1CM_ISR:
  saveState

  inc count

  loadState
reti

ExtInt2:
  saveState

  ORI flags, 0b00000001

  loadState
reti

/********************************
*                               *
* Los geht's                    *
*                               *
********************************/
start:
;init Stack
ldi work, LOW(RAMEND)
out SPL, work
ldi work, HIGH(RAMEND)
out SPH, work

;init PORTB
ser work			  ;schreibt FF in Register R16
out DDRB,  work       ;alle Pins an PortB Ausgänge
out PORTB, work		  ;alle Pins auf high -> STK-LEDs aus

;init TIMER0
clr work
out TCNT0, work
out TCCR0, work       ;Timer aus

;init Timer1
out TCNT1H, work
out TCNT1L, work

ldi work, 1<<OCIE1A
out TIMSK, work

;init ExtInt2
ldi work, 1<<INT2
out GICR, work

SEI

/****************
*               *
* Hauptprogramm *
*               *
****************/
main:

clr adressh
clr adressl

ldi  zh, high(data<<1)
ldi  zl, low(data<<1)

loop:
  sbrs flags, voegel
  rjmp loop
  
  lpm  ton, z+
  cpi ton, schluss
  breq endMain
  lpm dauer, z+
  cpi dauer, schluss
  breq endMain

  rcall beep
rjmp loop

endMain: 
  ANDI flags, 0b00000000
rjmp main



/*********************
*                    *
* Unterbrogramme     *
*                    *
*********************/

beep:

  saveState

  out OCR0, ton
  ldi work, (1<<WGM01)|(1<<COM00)|(1<<CS01)|(1<<CS00)
  out TCCR0, work

  rcall warte

  ldi work, schluss
  out TCCR0, work

  ldi dauer, 1
  rcall warte

  loadState
ret


warte:
  saveState

  ;timer1 starten
  ldi work, high(csek)
  out OCR1AH, work
  ldi work, low(csek)
  out OCR1AL, work

  SEI                       ;global Interrups zulassen

  ldi work, (1<<CS11)|(1<<WGM12)
  out TCCR1B, work         ;Vorteiler 8, CTC bei 9999, Interrupt -> CTIEF

loopWarte:
  cp count, dauer
  breq endWarte
  rjmp loopWarte

endWarte:
  ldi work, schluss
  out TCCR1B, work			;Timer1 anhalten
  ldi count, 0
  loadState
ret
/************
*           *
* Daten     *         
*           *
************/
data:
.db 118,60,95,20,79,40,59,40,71,40,59,20,71,20,79,80,89,60,79,20,95,40,118,40,105,80,118,40,0

