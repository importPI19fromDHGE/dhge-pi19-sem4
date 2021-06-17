MMP1 - Themenkatalog
====================

# Grundlagen der Informationsverarbeitung

> **ToDo:**
>
> - Von-Neumann-Architektur
> - Harvard-Architekur (im Vgl. zu Neumann)
> - Unterschied Java, Javascript, C#, C++ (vlt. woanders einordnen?)
> - Einordnung von Programmiersprachen (Vor- und Nachteile) <!--imperativ, deklarativ, objektorientiert, ...?-->
> - Struktogramm?
> - statisches vs dynamisches Binden
> - Call by Value vs Call by Reference
> - Umrechnen von Zahlensystemen
> - Gleitpunktverfahren
> - Befehlsverarbeitung

# Digitaltechnik

> **ToDo:**
>
> - Vereinfachung Boolescher Schaltfunktionen (`!a||(!a&&b)`)
> - 1-Bit Volladdierer
> - Prüfsumme vs Hamming-Codes(*Wie können Fehler bei der Signalübertragung erkannt werden?*)
>   - *Wie viele Bits um einen Fehler zu erkennen bzw. beheben?*
> - AD-Wandler
> - KV-Diagramme, KNF/DNF (bzw. V-KNF / V-DNF)
> - *Was ist ein Code?(+Eigenschaften) Wie funktioniert ein BCD-Code, Binärcodes, Gray-Code*
> - Arten von Kippgliedern

# Elektrotechnik

> **ToDo:**
>
> - Kupferleiter (Widerstand & Kapazitiver Widerstand)
> - RGB???
> - *Warum ist ein RAM-Speicher flüchtig?*
> - *Warum darf/kann ein Kabel für die Signalübertragung nicht unendlich lang sein?*

# Algorithmen und Datenstrukturen

> **ToDo:**
>
> - *Welche Eigenschaften haben Algorithmen?*
> - Verschlüsselung
> - symetrische vs. asymetrische Verschlüsselung (*Welche Schlüssel gibt es?*)
> - Schutzziele von Verschlüsselung
> - Hashing (Eigenschaften)
>   - *Wie kann man bei symmetrischer Verschlüsselung prüfen ob die originale Nachricht ankam?*
>   - *Wie kann sondiert werden?*
> - Sortieralgorithmen (+ Klassifizierung)
> - Digitale Signatur
> - Stack, Queue
> - *Was ist ein Graph?* Traveling Salesman-Problem, Minimal Spanning Tree, ...
>   - Tiefen/Breitensuche; Adjazenzmatrix aufstellen können

# Automaten und Sprachen

> **ToDo:**
>
> - *Was sind reguläre Ausdrücke?*
> - *Was ist eine Grammatik? (+Grammatik-Typen)*
> - Turingmaschine erklären können + Bsp.
> - Registermaschine erklären
> - Prinzip der Automatenkonstruktion (NEA,DEA)

# Betriebssysteme

> **ToDo:**
>
> - Klassifizierung von Betriebssystemen
> - Scheduling Verfahren
> - Parallelisierung
> - Serielle vs. Parallele Datenübertragung (*Warum heute mehr seriell?*)
> - Semaphoren
> - Seitenersetzungsstrategien, Speicherzuweisungsstrategien
> - virtueller Hauptspeicher
> - Thread/Prozess/Task
> - *Wozu dienen Caches in Rechnersystemen?*
> - *Wie erfolgt die Befehlsabarbeitung in einer CPU?*
> - *Welche Betriebsmittel kennen Sie?*
> - *Was ist Spooling?*
> - Dateisystemarten nennen können + Vor- und Nachteile
> - *Was passiert beim Auftreten eines Interrupts? (+Interrupt vs. Trap)*
> - Adressierungsarten

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

# Betriebssystemverwaltung

> **ToDo:**
>
> - RAID (Hotspare)
> - "Datensicherung"
> - *Was sind Pipes?*

