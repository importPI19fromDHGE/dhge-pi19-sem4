MMP1 - Themenkatalog
====================

# Grundlagen der Informationsverarbeitung

> **ToDo:**
>
> - Harvard-Architekur (im Vgl. zu Neumann)
> - Unterschied Java, Javascript, C#, C++ (vlt. woanders einordnen?)
> - Einordnung von Programmiersprachen (Vor- und Nachteile) <!--imperativ, deklarativ, objektorientiert, ...?-->
> - Struktogramm?
> - Statisches vs Dynamisches Binden
> - Umrechnen von Zahlensystemen
> - Gleitpunktverfahren
> - Befehlsverarbeitung

## Von-Neumann-Architektur

```text
┌──────────────────────────────┐
│             CPU              │
│ Rechenwerk        Steuerwerk │
│     ╱╲                ╱╲     │
└─────┼┼────────────────┼┼─────┘
      ╲╱                ╲╱
┌──────────────────────────────┐
│          Bus-System          │
└──────────────────────────────┘
      ╱╲                ╱╲
      ││                ││
      ╲╱                ╲╱
┌──────────┐    ┌──────────────┐
│ I/O-Werk │    │ Speicherwerk │
└──────────┘    └──────────────┘
```

- binär codierte Daten und Programme im gleichen Speicher
- Ordnung aufeinanderfolgender Befehle entspricht physischen Speicherung (Abweichungen über Sprünge möglich)
- Kommunikation über BUS-Systeme (Daten-, Adress-, Steuer-, ...)
- **Neumann-Flaschenhals:** Bussystem $\rightarrow$ ein Bus (und Speicher) für Programme und Daten

## `Call by Value` vs. `Call by Reference`

- `Call by Value`: Übergabe der Kopie eines Parameters bei Funktionsaufruf (z.B. `int`, `char` in `C`; Kopie existiert nur innerhalb der Funktion)
- `Call by Reference`: Übergabe der Referenz auf einen Parameter bei Funktionsaufruf (z.B. `*` in `C`; Änderungen bleiben nach Verlassen der Funktion erhalten)

----------------------------------------------------------------------------------------------------------------------

# Digitaltechnik

> **ToDo:**
>
> - Vereinfachung Boolescher Schaltfunktionen (`!a||(!a&&b)`)
> - Prüfsumme vs Hamming-Codes(*Wie können Fehler bei der Signalübertragung erkannt werden?*)
>   - *Wie viele Bits um einen Fehler zu erkennen bzw. beheben?*
> - KV-Diagramme, KNF/DNF (bzw. V-KNF / V-DNF)
> - Arten von Kippgliedern

## Eigenschaften von Codes

> *Was ist ein Code?(+Eigenschaften) Wie funktioniert ein BCD-Code, Binärcodes, Gray-Code*

Code = Abbildungsvorschrift zur Darstellung von Zahlen

- **Bewertbarkeit:** jeder Stelle wird eine bestimmte Wertigkeit zugeordnet
- **Gewicht:** Anzahl der mit `1` belegten Stellen
- **Distanz:** Anzahl der Stellen, die sich zwischen benachbarten Codeworten unterscheiden
- **Stetigkeit:** stetig, wenn die Distanz über den gesamten Code hinweg gleich ist
- **Redundanz:** mögliche Kombinationen vs. vom Code genutzte Kombinationen

### BCD-Code

- binär codierte Dezimalziffern
- Redundanzen: bei 4 Bit nur 10 Kombinationen belegt

```text
Ziffer | BCD-Code
   0   |   0000
   1   |   0001
   2   |   0010
   3   |   0011
   4   |   0100
   5   |   0101
   6   |   0110
   7   |   0111
   8   |   1000
   9   |   1001
```

### Gray-Code

- einschrittiger Code (Vermeidung von Abtastfehlern an einer Codescheibe)

