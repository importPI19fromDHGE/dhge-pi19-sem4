# Basic AVR-Cheatsheet

## Standard-Header

```asm
.nolist
.include "m8515def.inc"
.list

.def status = R15
.def work = R16
.def mask = R17
```

## Interrupts

### Interrupt-Vektortabelle

```asm
.org 0x0000
rjmp start  // 1 External Pin, Power-on Reset, Brown-out Reset and Watchdog Reset
reti        // 2 External Interrupt Request 0
reti        // 3 External Interrupt Request 1
reti        // 4 Timer/Counter1 Capture Event
reti        // 5 Timer/Counter1 Compare Match A
reti        // 6 Timer/Counter1 Compare Match B
reti        // 7 Timer/Counter1 Overflow
reti        // 8 Timer/Counter0 Overflow
reti        // 9 Serial Transfer Complete
reti        // 10
reti        // 11
reti        // 12
reti        // 13
reti        // 14 External Interrupt Request 2
reti        // 15 Timer/Counter0 Compare Match
reti        // 16
reti        // 17

start:
// Stack initialisieren
	ldi work, LOW(RAMEND)
	out SPL, work
	ldi work, HIGH(RAMEND)
	out SPH, work

// ---> ToDo: Interrupts aktivieren und konfigurieren <---

// Globale Interrupt-Flag setzen
	sei
main:
	rjmp main
```

### Interrupt Service Routine

```asm
isr:
	//Statusregister sichern
	in status, SREG

	// ---> ToDo: Do Something <---

	//Statusregister wiederherstellen
	out SREG, status
reti
```

### Externe Interrupts konfigurieren

```asm
// Externe Interrupts an PORTD Pin 2,3 -> Pullups aktivieren
ldi work, 0x06
out PORTD, work

// Externe Interrupts aktivieren (Datasheet S. 57)
in work, GICR
ldi mask, 0b11000000 ; 0b1 -> INT1; 0b01 -> INT0; 0b001 -> INT2
or work, mask
out GICR, work

// Externe Interrupts konfigurieren (Datasheet S.77)
in work, MCUCR // Für INT2 -> EMCUCR
ldi mask, 0x0f // rising edge -> S. 77
or work, mask
out MCUCR, work
```

## Timer

```asm
// Zählregister zurücksetzen
ldi work, 0x0
out TCNT0, work

; Prescaler setzen -> Datasheet S. 93; Clear on Compare Match -> Datasheet S. 91
ldi work, (1<<CS02) | (1<<CS00) | (1<<WGM01)
out TCCR0, work

// Vergleichswert für den Timer setzen (Notwendigkeit abhängig vom CTC-Mode)
ldi work, 0xff
out OCR0, work

ldi work, 1<<OCIE0 // Interrupts aktivieren OCIE0 <- Compare-Match; TOIE0 <- Timer-Overflow (Datasheet S. 93)
out TIMSK, work
```

## Einfache Programme

### Toggle

```asm
.def work = R16
.def mask = R17

ldi work, 0x2
out DDRE, work

ldi work, 0x1
out PORTE, work

ldi mask, 0x2

main:

sbis PINE, 0
	rjmp main

in work, PORTE
eor work, mask
out PORTE, work

skip:

sbic PINE, 0
	rjmp skip

rjmp main
```

#### Toggle-Macro

```asm
// @0 Portregister
// @1 Nummer des zu toggelnden Bits
.macro togglePin
	in work, @0
	ldi mask, 1 << @1
	eor work, mask
	out @0, work
.endm
```
