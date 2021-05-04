Embedded Systems - Prüfungsaufgaben
===================================

# Prüfungsleistung 2021

> In 2021 wurde die Prüfung in Form einer Ersatzleistung durchgeführt.
> Die Prüfung fand online über Teams unter Nutzung von [TinkerCAD](https://www.tinkercad.com/) statt.
> In einer Gruppenarbeit zu je vier Personen, soll der Aufbau einer Schaltung inkl. Programmierung eines Mikrocontrollers realisiert werden.
> Im Folgenden werden die Prüfungsaufgaben der unterschiedlichen Gruppen gelistet. Die Bearbeitungszeit betrug 60 Minuten.
> Im Anschluss an die Bearbeitungszeit musste das Ergebnis und die Funktionsweise kurz vorgestellt werden.

## Gruppe 1 - Leiterplattenbelichtungsgerät

Das Leiterplattenbelichtungsgerät belichtet für eine eingestellte Zeit Fotopositiv-Platinen.
Die Zeit kann digital gewählt, gestartet und gestoppt werden.
Entwickeln Sie mit Hilfe eines `Arduino Uno` eine Schaltung sowie ein Programm mit den folgenden Funktionen:

1. Die benötigten I/O Pins sind per `define` festgelegt.
2. zwei 7-Segmentanzeigen `A1` und `A2` (positiv angesteuert, Einstellung: Katode) werden verwendet.
3. Je ein IC (`CD4511`) übernimmt die jeweilige BCD-zu-7-Segement-Code-Wandlung.
4. Verwenden Sie die richtigen Vorwiderstände (`V1`, …, `Vn`) für `A1` und `A2`.
5. Es wird eine LED als Belichtungseinrichtung verwendet (soll das UV-Licht simulieren).
6. Verwenden den richtigen Vorwiderstand für die LED.
7. Es werden vier Taster (`S1`, `S2`, `S3`, `S4`) verwendet.
8. Verwenden Sie Pull-Down-Widerstände (`R1`, …, `Rn`).
9. Die einstellbare Belichtungszeit beträgt 0-99 Sekunden.
10. `A1` und `A2` zeigen die eingestellte Zeit in Sekunden.
11. Mit Betätigen von `S1` wird die Belichtungszeit um 1 erhöht (Grenzen beachten).
12. Mit Betätigen von `S2` wird die Belichtungszeit um 1 verringert (Grenzen beachten).
13. Mit Betätigen von `S3` wird die Belichtung gestartet und die Belichtungseinrichtung beginnt zu leuchten.
14. Ist die Belichtungseinrichtung gestartet, dann wird im Sekundentakt die eingestellte Belichtungszeit dekrementiert.
15. Mit Betätigen von `S4` wird die Belichtung gestoppt und die Belichtungszeit sowie die entsprechende Anzeige auf 0 gesetzt.

Bitte kommentieren Sie jede Programmzeile (eine Zeile $\rightarrow$ ein Kommentar; **nicht** hinter den Befehl schreiben!).

## Gruppe 2 - Kurzzeitwecker

Der Kurzzeitwecker gibt nach einer eingestellten Zeit ein akustisches Signal aus.
Die Zeit kann analog gewählt und der Wecker digital gestartet werden.
Entwickeln Sie mit Hilfe eines `Arduino Uno` eine Schaltung sowie ein Programm mit den folgenden Funktionen:

1. Die benötigten I/O Pins sind per `define` festgelegt.
2. zwei 7-Segmentanzeigen `A1` und `A2` (positiv angesteuert, Einstellung: Katode) werden verwendet.
3. Je ein IC (`CD4511`) übernimmt die jeweilige BCD-zu-7-Segement-Code-Wandlung.
4. Verwenden Sie die richtigen Vorwiderstände (`V1`, …, `Vn`) für `A1` und `A2`.
5. Es wird ein Piezosummer als akustischer Signalgeber verwendet.
6. Ein Potentiometer (`P1`) mit 500kOhm wird verwendet.
7. Die analoge Eingabe von `P1` ist als Spannungsteiler realisiert.
8. Es wird ein Taster (`S1`) verwendet.
9. Verwenden Sie einen Pull-Down-Widerstand (`R1`).
10. Die einstellbare Zeit beträgt 0-50 Sekunden (Grenzen beachten).
11. `A1` und `A2` zeigen die eingestellte Zeit in Sekunden.
12. Mit Betätigen von `S1` wird der Kurzzeitwecker gestartet.
13. Ist der Kurzeitwecker gestartet, läuft die eingestellte Zeit rückwärts.
14. Die rückwärtslaufende Zeit wird auf `A1` und `A2` angezeigt.
15. Ist die Zeit abgelaufen, ertönt 5 Sekunden lang ein 1000-HZ-Ton.

Bitte kommentieren Sie jede Programmzeile (eine Zeile $\rightarrow$ ein Kommentar; **nicht** hinter den Befehl schreiben!).

## Gruppe 3 - Hindernisentfernungsmesser

Der Hindernisentfernungsmesser zeigt im *Nahbereich* den gemessenen Abstand zum Hindernis mit zwei 7-Segmentanzeigen und einer LED an.
Im *Mittel-* und *Fernbereich* wird die Entfernung ausschließlich mit LEDs angezeigt und die Punkte der 7-Segmentanzeigen leuchten.
Entwickeln Sie mit Hilfe eines `Arduino Uno` eine Schaltung sowie ein Programm mit den folgenden Funktionen:

1. Die benötigten I/O Pins sind per `define` festgelegt.
2. zwei 7-Segmentanzeigen `A1` und `A2` (positiv angesteuert, Einstellung: Katode) werden verwendet.
3. Je ein IC (`CD4511`) übernimmt die jeweilige BCD-zu-7-Segement-Code-Wandlung.
4. Verwenden Sie die richtigen Vorwiderstände (`V1`, …, `Vn`) für `A1` und `A2`.
5. Es werden drei LEDs verwendet (`L1`-grün, `L2`-gelb, `L3`-rot).
6. Verwenden Sie die richtigen Vorwiderstände für `L1`, `L2` und `L3`.
7. Es wird ein Ultraschallentfernungsmesser-Modul (`U1`) benötigt.
8. Ist ein Hindernis erfasst, aber weiter als 3 Meter entfernt, dann leuchtet die grüne LED (*Fernbereich*).
9. Bereichsabhängig zeigen `A1` und `A2` die gemessene Entfernung (30 – 90 cm) (Grenzen beachten).
10. Im *Fernbereich* leuchten die Punkte von `A1` und `A2`.
11. Ist ein Hindernis erfasst, aber weiter als 1 Meter und weniger als 3 Meter entfernt, dann leuchtet die gelbe LED (*Mittelbereich*).
12. Im *Mittelbereich* leuchtet nur der Punkt von `A1`.
13. Im *Fern-* und im *Mittelbereich* zeigen `A1` und `A2` keine Ziffern an.
14. Ist ein Hindernis erfasst und weniger als 1 Meter entfernt, dann leuchtet die rote LED (*Nahbereich*).
15. Im *Nahbereich* leuchten die Punkte von `A1` und `A2` nicht.

Bitte kommentieren Sie jede Programmzeile (eine Zeile $\rightarrow$ ein Kommentar; **nicht** hinter den Befehl schreiben!).

## Gruppe 4 - Türsteuerung

Die Türsteuerung öffnet eine Tür bei Erkennen einer Bewegung.
Die Tür wird automatisch nach 10 Sekunden ohne Bewegung geschlossen.
Entwickeln Sie mit Hilfe eines `Arduino Uno` eine Schaltung sowie ein Programm mit den folgenden Funktionen:

1. Die benötigten I/O Pins sind per `define` festgelegt.
2. zwei 7-Segmentanzeigen `A1` und `A2` (positiv angesteuert, Einstellung: Katode) werden verwendet.
3. Je ein IC (`CD4511`) übernimmt die jeweilige BCD-zu-7-Segement-Code-Wandlung.
4. Verwenden Sie die richtigen Vorwiderstände (`V1`, …, `Vn`) für `A1` und `A2`.
5. Es wird eine LED (`L1`) zur Tür-Auf-Signalisierung verwendet.
6. Verwenden Sie den richtigen Vorwiderstand für die LED.
7. Es wird ein Bewegungsmelder-Modul (`B1`) benötigt.
8. Ein Servo (`M1`) wird per PWM gesteuert (er simuliert die Tür).
9. `M1` kann zwei Zustände einnehmen (*Tür auf* und *Tür zu*).
10. Nach Programmstart befindet sich der Servo im Zustand *Tür zu*.
11. Wird eine Bewegung erkannt, verändert der Servo seine Stellung (*Tür auf*) und `L1` leuchtet.
12. Ohne neu erkannte Bewegung bleibt die Tür für max. 10 Sekunden geöffnet (ein 10-Sekunden-Timer wird gestartet).
13. `A1` und `A2` zeigen den aktuellen Timerstand in Sekunden.
14. Ist der Timer abgelaufen, wird die Tür geschlossen – Servo geht in Stellung (*Tür zu*).
15. Wird eine Bewegung erkannt, wird der Timer auf 10 Sekunden zurückgesetzt, auch wenn er noch nicht abgelaufen ist.

Bitte kommentieren Sie jede Programmzeile (eine Zeile $\rightarrow$ ein Kommentar; **nicht** hinter den Befehl schreiben!).