# Rechnernetze

> **ToDo:**
>
> - IPv4 vs. IPv6 (Aufbau und Vergleich)
> - IP+Routing
> - TCP/IP (inkl. TCP-Fast-Open)
> - TLS (HTTP vs HTTPS)
> - *Was passiert bei einem Browseraufruf (URL)?*
> - DHCP; *Warum braucht man ne IP Adresse anstatt gleich mit MAC zu kommunizieren?*
> - DNS
> - SDSL/ADSL?
> - Netzwerktopologien

## ISO/OSI-Referenzmodell

| Schicht                | Funktion                                                     | Protokolle |
|------------------------|--------------------------------------------------------------|------------|
| Anwendungsschicht      | Kommunikation zw. Anwendungen                                |            |
| Darstellungsschicht    | Transformation zw. Datenformaten, Verschlüsselung            |            |
| Sitzungsschicht        | Dialogsteuerung, Synchronisation                             |            |
| Transportschicht       | Ende-zu-Ende-Kommunikation zw. Prozessen                     | TCP, UDP   |
| Vermittlungsschicht    | Wegewahl Sender -> Empfänger, Kopplung heterogener Teilnetze | IP         |
| Sicherungsschicht      | Behandlung von Übertragungsfehlern                           | Ethernet   |
| Bitübertragungsschicht | physikalische Ebene -> Übertragung von Signalen              |            |

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

# Datenbanken

> **ToDo:**
>
> - Datenbankentwurf (einzelne Modelle, Formalitäten sind sehr wichtig!)
> - Datenmodelle: hierarchisch, relational, objektorientiert
> - relationales DBMS: Selektion/Projektion/Join
> - ERM
> - *"SQL"*
> - ACID
> - "Speicherpyramide"
> - Transaktionen (Eigenschaften)
> - Sperrverfahren
> - *Was sind Constraints?*

## ANSI-SPARC Drei-Ebenen-Konzept

- **Externe Ebene:** logische Datenstrukturen der Anw.-Programme zur Präsentation der Daten an den Benutzer
  - $\updownarrow$ logische Datenunabhängigkeit: Sicht der Anw.-Prog. unabhängig von der Gesamtsicht der Daten
- **Konzeptionelle Ebene:** logische Gesamtstruktur der Daten(Eigenschaften, Beziehungen); neutral zu Anw.-Prog. (relationales Modell)
  - $\updownarrow$ physische Datenunabhängigkeit: Anw.-Prog. von physischer Speicherung unabhängig, Speicherstrukturen uninteressant
- **Interne Ebene:** physische Datenstrukturen, Speichermedien

# Systemanalyse

> **ToDo:**
>
> - V-Modell
> - SCRUM
> - *"agile Entwicklung"*
> - *Welche Phasenmodelle gibt es und wie funktionieren diese?* (inkl. Vor- und Nachteile)
> - *Motivation - Wieso Softwareengineering?*
> - Lastenheft/Pflichtenheft
> - *Welche Rolle spielt das Testen in der SE?*
> - Aufwandsschätzung

# Systementwurf

> **ToDo:**
>
> - Compiler vs. Interpreter
> - OOP-Paradigmen
> - *Was ist OOP? Wieso wurde OOP eingeführt? Wofür wird OOP verwendet?*
>   - Unterschied Klasse/Objekt/Interface/abstrakte Klasse
> - MVP-Architektur
> - UML
> - *Was ist XML? Wie können XML-Dateien validiert werden?*

# Hardwarenahe Programmierung

> **ToDo:**
>
> - *Was ist das wichtigste Flag in Rechensystemen + Wieso? (Overflow-Flag)*
> - RISC, CISC
> - *Was ist Pipelining?*

# IT-Trends

> **ToDo:**
>
> - Cloud Computing (Warum?, Vor- und Nachteile)
> - *Was sind IoT?*
