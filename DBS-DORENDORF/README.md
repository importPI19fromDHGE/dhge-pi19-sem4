Datenbankentwurf
================

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Inhaltsverzeichnis**

- [Überblick über den Datenbankentwurfsprozess](#%C3%BCberblick-%C3%BCber-den-datenbankentwurfsprozess)
  - [Entwicklung von Datenbankschemata](#entwicklung-von-datenbankschemata)
  - [Phasen des Entwurfprozesses](#phasen-des-entwurfprozesses)
  - [Ableitung des Datenbankschemas aus einer verbalen Spezifikation](#ableitung-des-datenbankschemas-aus-einer-verbalen-spezifikation)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!--newpage-->

# Überblick über den Datenbankentwurfsprozess

Der Entwurf einer Datenbank ist ein aufwendiger Prozess, der mit großer Sorgfalt vorgenommen werden sollte, da Fehler später nur mit hohem Aufwand beseitigt werden können.

Folgende Anforderungen sollten daher im Entwurfsprozess berücksichtigt werden:

- **Anwenderorientiertheit:** Beteiligung der Anwender am Entwurfsprozess; Formulierung der Datenmodelle in der Begriffswelt der Anwender
- **Determiniertheit:** genau ein Datenmodell für eine Problemstellung und einen Umweltausschnitt $\rightarrow$ unabhängig von Interpretation
- **Teilbarkeit:** Gesamtschema muss in einzelne Teilschemata aufteilbar sein
- **Integrierbarkeit:** Schemas, die nur einen Teil des Umweltausschnittes darstellen, müssen in das gesamte Schema integriert werden können

## Entwicklung von Datenbankschemata

- Berücksichtigung zweier Entwurfsphasen, bei der Entwicklung datenbankgestützter IT-Lösungen
  - einmaliger Datenbankentwurfsprozess (DEP)
  - n-maliger Softwareentwicklungsprozess (SEP) für Anwendungen, die auf die zentrale DB zugreifen
- der DEP bildet mit Hilfe von Daten- und Beschreibungsmodellen einen Umweltausschnitt (Miniwelt) auf ein Schema ab
- jeder SEP hat meist eigene Sicht auf Datenbank $\rightarrow$ zusammenfassen zu einem konzeptuellen Informationschema
- durch Transformationsregeln kann das konzeptuelle in ein datenbankspezifisches Schema umgewandelt werden

## Phasen des Entwurfprozesses

- Grundvoraussetzung: Anforderungsanalyse (informelle + operationelle/funktionale Analyse)
- Die Nutzung einer Datenbank und die Aktualisierung des Datenbankschemas beschreibt den **Datenbanklebenszyklus**
- Performance-Aspekte spielen untergeordnete Rolle
- Wahrung der logischen Konsistenz der Datenbank hat hohe Bedeutung
- Schemaevolution = Änderungen der logischen Datenorganisation 
- Tuning-Maßnahmen = Leistungsverhalten des DBMS verbessern (Anpassung Systemparameter $\rightarrow$ Puffer, gezielte Denormalisierung der Datenbankschemata)

**Datenbankreorganisation** = Maßnahmen, die ...

- in Bezug zum Datenbanksystem stehen,
- den logischen Informationsgehalt der DB nicht ändern und
- üblicherweise zur Verringerung der Speicher- und/oder Verarbeitungskosten beim Betrieb vorhandener Anwendungen dienen.
- z.B.: Änderung interner Struktur der DB, Bereinigung/Neuaufbau interner Speicherungsstrukturen

## Ableitung des Datenbankschemas aus einer verbalen Spezifikation

**Informelle Analyse der Spezifikation**

- Analyse des in der verbalen Spezifikation beschriebenen Umweltausschnittes
- Erkennen einzelner Objektklassen und deren Beziehungen untereinander
- Herausfiltern von für die Modellierung relevanten Informationen
- bei ungenauer Spezifikation Qualität stark von den Fähigkeiten des Datenbank-Designers abhängig $\rightarrow$ Beschaffung fehlender Informationen

**Funktionale Analyse der Spezifikation**

- Spezifikation der funktionalen Anforderungen an das System
- auf welche Art und Weise sind einzelne Objekte zu bearbeiten ($\rightarrow$ Verwendungszweck muss bekannt sein)

**Darstellung der Informationsstruktur mit einem semantischen Datenmodell**

- Ergebnisse der ersten Phase werden zu Modell der Informationsstruktur im Umweltausschnitt zusammengefasst
- standardisierte, vom späteren Datenmodell unabhängige Darstellungsformen
- z.B. *Entity-Relationship-Modell*

**Ableitung eines dem Zieldatenmodell angepassten Informationsschemas**

Ableiten einer Informationsstruktur $\rightarrow$ Abbildung von Objekten und Beziehungen zu Struktur die von einem DBMS verwaltet werden kann

**Physischer Entwurf**

- Anpassung des abgeleiteten Schemas an das konkrekt zu verwendende DBMS und die dazugehörige Datenbasis
- Zuordnung einzelner Attribute zu bestimmten Datentypen
- Festlegung von Integritätsbedingungen und referenziellen Integritäten
- Betrachtung von Forderungen nach Datenschutz und Datensicherheit (u.a. Vergabe von Zugriffsrechten)
- Nach dieser Phase erfolgt die Implementierung der Datenbank auf einem konkreten Rechnersystem