```text
Ziffer | Gray-Code
   0   |   0000
   1   |   0001
-------------------> Reflektionslinie 1
   2   |   0011
   3   |   0010
-------------------> Reflektionslinie 2
   4   |   0110
   5   |   0111
   6   |   0101
   7   |   0100
-------------------> Reflektionslinie 3
   8   |   1100
   9   |   1101
  10   |   1111
  11   |   1110
  12   |   1010
  13   |   1011
  14   |   1001
  15   |   1000
```

### Aiken-Code

- Ziffern 5-9 negativsymmetrisch zu 0-4 $\rightarrow$ Neunerkomplementbildung durch Negation

```text
Ziffer | Aiken-Code
   0   |   0000
   1   |   0001
   2   |   0010
   3   |   0011
   4   |   0100
--------------------
   5   |   1011
   6   |   1100
   7   |   1101
   8   |   1110
   9   |   1111
```

## AD-Wandler

- Umwandeln von analogen Signalen (Spannung) in digitale Signale (`0,1`)

```text
    ⟋         ┌─┘
  ⟋   -->   ┌─┘
⟋         ┌─┘
```

## Volladdierer

```text
x ──┬─────╮╒═══╗
    │     & AND╟───────────────╮╒════╗
y ──│───┬─╯╘═══╝               >=1 OR╟──── cout
    │   │╒════╗                │╘════╝
    │   =1 XOR╟─┬─────╮╒═══╗   │
    ╰───╯╘════╝ │     & AND╟───╯
cin ────────────│───┬─╯╘═══╝
                │   │╒════╗
                │   =1 XOR╟─────────────── s
                ╰───╯╘════╝
```

## KV-Diagramme

```text
AB│
00│ 0 0 1 1
01│ 0 0 1 1  ───╲   Zusammenfassen zu 2er-Potenz-Blöcken (2,4,8,...)
11│ 0 0 0 1  ───╱   -> ¬AD v ¬CD v A¬BC
10│ 0 1 1 1
──┼──────────
 C│ 0 1 1 0
 D│ 0 0 1 1
```

----------------------------------------------------------------------------------------------------------------------

# Elektrotechnik

> **ToDo:**
>
> - Kupferleiter (Widerstand & Kapazitiver Widerstand)
> - RGB???
> - *Warum ist ein RAM-Speicher flüchtig?*
> - *Warum darf/kann ein Kabel für die Signalübertragung nicht unendlich lang sein?*

----------------------------------------------------------------------------------------------------------------------

# Algorithmen und Datenstrukturen

> **ToDo:**
>
> - Verschlüsselung
> - symmetrische vs. asymmetrische Verschlüsselung (*Welche Schlüssel gibt es?*)
> - Schutzziele von Verschlüsselung
> - Hashing (Eigenschaften)
>   - *Wie kann man bei symmetrischer Verschlüsselung prüfen ob die originale Nachricht ankam?*
>   - *Wie kann sondiert werden?*
> - Sortieralgorithmen (+ Klassifizierung)
> - Digitale Signatur
> - Stack, Queue
> - *Was ist ein Graph?* Travelling Salesman-Problem, Minimal Spanning Tree, ...
>   - Tiefen/Breitensuche; Adjazenzmatrix aufstellen können

## Eigenschaften von Algorithmen

- **Eindeutigkeit:** keine widersprüchliche Beschreibung haben
- **Ausführbarkeit:** jeder Einzelschritt muss ausführbar sein
- **Finitheit(= Endlichkeit):** Beschreibung des Algorithmus muss endlich sein
- **Terminierung:** nach endlich vielen Schritten enden
- **Determiniertheit:** bei gleichen Voraussetzungen stets gleiches Ergebnis
- **Determinismus:** zu jedem Zeitpunkt höchstens eine Möglichkeit der Fortsetzung

----------------------------------------------------------------------------------------------------------------------

# Automaten und Sprachen

> **ToDo:**
>
> - *Was ist eine Grammatik? (+Grammatik-Typen)*
> - Turingmaschine erklären können + Beispiel
> - Registermaschine erklären
> - Prinzip der Automatenkonstruktion (NEA, DEA)

## Reguläre Ausdrücke

> *Was sind reguläre Ausdrücke?*

