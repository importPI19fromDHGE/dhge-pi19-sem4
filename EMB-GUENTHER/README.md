Embedded Systems
================

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Inhaltsverzeichnis**

- [Grundlagen](#grundlagen)
  - [Definition](#definition)
  - [Bauteile](#bauteile)
    - [Potentiometer](#potentiometer)
    - [LEDs](#leds)
    - [Ohmscher Widerstand](#ohmscher-widerstand)
    - [Kondensator](#kondensator)
    - [Taster](#taster)
    - [Servomotor](#servomotor)
    - [Sonstige Bauteile](#sonstige-bauteile)
  - [Messgeräte](#messger%C3%A4te)
  - [PWM](#pwm)
  - [Digitale Schaltnetze](#digitale-schaltnetze)
    - [Logisches UND](#logisches-und)
    - [Logisches ODER](#logisches-oder)
    - [Logische Äquivalenz](#logische-%C3%A4quivalenz)
    - [Logische Antivalenz](#logische-antivalenz)
  - [Interrupts](#interrupts)
  - [Timer (Zähler)](#timer-z%C3%A4hler)
    - [Timer-Programmierung unter Arduino](#timer-programmierung-unter-arduino)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!--newpage-->

# Grundlagen

## Definition

> Eingebettete Systeme sind elektronischer Rechner, die in einem technischen Kontext eingebettet sind.
> Dabei übernimmt der Rechner entweder Überwachungs-, Steuerungs- oder Regelfunktionen.

## Bauteile

### Potentiometer

Elektrisches Widerstandsbauelement, dessen Widerstandswert mechanisch durch Drehen oder Schieben verändert werden kann.
Die Funktionsweise entspricht einem reglbaren Spannungsteiler. (= analoge Eingabeschnittstelle)

### LEDs

Halbleiter-Bauelement, das Licht ausstrahlt, wenn elektrischer Strom in Durchlassrichtung fließt.

### Ohmscher Widerstand

Begrenzt den Stromfluss in einem Schaltkreis. Beispielsweise als Vorwiderstand für LEDs.

### Kondensator

Passives elektrisches Bauelement zur Speicherung elektrischer Ladungen in einem Magnetfeld. Werden in der Regel zum Glätten von Spannungen oder für Verzögerungsschaltungen eingesetzt.

### Taster

Mechanisches Bauelement, zum zeitweisen Schließen/Öffnen eines Schaltkreises. (= Digitale Eingabeschnittstelle)

### Servomotor

Elektromotor, der zusätzlich mit einem Sensor zur Positionsbestimmung ausgestattet ist. Die Ansteuerung erfolgt über ein PWM-Signal.

### Sonstige Bauteile

- Ultraschall-Distanzsensor
- Temperatursensor
- Piezo-Buzzer
- Infrarot-Bewegungsmelder

## Messgeräte

- **Ampermeter** = Strommessgerät $\rightarrow$ Messung elektrischer Stromstärke
- **Voltmeter** = Spannungsmessgerät $\rightarrow$ Messung elektrischer Spannungen
- **Oszilloskop** = Messgerät, dass eine oder mehrere elektrische Spannungen im zeitlichen Verlauf sichtbar macht
- **Signalgeneratoren** erzeugen elektrische Spannungen mit einem charakteristischen Zeitverlauf (z.B. Rechteck-, Sinusspannung)

## PWM

- = **P**ulse**W**idth**M**odulation (Pulsbreitenmodulation)
- Schnelles Ein- und Ausschalten der Spannung (=Rechteckpuls)\rightarrow\rightarrow Verhältnis zwischen Ein- und Ausschaltzeit wird variiert
- Verwendung: z.B. Dimmen von LEDs, Ansteuerung von Servos


## Digitale Schaltnetze

### Logisches UND

|A|B|Z|
|-|-|-|
|0|0|0|
|0|1|0|
|1|0|0|
|1|1|1|

- Code: ´if(a && b)´
- Elektrisch: Zwei Schalter in Reihe
- Anwendung: Schutzfunktion durch Erfüllung zweier Bedingungen

### Logisches ODER

|A|B|Z|
|-|-|-|
|0|0|0|
|0|1|1|
|1|0|1|
|1|1|1|

- Code: ´if(a || b)´
- Elektrisch: Zwei Schalter in Parallel
- Anwendung (Steuerungstechnik): Innenlichtsteuerung KFZ

### Logische Äquivalenz

|A|B|Z|
|-|-|-|
|0|0|1|
|0|1|0|
|1|0|0|
|1|1|1|

- Code: ´if(a == b)´
- Elektrisch: Schalter mit mehreren Kontakten bzw. Digitalbausteine
- Anwendung (Steuerungstechnik): Vergleich von Sensorwerten

### Logische Antivalenz

|A|B|Z|
|-|-|-|
|0|0|0|
|0|1|1|
|1|0|1|
|1|1|0|

- Code: ´if(a != b)´
- Elektrisch: Schalter mit mehreren Kontakten bzw. Digitalbausteine (XOR)
- Anwendung (Steuerungstechnik): Kryptografie, Prüfsummen

## Interrupts

- = kurzfristige Unterbrechung der normalen Programmausführung
- tritt eine bestimmte Bedingung ein, wird sofort die gewünschte Interrupt Service Routine (ISR) ausgeführt

**Interrupt Modi**

|Interupt| Trigger                                      |
|--------|----------------------------------------------|
|RISING  | ansteigende Flanke                           |
|FALLING | absteigende Flanke                           |
|CHANGE  | ansteigende/abfallende Flanke (jede Änderung)|
|LOW     | wird getriggert, wenn der Pin LOW ist        |
|HIGH    | wird getriggert, wenn der Pin HIGH ist       |

- mit `attachInterrupt()` wird ein Interrupt initialisiert
- `digitalPinToInterrupt()` wandelt die Pin-Nummer in die mikrocontrollerspezifische Interrupt-Nummer um (erhöht Plattformunabhängigkeit)

**Achtung**

> Innerhalb der vom Interrupt ausgelösten Funktion wird delay() nicht funktionieren und millis() nicht hochzählen. Empfangene Serielle Daten in der Funktion können verloren gehen. Variablen, die innerhalb der Funktion verarbeitet werden, sollten als volatile gekennzeichnet werden.
> *Quelle: [Arduino Dokumentation](https://www.arduino.cc/reference/de/language/functions/external-interrupts/attachinterrupt/)*

**Anwendungsbeispiel**

> Es soll eine Schaltung mit einer blinkenden LED und einer LED, die über einen Schalter gesteuert wird.
> Damit die LED zeitnah geschaltet werden kann, soll dies über einen Interrupt realisiert werden.

```C
#define INPUT_SWITCH 2
#define OUTPUT_SWITCH 13
#define OUTPUT_BLINK 12

void setup(){
  pinMode(INPUT_SWITCH, INPUT);
  pinMode(OUTPUT_SWITCH, OUTPUT);
  pinMode(OUTPUT_BLINK, OUTPUT);
  attachInterrupt(digitalPinToInterrupt(INPUT_SWITCH), input_button, CHANGE);
}

void loop(){
  digitalWrite(OUTPUT_BLINK, !digitalRead(OUTPUT_BLINK));
  delay(1000);
}

void input_button(){
  digitalWrite(OUTPUT_SWITCH, digitalRead(INPUT_SWITCH));
}
```

## Timer (Zähler)

- spezielle Hardware im Mikrocontroller $\rightarrow$ Timer/Zähler
- Uhren zum Warten auf Ereignise, Erzeugen von Frequenzen, Messen von Zeit
- Arduino Uno (ATmega328) besitzt drei Timer (1x 16bit; 2x 8bit)
- Register kann taktweise Zählen (16 MHz $\rightarrow$ 62,5ns pro Takt)
  - 8bit-Timer $\rightarrow$ $256 * 62,5ns = 16 µs$
  - 16bit-Timer $\rightarrow$ $65536 * 62,5ns = 4,096 ms$
  - $\rightarrow$ mit dem `Prescaler` kann die Schrittweite eingestellt werden (0, 1, 8, 64, 256, 1024)
  - $\rightarrow$ mit Prescaler max. 0,016s bzw. 4,19s 
- je nach Konfiguration kann der Zähler der Interrupt ausgelöst werden (= interne Interrupt-Quelle)
  - laufen unabhängig vom normalen Programmablauf
  - Definition durch Interrupt-Maske

$$\text{OCRn} = [\frac{\text{clockspeed}}{\text{prescaler}}*\text{gewünschte Zeit(s)}]-1$$

> Welcher Wert sollte nach 1ms bei 16 MHz und ein Prescaler von 64 im 8bit-Zähler stehen?
> $$\text{OCRn} = [\frac{16\text{MHz}}{64}*1*10^{-3}s]-1=\underline{\underline{249}}$$

<!--"schöne Prüfungsfrage": angenommen Timer x ist schon belegt, kann das mit Timer a oder b realisiert werden? -> 8 bzw. 16bit, Prescaler ändern -->

### Timer-Programmierung unter Arduino

```C
void setup(){
  TCCR0A = (0x1<<WGM01); //Compare-Modus (CTC) aktivieren -> Timer wird bei Match gecleart
  OCR0A = 0xF9; //Vergleichswert für 1ms setzen

  TCCR0B|=(0x1<<CS01); //Prescale auf 64 setzen
  TCCR0B|=(0x1<<CS00); //^^

  TIMSK0|=(0x1<<OCIE0A); //internen Interrupt aktivieren 
  sei(); //^^
}
ISR(TIMER0_COMPA_vect){
  //ISR für den Timer
}
```