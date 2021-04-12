Embedded Systems
================

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

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

Passives elektrisches Bauelement zur Speicherung elektrischer Ladungen in einem Magnetfeld. Werden in der Regel zum Glätten von Spannungen oder für Verzögerungsschaltungen eingestzt.

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
- Schnelles Ein- und Ausschaltend der Spannung (=Rechteckpuls)$\rightarrow$ Verhältnis zwischen Ein- und Ausschaltzeit wird variiert
- Verwendung: z.B. Dimmen von LEDs, Ansteuerung von Servos