- beschreiben reguläre Mengen

**Definition einer regulären Menge**

- $\emptyset \in R$; die leere Menge ist regulär
- $\{\epsilon\}\in R$; die Menge, die das leere Wort enthält ist regulär
- $\{a\}\in R \;\forall\; a \in A$
- Vereinigungen und Konkatenationen von regulären Mengen sind ebenfalls regulär
  - $(p)^{\ast}$: Konkatenation von $p$ mit sich selbst
  - $(pq)$: Konkatenation von $p$ und $q$
  - $p \lor q$: Vereinigungsmenge von $p$ und $q$
- Eine Menge ist genau dann regulär, wenn sie in endlich vielen Schritten aus diesen Regeln gewonnen werden kann

**Beispiel:** Alphabet $A=\{a,b\}$, dessen Worte weder **aa** noch **bb** enthalten

$$L \subset A^{\ast}=(ab)^{\ast}\lor(ba)^{\ast}\lor a(ba)^{\ast} \lor b(ab)^{\ast}$$

## Turing-Maschine

- Mathematisches Modell, das Berechnbarkeit definiert [Wikipedia](https://de.wikipedia.org/wiki/Turingmaschine#Formale_Definition)
- unendlich langes Band, LS-Kopf arbeitet auf Band : Bandalphabet
- Lese-Schreibkopf kann Lesen, Schreiben, arbeitet auf Band : Eingabealphabet
- Zustandsmenge
- Anfangszustand
- Überführungsfunktion: Wenn in Zustand ..  und Symbol ..  gelesen, dann ist .. neuer Zustand, schreibe Symbol .. und gehe mit LS links/rechts oder bleibe stehen

----------------------------------------------------------------------------------------------------------------------

# Betriebssysteme

> **ToDo:**
>
> - Parallelisierung
> - Seitenersetzungsstrategien, Speicherzuweisungsstrategien
> - virtueller Hauptspeicher
> - Thread/Prozess/Task
> - *Wozu dienen Caches in Rechnersystemen?*
> - *Wie erfolgt die Befehlsabarbeitung in einer CPU?*
> - *Welche Betriebsmittel kennen Sie?*
> - Dateisystemarten nennen können + Vor- und Nachteile

## Definition Betriebssystem

> Die Programme eines digitalen Rechnersystems, die zusammen mit den Eigenschaften dieser Rechenanlage
> die Basis der möglichen Betriebsarten des digitalen Rechnersystems bilden und die insbesondere
> die Abwicklung von Programmen steuern und überwachen
>
> - DIN 44300

## Aufgaben eines Betriebssystems

- Bedienschnittstelle für Nutzer -> Programme (CLI/UI)
- Verstecken technischer Details/Automatisierung von Vorgängen
  - Abstraktion der HW (einfache Programmierschnittstelle)
  - Definition von Konzepten (Prozess, Datei, Speicher, ...)
  - Vermeidung von Fehlern (Schutz der HW -> Stabilität)
- Steuern von Abläufen/Kontrollieren von Ressourcennutzung
  - quasiparallele Ausführung mehrere Prozesse (sichere Trennung)
  - Blockaden von Prozessen verhindern, CPU-Leistung zuweisen
  - effiziente, zuverlässige, sichere Verwaltung
- Dienste für Anwender/Anwendungsprogramme
  - Prozess-, Speicher-, Dateiverwaltung, E/A-Operationen, Interprozesskommunikation (über APIs realisiert)
- Privilegiensystem zum Schutz der Anwendungen untereinander (inkl. OS)
  - Kern-Modus: alle Rechte für Betriebssystem-Code
  - Benutzer-Modus: eingeschränkte Rechte für Anwendungs-Code
  - Schnittstelle zwischen Usermode und Kernel = **Traps** (Einstiegspunkte; vgl. Software-Interrupt)

## Klassifizierung von Betriebssystemen

- *Nach Betriebsart:* Netzwerk-, Realzeit- oder universale Betriebssysteme
- *Nach Anzahl der gleichzeitig laufenden Programme:* Einzel- (singletask) oder Mehrprogrammbetrieb (multitask)
- *Nach Anzahl der gleichzeitigen Nutzer:* Einzel- oder Mehrbenutzerbetrieb
- *Nach Anzahl der verwalteten Prozessoren:* Ein- oder Mehr-Prozessor-Betriebssystem

## Scheduling-Strategien für Prozesse

**Non-präemptive Scheduling**

- First come first serve (FCFS / FIFO)
  - Jobs werden bei Entstehen in Warteschlange eingefügt
- Shortest-Job-First (SJF)
  - Prozesse mit (geschätzt) kürzester Ausführungzeit werden zuerst bedient
- Highest response ratio next (HRN)
  - Bearbeitet Jobs mit maximalem Verhältnis Antwortzeit zu Bedienzeit zuerst. (Zeiten liegen Schätzungen zugrunde)
- Prioritätsscheduling (PS)
  - Nächster Job, der in rechenbereit-Liste aufgenommen wird, wird in Warteschlange gemäß seiner Prioritäten einsortiert

**Präemptive Scheduling**

- Round-Robin (RR)
  - Round-Robin ist eine Kombination aus der FCFS-Strategie und dem Zeitscheibenverfahren
- Dynamic Priority Round Robin
  - Prioritäten der Prozesse in "rechenbereit"-Schlange erhöhen sich nach jeder sie nicht berücksichtigenden Zeitscheibe
- Shortest Remaining Time First
  - Variante von SJF: bevorzugt Jobs mit kleinster restlicher Bedienzeit

## Adressierungsarten

- **Unmittelbar:** Operand direkt im Adressteil (ohne Speicherzugriff)
- **Absolut/Direkt:** Operand in Adressteil angegebene Adresse
- **Indirekt:** Adresse von Speicherzelle enthält Adresse des Operanden
- **Symbolische:** Speicherzelle enthält frei wählbaren Namen
- **Indizierte:** Adressteil + Adresse Indexregister = Adresse des Operanden
- **Relative:** wie indizierte, nur statt Indexregister Basisregister
- **Virtuelle:** Speicherbereich außerhalb physischen Hauptspeichers

## Serielle vs. Parallele Datenübertragung

**Serielle Datenübertragung**

- einzelne Bits werden nacheinander übertragen (eine Leitung)
- geringere Störanfälligkeit; niedrige Übertragungsgeschwindigkeit

**Parallele Datenübertragung**

- mehrere Bits werden parallel übertragen (mehrere Leitungen)
- störanfällig $\rightarrow$ parallele Leitungen beeinflussen sich gegenseitig (Übersprechen)
- Berücksichtigung von Laufzeitunterschieden verschiedener Leitungen nötig

> *Warum ist heute die serielle Datenübertragung verbreiteter?*

- Taktrate hat gegenüber Busbreite gewonnen
- Früher: seriell für langsamere Datenübertragungen über ggf. längere Distanzen
  - parallele für schnellere Übertragungen über kürzere Entfernungen

## Interrupts

> *Was passiert beim Auftreten eines Interrupts? (+Interrupt vs. Trap)*

- Interrupt = kurzfristige Unterbrechung eines Programms durch eine von der CPU abzuarbeitende Befehlssequenz (Interrupt Service Routine $\rightarrow$ schnelle Reaktion auf I/O, Zeitgeber, ...)

**Ablauf**

- Sperren weiterer Unterbrechungen mit gleicher oder geringerer Priorität
- Sicherung wichtiger Register-Informationen
- Bestimmen der Interruptquelle (durch Hardware realisiert)
- Laden des zugehörigen Interruptvektors
- Abarbeitung der Interruptroutine
- Rückkehr zur unterbrochenen Aufgabe (Registerinformationen wiederherstellen)

**Traps**

- Trap = Art automatischer Prozeduraufruf bei bestimmten Bedingungen (z.B. Gleitkommaüberlauf) $\rightarrow$ Programmcounter wird mit Adresse des Trap-Handlers überschrieben

## Semaphore

- Semaphore = Variable, die einem Prozess erlaubt und anderen verbietet
- Manipulation der Semaphore über zwei unteilbare Operationen (reservieren = P(sema); freigeben = V(sema))
- Synchronisation von Prozessen $\rightarrow$ Semaphore realisiert ein passives Warten der Prozesse

## Spooling

> *Was ist Spooling?*

- Dienst verwaltet eine Ressource zentral $\rightarrow$ kann von mehreren Prozessen angefordert werden
- z.B. Drucker-Spooler = Puffer für Druckeraufträge (*nicht bei allen Ressourcen möglich*)

----------------------------------------------------------------------------------------------------------------------

# Betriebssystemverwaltung

> **ToDo:**
>
> - "Datensicherung"

## RAID

- **R**edundant **A**rray of **I**ndependent **D**isks
- Nutzen von Redundanzen zur Erhöhung der Ausfallsicherheit oder des Datendurchsatzes (keine Datensicherung!)
- Mirroring: alle Daten auf mehreren Speichermedien gespeichert (kein Datenverlust bei einem Ausfall)
- Striping: Daten auf allen Speichermedien verteilen (Datenverlust bei einem Ausfall)
  - Parität: Bei verteilter Datenspeicherung durch Striping $\rightarrow$ Speicherung von Paritätsinformationen auf weiterem Speichermedium
- `RAID 0`: Striping über min. 2 Datenträger (höhere Performance, aber keine Ausfallsicherheit)
- `RAID 1`: Mirroring über min. 2 Datenträger (Ausfallsicherheit; geringe Netto-Kapazität; hohe Kosten)
- `RAID 5`: Striping mit Parität über 3-16 Datenträger (hohe Netto-Kapazität und Lesegeschwindigkeit; komplexe Initialisierung, langsames Schreiben)
- `RAID 6`: Striping mit Parität über 4-16 Datenträger (zweite Kopie der Parität $\rightarrow$ Ausfallsicherheit zweier Speichermedien)
- `RAID 10`: Striping und Mirroring über min. 4 Datenträger
- `RAID 50`: Striping, Mirroring und Parität über min. 6 Datenträger
- `RAID 60`: Striping, Mirroring und doppelte Parität über min. 8 Datenträger
- Spare: zusätzliches Speichermedium $\rightarrow$ bei Ausfall erfolgt sofortiger Restore auf Spare

## Pipes

> *Was sind Pipes?*

- Pipes verbinden die Ausgabe eines Programmes mit der Eingabe eines anderen $\rightarrow$ Datenstrom zwischen zwei Prozessen nach dem FIFO-Prinzip
- Symbol: `|`; z.B. `cat example.txt | wc -l`

----------------------------------------------------------------------------------------------------------------------

# Rechnernetze

> **ToDo:**
>
> - IPv4 vs. IPv6 (Aufbau und Vergleich)
> - IP+Routing
> - TCP/IP (inkl. TCP-Fast-Open)
> - DHCP; *Warum braucht man ne IP Adresse anstatt gleich mit MAC zu kommunizieren?*
> - DNS
> - SDSL/ADSL?
> - Netzwerktopologien

## ISO/OSI-Referenzmodell

| Schicht                | Funktion                                                     | Protokolle |
|------------------------|--------------------------------------------------------------|------------|
| Anwendungsschicht      | Kommunikation zw. Anwendungen                                | NFS, DNS,  |
| Darstellungsschicht    | Transformation zw. Datenformaten, Verschlüsselung            | DHCP, HTTP |
| Sitzungsschicht        | Dialogsteuerung, Synchronisation                             | FTP, ...   |
| Transportschicht       | Ende-zu-Ende-Kommunikation zw. Prozessen                     | TCP, UDP   |
| Vermittlungsschicht    | Wegewahl Sender -> Empfänger, Kopplung heterogener Teilnetze | IP         |
| Sicherungsschicht      | Behandlung von Übertragungsfehlern                           | Ethernet   |
| Bitübertragungsschicht | physikalische Ebene -> Übertragung von Signalen              |            |

- Protokolle der oberen 3 Schichten nicht eins zu eins zuordenbar

- Protokoll = Regeln zur Steuerung der Kommunikation
- Dienst = durch Sicht erbrachte Funktionalität

## IPv4 vs IPv6

```text
IPv4                                | IPv6
- 32bit Adressen  (NAT!)            | - 128bit Adressen
- keine autom. Adress-Conf.         | - SLAAC
- variabler Header                  | - konstanter Header + Extension-Header
  -> ineffizentes Routing           |
- Fragmentierung durch Router       | - Fragmentierung durch Sender
```

## UDP vs TCP

```text
UDP                              | TCP
- verbindungslos                 | - verbindungsorientiert
- unzuverlässig                  | - zuverlässig
- geringer Protokoll-Overhead    | - höherer Protokoll-Overhead
- keine Reihenfolgegarantie      | - Reihenfolgegarantie
- Anw.: DNS, DHCP, NTP, SNMP     | - Flusskontrolle, Überlaststeuerung
```

## TCP-Handshake

```text
C                 S
l |->   SYN   ->| e
i |<- SYN,ACK <-| r
e |->   ACK   ->| v
n |             | e
t |<-   ...   ->| r

SYN = Senden der SeqNr
ACK = Bestätigen der SeqNr
```

- **SYN-Flooding** = hohes Datenaufkommen bei vielen halboffenen Verbindungen

## DNS

= Namensauflösung (Domain $\rightarrow$ IP)

```text
                       <-> 1. Root-DNS (/cache)
- Resolver <-> ISP-DNS <-> 2. TLD-DNS (/cache)
                       <-> 3. autoritativer NS (Resource-Record)
```

## TLS

> *Was ist der Unterschied zischen HTTP und HTTPS?*

- setzt auf TCP-Verbindungen auf
- bietet: Authentisierung und Schlüsselaustausch, Verschlüsselungsalgorithmen und kryptographische Hashfunktionen
- sichert z.B. HTTP-Kommunikation (`https`) oder Schlüsseltausch bei OpenVPN
- $\rightarrow$ großer Overhead zusammen mit TCP

## URL-Aufruf

> *Was passiert bei einem Browseraufruf (URL)?*

- Namensauflösung URL -> IP durch DNS
- HTTP-Request
- HTTP Response: Status Code, HTML-Page

----------------------------------------------------------------------------------------------------------------------

# Datenbanken

> **ToDo:**
>
> - Datenbankentwurf (einzelne Modelle, Formalitäten sind sehr wichtig!)
> - ERM
> - *"SQL"*
> - Transaktionen (Eigenschaften)

## ANSI-SPARC Drei-Ebenen-Konzept

- **Externe Ebene:** logische Datenstrukturen der Anw.-Programme zur Präsentation der Daten an den Benutzer
  - $\updownarrow$ logische Datenunabhängigkeit: Sicht der Anw.-Prog. unabhängig von der Gesamtsicht der Daten
- **Konzeptionelle Ebene:** logische Gesamtstruktur der Daten (Eigenschaften, Beziehungen); neutral zu Anw.-Prog. (relationales Modell)
  - $\updownarrow$ physische Datenunabhängigkeit: Anw.-Prog. von physischer Speicherung unabhängig, Speicherstrukturen uninteressant
- **Interne Ebene:** physische Datenstrukturen, Speichermedien

## Datenmodelle

**hierarchisches Modell**

- hierarchische Datensätze mit verschiedenen Feldern
- stark an Filesystem orientiert $\rightarrow$ Baumstruktur (Verweise über Pointer)
- Grenzen: starres Modell, das keine n:m-Beziehungen unterstützt (ohne Redundanzen)

**Netzwerkmodell**

- Verallgemeinerung des hierarchischen Modells $\rightarrow$ keine strenge Hierarchie
- m:n-Beziehungen indirekt über Hilfsdatensatztyp möglich (2x 1:n)

**Relationales Modell**

- ein Objekt besitzt bestimmte Merkmale (= Attribute)
- Beziehungen zwischen den Objekten besitzen ebenfalls Merkmale
- Speicherung in einfacher Tabellenform (Zeilen = Objekte, Spalten = Attribute)
- Darstellung von Beziehungen zwischen Objekten durch Attributwerte statt Pointer

**Objektorientiertes Datenmodell**

- Sammlung von Objekten (enthalten Attribute und weitere Objekte)
- eindeutige Identifikation von Objekten durch unveränderliche Indikatoren
- Erfassen von mehr Semantik $\rightarrow$ aufwändige Verbundoperationen entfallen (Optimierung vs. Datenunabhängigkeit)
- Kriterien: komplexe Objekte, Kapselung, Klassen- und Typhierarchie, Sicherstellung der Objektidentität, ...

**Objektrelationale Systeme**

- Verknüpfung von relationalen Systemen und Objektorientierung

## Operationen im Relationalen Modell

- **Selection:** Auswahl von Zeilen, die bestimmte Bedingungen erfüllen
- **Projektion:** Auswahl bestimmter Attribute eines Datensatzes (Spalten)
- **Join:** Verbinden zweier Datensätze

## ACID (Transkationseigenschaften)

- Atomarität, Konsistenz, Isolation, Dauerhaftigkeit
- **Atomarität**
  - eine Transaktion ist immer atomar (unteilbar)
  - Wenn eine Datenbankanweisung nicht erfolgreich durchgeführt werden kann, müssen alle vorherigen Änderungen der Transaktion rückgängig gemacht werden (Rollback)
- **Konsistenz**
  - vor und nach einer Transaktion befindet sich die Datenbank immer in einem konsistenten Zustand
- **Isolation/Abkapselung**
  - alle Änderungen, die eine Transaktion bewirkt sollen erst nach Beendigung für andere Transaktionen sichtbar werden
  - Sperrprotokolle, Zeitstempelverfahren
- **Dauerhaftigkeit**
  - das Ergebnis einer abgeschlossenen Transaktion steht dauerhaft in der Datenbank, kann nicht mehr verloren gehen

## Sperrkonzepte

**RX-Sperrverfahren**

```text
               vorhandene Sperre
                 | NL | R | X        NL = No Lock   |   + = Sperranforderung realisierbar
angeforderte   R |  + | + | %        R = Read Lock  |   % = bestehende Sperre muss aufgehoben werden
Sperre         X |  + | % | %        X = Write Lock |
```

- Gefahren durch Deadlocks: Transaktionen abbrechen (später erneut durchführen) oder Timeout-Verfahren

## Constraints

> *Was sind Constraints?*

- Wahrung der Konsistenz durch Bedingungen $\rightarrow$ ermöglichen DBMS Integrität zu prüfen
- z.B. `CONSTRAINT ck_plz CHECK (plz LIKE '[0-9][0-9][0-9][0-9][0-9]');`

## Speicherpyramide

```text
Register               ╱╲         1 - 10 ns
Cache                 ╱  ╲      10 - 100 ns      Adressierung von Bytes, flüchtig
Hauptspeicher        ╱    ╲     0.1 - 1  µs
                    ╱      ╲          ╱╲
                   ╱--------╲         ││  Zugriffslücke > 10^5
                  ╱          ╲        ╲╱
Externspeicher   ╱   online   ╲          ms
Archivspeicher  ╱   nearline   ╲        sec      blockadressierbar, nichtflüchtig
Archivspeicher ╱     offline    ╲ sec - min
               ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
```

----------------------------------------------------------------------------------------------------------------------

# Systemanalyse

> **ToDo:**
>
> - V-Modell
> - SCRUM
> - *"agile Entwicklung"*
> - *Welche Phasenmodelle gibt es und wie funktionieren diese?* (inkl. Vor- und Nachteile)
> - *Motivation - Wieso Softwareengineering?*
> - *Welche Rolle spielt das Testen in der SE?*
> - Aufwandsschätzung

## Lasten- und Pflichtenheft

**Lastenheft**

- Basisanforderungen und das grobe Konzept zum Projekt vom Auftraggeber
- Erforderliche Funktionen, Qualitätsanforderungen
- relevante technische Daten und vertragliche Rahmenbedingungen

**Pflichtenheft**

- ausformulierte Lösungen sowie die detaillierten Anforderungen auf Basis des Lastenhefts vom Auftragnehmer
- Dokumentation der Ausgangslage, Definition der Ziele $\rightarrow$ beschreiben der Prozessabläufe
- Soll-Konzept, das die Anforderungen des Auftraggebers erfüllt
- technische Struktur
- tabellarische Übersicht der wichtigsten Daten
- Belege, Ablaufpläne und Checklisten

----------------------------------------------------------------------------------------------------------------------

# Systementwurf

> **ToDo:**
>
> - Compiler vs. Interpreter
> - OOP-Paradigmen
> - *Was ist OOP? Wieso wurde OOP eingeführt? Wofür wird OOP verwendet?*
>   - Unterschied Klasse/Objekt/Interface/abstrakte Klasse
> - UML

## OOP-Paradigmen

<!--Das kann sich gerne nochmal jemand ansehen-->

- Abstraktion: die Implementierung von Klassen bleibt verborgen, nur Schnittstellen sind nach außen sichtbar
- Kapselung: Verbergen von Implementierungsdetails, kein Zugriff auf interne Strukturen
- Persistenz: Objektvariablen existieren, solange die Objekte vorhanden sind
- Polymorphie: Fähigkeit eines Bezeichners, abhängig von seiner Verwendung unterschiedliche Datentypen anzunehmen
- Vererbung: abgeleitete Klasse erben die Methoden und Attribute der Basisklasse

## MVC-Architektur

- **M**odel: Daten
- **V**iew: Darstellung der Daten des Modells, Realisierung der Benutzerinteraktionen
- **C**ontroller: verwaltet Model und View, realisiert Geschäftslogik (Algorithmen)

## XML

> *Was ist XML? Wie können XML-Dateien validiert werden?*

- XML = E**X**tensible **M**arkup **L**anguage
- Auszeichnungssprache zur Darstellung hierarchisch strukturierter Daten in einem Textformat
- für Mensch und Maschine lesbar
- Validierung: wohlgeformt = physische Struktur eingehalten (Regeln der Sprache); valide = entspricht einem definiertem Schema

**tag-basiertes XML**

```xml
<ROOT>
  <MITARBEITER>
    <NAME>Müller</Name>
    <ID>0815</ID>
  </MITARBEITER>
</ROOT>
```

**inhaltsbasiertes XML**

```xml
<ROOT>
  <PROPERTY Name="Mitarbeiter">
    <VALUE TYPE='STR' Bezeichner="Name">Müller</VALUE>
    <VALUE TYPE='INT' Bezeichner="ID">0815</VALUE>
  </PROPERTY>
</ROOT>
```

----------------------------------------------------------------------------------------------------------------------

# Hardwarenahe Programmierung

> **ToDo:**
>
> - *Was ist das wichtigste Flag in Rechensystemen + Wieso? (Overflow-Flag)*
> - *Was ist Pipelining?*

## RISC vs. CISC

```text
Reduced Instruction Set Computing   | Complex Instruction Set Computing
────────────────────────────────────┼─────────────────────────────────────────
reduzierter, homogener Befehlssatz  | komplexer, aber komfortabler Befehlssatz
parallele Verarbeitung              | sequenzielle Verarbeitung
-> geringere Taktrate, Verbrauch    | -> höhere Taktrate, Stromverbrauch nötig
-> aber: Synchronisationsaufwand    |
komplexer Compile-Schritt           | Befehle werden als Microcode ausgeführt
Pipelining möglich                  | Pipelining schwierig
```

----------------------------------------------------------------------------------------------------------------------

# IT-Trends

> **ToDo:**
>
> - Cloud Computing (Warum?, Vor- und Nachteile)
> - *Was sind IoT?*
