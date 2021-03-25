Systemanalyse
=============

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Inhaltsverzeichnis**

- [Präambel](#pr%C3%A4ambel)
  - [Entwurf-Herangehensweise (Wiederholung System-Analyse)](#entwurf-herangehensweise-wiederholung-system-analyse)
    - [Kostenschätzungen](#kostensch%C3%A4tzungen)
  - [Entwicklungskonzepte](#entwicklungskonzepte)
- [1. Entwicklungs-Konzepte](#1-entwicklungs-konzepte)
  - [1.1 Software-Entwurf](#11-software-entwurf)
  - [1.2 Gliederung des Entwurfsprozesses](#12-gliederung-des-entwurfsprozesses)
  - [1.3 Beispiel](#13-beispiel)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!--newpage-->

# Präambel 

Qualitäts-Verbesserung durch: 
- **Kompetenz der Entwickler**
- **Prozess** (Testen) (*System-Analyse*)
- **Tooling** (Automatisierung) (Testen) (*System-Entwurf*)
- **Wiederverwendung** (*System-Entwurf*)

## Entwurf-Herangehensweise (Wiederholung System-Analyse)

Phasen (jedes Modells):
- Anforderungen
- Analyse
- Entwurf
- Implementierung
- Test
- Übergabe
- Wartung

Schwergewichtig / klassisch:
- Wasserfall
- V-Modell
- V-Modell XT

Agile:
- XP
- SCRUM

> MVP: Minimal Viable Product
>
> Story Board
>
> User Story Format ("Als ... möchte ich ... um ... zu erreichen")
>
> Kommunikation
>
> AGILE: "How to slice a cake"

### Kostenschätzungen

- OO Sicht
- UML
  - strukturelle Ansichten
  - Verhaltensansichten


## Entwicklungskonzepte

> *Was* ist bekannt, wie kommen wir zum *Wie*?

OO-Entwurf & OO-Komponenten:
- zeitlicher Verlauf
- Architekturen (bspw. GUI $\rightarrow$ Fkt $\rightarrow$ Daten...)
- Verteildiagramme
- Verhaltensdiagramme

Entwurfsmuster:
- MVC
- Singleton
- Factory
- Proxy
- Command
- Iterator
- Interpreter

Automatisierung

XML, JSON, CSV

allg. Begriffe $\rightarrow$ Bsp $\rightarrow$ Strukturelle-, Physikalische-, Ablauf-, Logische-Sicht

- Erfolgsfaktoren
- Grundsatzentscheidungen
- Ziele...Aufgaben des Entwurfs

# 1. Entwicklungs-Konzepte
## 1.1 Software-Entwurf

WAS:
- Anforderung
  - Analyse

WIE:
- Design
- Umsetzung
- Test
- ausl.
- Wartung

$\Rightarrow$ Hauptaufgabe des System-Entwurfs

(Voraussetzung: Die Anforderungen sind benannt)

- Zerlegung
- Strukturierung
- Komponenten in Beziehungen bringen

$\Rightarrow$ Software-Architektur
$\rightarrow$ Spezifikation für System-Komponenten

**Subsystem**

> Handy-App Vergleich passt gut
>
> OO Programm: Klasse / Instanz

- abgeschlossene Einheit
- eigenständig funktionsfähig
- definiert Schnitt
- besteht wieder aus Komponenten

**Komponenten**

- Bausteine für Software-System (Pakete (mehrere Klassen/Modulen))

1. benutzt andere Komponenten
2. wird von anderen Komponenten benutzt
3. besteht aus Unterkomponenten

## 1.2 Gliederung des Entwurfsprozesses

**Grobentwurf**
- (1) Architektur-Entwurf
- (2) Subsystem-Entwurf
- (3) Schnittstellen-Entwurf

> unabhängig von der Implementierungs-Sprache

**Feinentwurf**
- (4) Komponenten
- (5) Datenstrukturen
- (6) Algorithmen

**Ablauf**
- (1) Zunächst wird die Architektur entworfen
- (2) Die Architektur wird in Subsysteme untergliedert
- (3) Die Schnittstellen der Subsysteme werden bestimmt
- (4) Die Subsysteme werden in Komponenten unterteilt
- (5) Die Datenstrukturen und (6) Algorithmen werden definiert

## 1.3 Beispiel

Entwickeln Sie eine Software-Architektur!

**A**
- Service-Techniker : mobiles Gerät oder Web-Aufruf $\rightarrow$ 
  1. Auftragsschein ausfüllen 
  2. unterschreiben

- Ziel: DB Ablage

**B**
- aus Reihe von Dienstleistungen aussuchen können
- vor Ort Grobpreis-Aussage machen können
- ggf. Angebotserstellung beauftragen