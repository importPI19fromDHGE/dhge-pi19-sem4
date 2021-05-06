IT-Trends
=========

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Inhaltsverzeichnis**

- [Docker](#docker)
- [Microservices](#microservices)
- [Blockchain und Verschlüsselung](#blockchain-und-verschl%C3%BCsselung)
  - [Hashing](#hashing)
    - [Hashes knacken](#hashes-knacken)
  - [Verschlüsselung](#verschl%C3%BCsselung)
    - [Digitale Signaturen](#digitale-signaturen)
    - [Digitale Zertifikat](#digitale-zertifikat)
  - [Blockchain](#blockchain)
    - [Bitcoin (Kryptowährungen)](#bitcoin-kryptow%C3%A4hrungen)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!--newpage-->

# Docker

<!--ToDo-->

# Microservices

<!--ToDo-->

# Blockchain und Verschlüsselung

## Hashing

- **Hashfunktion** = Zuordnung von großen Eingabemenge (Schlüssel) auf eine kleinere Zielmenge fester Länge (Hashwerte)
- Hashwerte sind einfach zu berechnen
- Umkehroperation sehr komplex (Rekonstruktion der Eingabe unmöglich)

**Algorithmen**

- SHA256: Secure Hashing Algorithm
- MD5: Message Digest 5 (veraltet!)

**Anwendung**

- Speichern von Passwörtern
- Integrität von Dateien sicherstellen

### Hashes knacken

- Bruteforce $\rightarrow$ sehr rechenintensiv (eventuell Versuche begrenzt)
- Speichereffiziente Umkehroperation über **Rainbow-Table** (aufwendig vorher viele mögliche Hashes berechnen)
- Wird durch Salting (Erweitern der Zeichenfolge) verhindert

## Verschlüsselung

- **symmetrische Verschlüsselung:** gleicher Schlüssel zum ver- und entschlüsseln
  - schnell, effizient durch Hardwarebeschleunigung ausführbar
- **asymmetrische Verschlüsselung:** privater und öffentlicher Schlüssel (meist für Entschlüsseln / Verschlüsseln)
  - z.B. End-to-End verschlüsselte Chat-Programme, PGP, Digitale Signaturen

### Digitale Signaturen

- Kombination aus Hash und Signatur $\rightarrow$ Absicherung von Authentizität
- Erstellung: Hashwert der Nachricht berechnen $\rightarrow$ Hash mit privatem Schlüssel verschlüsseln (= Signatur)
- Übertragen wird die Nachricht zusammen mit dem verschlüsselten Hashwert
- Absicherung: Hash mit öffentlichem Schlüssel entschlüsseln $\rightarrow$ Hashwert der Nachricht selbst berechnen und mit dem Entschlüsselten vergleichen
- privater und öffentlicher Schlüssel besitzen dabei umgekehrte Funktionalität

### Digitale Zertifikat

- wird benötigt um zu garantieren, dass ein öffentlicher Schlüssel von einer bestimmten Quelle stammt
- wird öffentlicher Schlüssel durch Mittelsmann manipuliert, wird die verschlüsselte Nachricht für diesen lesbar
- digitale Signatur = Unterschrift $\rightarrow$ digitales Zertifikat = Personalausweis
- öffentlicher Schlüssel ist echt, wenn er durch andere Instanz (= Vertrauenswürdigkeit bestätigt durch vorhergehende Instanz) bestätigt wird $\rightarrow$ Baumstruktur

## Blockchain

- Blockchain = kontinuierliche erweiterbare Verknüpfung von Datensätzen (= Blöcke)
- jeder Block beinhaltet Transaktionsdaten und den Hashwert des vorhergehenden Blocks
- Reihenfolge und Inhalt der Blöcke durch Hashwerte nicht manipulierbar
- Anwendung in Bereichen, in denen Rückverfolgbarkeit und Sicherheit nötig ist

### Bitcoin (Kryptowährungen)

- Blockchain ist die zentrale Technologie hinter vielen Kryptowährungen wie Bitcoin
- Verteilung der Blockchain in einem Peer-to-Peer Netzwerk (jeder Peer besitzt vollständige Kopie, vgl. dezentrale Datenbank)
- Miner fassen Transaktionen zu Blöcken zusammen und propagieren diese im Peer-to-Peer Netzwerk
- Damit ein Block akzeptiert wird, muss dieser einen Hash besitzen, der eine bestimmte Bedingung erfüllt (= Mining-Schwierigkeit, sehr rechenintensiv)
- Anpassung des Schwierigkeitsgrad des Minings erfolgt alle zwei Wochen (je mehr Peers, umso schwieriger wird das Mining)
- diejenige Node die zuerst einen Block mit einem passenden Hash generiert und der vom Netzwerk validiert wird, wird mit 'neuen' Bitcoin belohnt (Belohnung halbiert sich alle 4 Jahre - aktuell 6,25 BTC)
- Neue Blöcke werden etwa alle 10 Minuten erzeugt

> Bitcoin ermöglicht es kryptografisch gesicherte, direkte Transaktionen ohne zentrale Vermittler in einem dezentralen Peer-to-Peer Netzwerk durchzuführen

**Vorteile**

- dezentral, unabhängig von Zentralbanken
- sicherer Wertspeicher (maximale Anzahl von BTC begrenzt)
- freie weltweite Transaktionen, ohne Sanktionen und hohe Transaktionskosten

**Nachteile**

- hohe Eigenverantwortung der Nutzer (ohne Private-Key kein Zugriff auf Wallet)
- irreversible Transaktionen (Diebstahl, ...)
- legt alle Transaktionen offen (Nachverfolgbarkeit vs. Privatsphäre)
- Nutzung für illegale Transaktionen möglich (Silk Road, ...)
- hoher Stromverbrauch des verbreiteten Mining-Algorithmus
