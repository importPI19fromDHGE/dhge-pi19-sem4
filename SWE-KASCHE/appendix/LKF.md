# Lernkontrollfragen

## System-Analyse

### Einleitung / Überblick

#### SW-Engineering definieren

> Zielorientierte Bereitstellung und systematische Verwendung von Prinzipien, Methoden und Werkzeugen
> für die arbeitsteilige, ingenieurmäßige Entwicklung und Anwendung von umfangreichen Softwaresystemen.
> Zielorientiert bedeutet die Berücksichtigung z.B. von Kosten, Zeit und Qualität.
>
> - [Helmut Balzert: Lehrbuch der Software-Technik](https://www.doi.org/10.1007/978-3-8274-2247-7)

#### Phasen der SW-Entwicklung unabhängig vom verwendetet Modell benennen

- Anforderungen (Anforderungsanalyse)
- Strukturierung der Entwicklung
- Entwurf und Entwicklung der Lösung
- Betrieb und Wartung der Lösung
- Qualitätssicherung (Testen)

#### Unterschied zwischen SW-Entw.-Phasen und –Modell benennen

- Software durchläuft im Entwicklungsprozess üblicherweise bestimmte, meist ähnliche SW-Entw.-Phasen
- Die Umsetzung, Aneinanderreihung und das Verhältnis dieser Phasen zueinander wird in SW-Entw.-Modellen definiert

#### ein Beispiel für ein MVP nennen

- **MVP** = **M**inimum **V**iable **P**roduct (minimales überlebensfähiges Produkt)
- Testen eines Produktes mit möglichst wenig Entwicklungsaufwand
- Amazon: verkaufte anfangs nur Bücher, später Expansion in andere Produktkategorien
- Groupon: Launch mit einfachem Wordpress-Blog vor der Entwicklung einer eigenen Plattform
- Airbnb: zunächst nur einfache Website Vermietung der Wohnung der Gründer, danach Öffnung für andere Gastgeber

#### Das MMM-Prinzip erläutern

- **MMM** = **M**ensch, **M**aschine, **M**ethode
- Zuerst schauen: *"Habe ich die richtigen Mitarbeiter?"*
- Danach prüfen: *"Habe ich die richtige Hardware/Software?"*
- Zuletzt hinterfragen: *"Verwende ich die richtigen die Methoden?"*

#### Regeln der SW-Entwicklung benennen

**1. Klartext reden**

- Linear:
  - Was möchte der Kunde bekommen?
  - Pflichtenheft (Was hat der Entwickler verstanden, was macht er?

- Agil:
  - feste Struktur & klare Regeln → jedoch adaptierbar
  - Backlog → Aufgabensammlung
  - Refinement Prozess!

**2. Gründliche Vertragsgestaltung**

- Wasserfallmodell
  - 1/2 Jahr rechtsichere Formulierung des Lastenhefts
  - gleiche Begriffe zu Beginn des Lastenhefts abklären
  - dritte Person ließt, versteht und korrigiert → unterschreibt

- Agil:
  - Backlog + Refinement

**3. Wandelnde Anforderungen: Wie gehe ich damit um?**

- Zum Beispiel: keine Zusatzleistungen bzw. E-Mail/mündlich → am Ende: was zählt?
- Change Request Prozess:
- Request → Impact, Analysis → Approve / Deny → Implementation → Business
- 14 Tage Cycle: Planning, Review, Retro

#### DOD und DOR erklären und deren Bedeutung benennen

- Checklisten
- Immer anhand einfach zu bestimmender Metriken definieren.
- Definition of Ready (allgemein): Was sollte erledigt sein, damit eine Aufgabe begonnen werden kann? Konkret / allgemein
- Definition of Ready (SCRUM): Liste von Kriterien, die Backlog Items erfüllen müssen, bevor sie in Sprint eingeplant werden.
  - Beispiel:
  - Item im Product Backlog
    - ist klein genug für Sprint
    - ist verständlich
    - hat Aktzeptanzkriterien
    - ...

- Definition of Done: Wann ist die Aufgabe/Projekt erledigt?
  - Beispiel:
  - Der Code ist fertiggestellt und im Versionierungssystem eingespielt.
  - Es gab einen Code Review bzw. der Code wurde im Pair Programming erarbeitet.
  - Es gibt entsprechende Unit Tests und diese stehen auf grün.
  - Alle Akzeptanzkriterien sind erfüllt.
  - ...

Quellen:
[DOR 1](https://www.scrum-events.de/was-ist-die-definition-of-ready-dor.html)
[DOR 2](https://t2informatik.de/wissen-kompakt/definition-of-ready/)
[DOD](https://www.scrum-events.de/was-ist-die-definition-of-done-dod.html)

#### Die äußere Form einer User-Story benennen

> Als ... möchte ich ... um ...

- Erklärung eines Features aus Sicht einer Person, die das Feature verwenden will

### Retrospektive

#### Benennen, wozu eine Retro gut ist

- ausschließliche Betrachtung des Prozesses

#### Erläutern, welche Vorteile eine regelmäßige Retro hat

- Verbesserung der Zusammenarbeit im Team
- Verbesserung der Arbeit des Teams
- aufgestauten Frust vermeiden
- Raum geben, um Probleme im Team offen anzusprechen
- Maßnahmen zur Optimierung des Zusammenhalts im Team entwickeln

[Quelle: T3N](https://t3n.de/news/scrum-was-ist-eine-retrospektive-1129292/)

#### sagen, wer die Retro im Scrum-Prozess leitet

- die Retrospektive wird durch den Scrum Master geleitet

#### Die Elemente eine Retro-Veranstaltung aufzählen

- Intro: Begrüßung, über Ziele der Retrospektive abstimmen
- Daten sammeln: Was ist gut und was schlecht verlaufen? Analyse und Priorisierung einzelner Themen
- Einsichten gewinnen: Teilnehmer erörtern Erfahrungen; Ermittlung von Ursachen für Erfolge und Misserfolge
- Maßnahmen beschließen: Konstruktion konkreter Maßnahmen, die zu Veränderungen führen sollen
- Abschluss: Rückblick auf die Retrospektive; Verbesserungsvorschläge für zukünftige Retrospektiven sammeln

[Quelle: T3N](https://t3n.de/news/scrum-was-ist-eine-retrospektive-1129292/)

#### darstellen, was und wieviel nach dem Clustern der Impediments erzeugt werden muss

- Impediments=Behinderung der Arbeit
- Improvement-Backlog erzeugen (?)
- Relevanz?
- ToDo

#### Die empfohlene Häufigkeit einer Retro beim Scrum und bei anderen Vorgehensmodellen jeweils erläutern

- SCRUM-Vorgabe: Am Ende des Sprints
- Bei kurzen Sprints (z.B. 1 Wochen) ist es sinnvoll, davon abzuweichen. Retro dann erst nach mehreren Sprints.
- [t2informatik](https://t2informatik.de/wissen-kompakt/scrum-retrospektive/), Scrum Guide empfiehlt 3h / Monat Retro
- Bei 2 Wochen Sprint also z.B. 2 x 1,5 h
- Bei 1 Wochen Sprint das gleiche, Retro nach jedem zweiten Sprint

Andere Modelle: vielleicht nach jedem Projekt, wenn überhaupt

- Wasserfall, V-Modell, Spiralmodell: eigentlich nicht vorgesehen
- ToDo

### Phasenmodelle

#### Die fünf Phasen des Wasserfall‐Modells benennen und erläutern

- **Analyse:** Funktionsumfang, User Interface, Leistungsverhalten, Termine klären (Lastenheft als Grundlage)
- **Design:** Festlegen der inneren Struktur der Software $\rightarrow$ Komponentenzerlegung; Erstellung des Pflichtenhefts
- **Programmierung:** Komponenten (Module) werden anhand des Entwurfs implementiert
- **Integration / Test:** Zusammenfügen einzelner Komponenten (Integrationstest); nach Zusammenfügen Systemtest (Konsistenz bezüglich der Produkt-Definition prüfen)
- **Einsatz / Wartung:** Fehlerkorrektur, Änderungen und Erweiterungen der Funktionalitäten und Anpassungen an andere System-Umgebungen bis zum Abschalten der Software

#### Das Wasserfall‐Modell hinsichtlich Vor‐ und Nachteilen evaluieren

**Vorteile**

- Gesamtkosten und Aufwand zu Beginn klar
- Einzelabschnitte sind wenig komplex
- Phasenpipelining möglich

**Nachteile**

- wenig Flexibilität bezüglich Änderungsmöglichkeiten
- Testen nur am Ende
- für komplexe Aufgaben oder große Teams ungeeignet
- Kunde wird kaum involviert
- Fail Early wird nicht unterstützt

#### Eine Weiterentwicklung des Wasserfall‐Modells zum iterierte Phasenmodell motivieren

- Iteriertes Phasenmodell: Phase kann bei Problemen wieder zurückgesetzt werden
- PDCA-Prinzip: **P**lan, **D**o, **C**heck, **A**ct, *(zurück zu Plan)*
  - kurze Planungszeit, schnell in das *Do* übergehen und nach kurzer Zeit prüfen

#### Einen Prototyp vom Pretotype unterscheiden

- Pretotype = *"fake it till you make it"*
  - Teil der Fail-Early Idee $\rightarrow$ es wird so getan, als wäre eine Funktion vorhanden (keine tatsächliche Implementation)
  - Ziel: Bedarf einer Lösung, Art und Weise der Nutzung und Erfolgskriterien für ein Produkt benennen
  - z.B. Simulation der Interaktion in einer App über mehrere Papierskizzen mit grobem Interface der verschiedenen Screens
- Prototyp
  - **funktionsfähiges, vereinfachtes Versuchsmodell** eines geplanten Produktes
  - sammeln praktischer Erfahrungen, klären von Anforderungen
  - Ziel: Funktioniert es wie gedacht? Kann ich es überhaupt entwickeln?
  - Gefahr: wird nicht wieder weggeworfen, als Doku-Ersatz missbraucht oder Aufwand zu hoch

#### Fünf Grundprinzipien nennen, die den Design‐Thinking‐Prozess befördern und kenne die vier Phasen des Design‐Thinking‐Prinzips

- = Methode für den Innovationsprozess
- **Idee:** Iterationen, Prozesse und Objekte bewusst gestalten, die sich streng an den Bedürfnissen des zukünftigen Nutzers orientieren
- **Grundprinzipien:**
  - bildlich Arbeiten
  - früh und oft scheitern (*fail early!*)
  - Quantität ist wichtig: viele Herangehensweisen sammeln, aber nicht in die Tiefe verfolgen
  - wilde Ideen zulassen und ermutigen
  - insgesamt kundenorientiert
- **Phasen:**
  - **Inspiration:** Verstehen und Beobachten $\rightarrow$ Was soll für wen entwickelt werden?
  - **Ideen:** *verknüpfen, sprudeln lassen*
  - **Testen:** Pretotyp, Prototyp, ...
  - **Machen:** *nicht nur reden*

### Spiralen-Modell, V-Modell, XP

#### Die Quadranten des Spiralen-Modells

- **Ziele**, Alternativen und Rahmenbedingungen
- **Risiken** abschätzen und reduzieren, Evaluierung der Alternativen
- **Realisierung** und Überprüfung
- **Plan** für den nächsten Zyklus
- Annäherung an Gesamt-Ziel durch zyklische Wiederholung der vier Phasen
- Weiterentwicklung des Wasserfallmodells; versucht auf sich ändernde Ziele während des Projektfortschrittes zu reagieren

#### Der Entwicklungsablauf beim Spiralen-Modell

| Zyklus | Phase 1                                | Phase 2                            | Phase 3                                 | Phase 4          |
|--------|----------------------------------------|------------------------------------|-----------------------------------------|------------------|
| 1      | Planung                                | Risiko, Prototyp 1                 | Anforderungen                           | Entwicklungsplan |
| 2      | Ziele, Alternativen, Rahmenbedingungen | Risiko, Prototyp 2                 | Grob-Entwurf                            | Testplan         |
| 3      | Ziele, Alternativen, Rahmenbedingungen | Risiko, Prototyp 3 (betriebsfähig) | Fein-Entwurf, Code, Integrieren, Testen | ...              |

#### Zielkriterien, warum überhaupt Entwicklungsmodelle verwendet werden

- Struktur in Entwicklung bringen
- Vorhersagen ermöglichen
  - Personal
  - Kostenplanung
  - Zeitpunkt der Fertigstellung
- Dokumentation und Tests werden (oft) obligatorisch

#### Das allgemeine V-Modell und dessen Vorteile gegenüber anderen Phasen-Modellen

![Schematische Darstellung des V-Modells](assets/v-modell.png)

| Vorteile                                              | Nachteile                                                                                                         |
| ----------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| klarer Ablauf (nächster Schritt bei Fehler wird klar) | Fehler in der Analyse-Phase erst sehr spät sichtbar (früher mehr Kommunikation mit dem Kunden und MVP als Lösung) |
| klare Test-Struktur vorgegeben                        | bezieht sich nur auf Entwicklung: Kein Betrieb, keine Wartung definiert                                           |
| Iterationen bis alle Tests der Phase OK sind          | kein Rückspringen in vorherige Phase ohne Fehlerfall vorgesehen (siehe iteriertes Wasserfallmodell)               |

#### Die Bedeutung des XT beim V-Modell-XT

- XT-> Extreme Tailoring
- an Bedürfnisse anpassbar
- Auftraggeber mit eingebunden
- stärkere Modularisierung
- mehr in Richtung AGIL

#### Die Bausteine des V-Modell-XT, die vier Projekt-Typen und einige Durchführungs-Strategien

Bausteine

- unbekannt, nicht behandelt in der VL
- Web sagt:
- Projektmanagement
- Qualitätsicherung
- Konfigurationsmanagement
- Problem- und Änderungsmanagement
- Systemerstellung
- Anforderungsfestigung
- Lieferung und Abnahme
- Vertragsschluss
- (Einführung und Pflege eines organisationsspezifischen Vorgehensmodells)

4 Projekt-Typen:

1. Auftraggeber Projekt (AG): Vergabe von Entwicklungsaufträgen
2. Auftragnehmer Projekt (AW): Entwicklung
3. AG/AW: ohne Vertragsverhältnis (z.B. Fach + Developer Abteilung sitzen zusammen)
4. Organisationsspezifisches Projekt

Durchführungs-Strategien:

- ToDo

#### Die 3 Säulen, deren sich das V-Modell-XT bedient

- 3 Säulen: Meta-Modell, freie Inhalte, Werkzeuge

**Meta-Modell**

- Rollen
- Produkte
- Beziehungen (Aktivitäten)

feste Inhalte + optionale Bestandteile
Produkt-orientierte Arbeitsweise + Tailoring
Auftrag-Geber / Auftrag-Nehmer im Sprachgebrauch + Schnittstellen (Synchronisations-Punkte)

**Werkzeuge**

- V-Modell XT-Editor (für Anpassungen)
- V-Modell XT-Projekt-Assistenten (Tailoring)
- XML-Technologie basierend

|                     |                                                                                |
| ------------------- | ------------------------------------------------------------------------------ |
| produktorierentiert | nicht *wie*, sondern *was* "hergestellt" wird                                  |
| Produkte            | Software-Code, Modelle, Dokumentationen, Zwischenergebnisse (auch als SW-Code) |

für alle Produkte gibt es sog. Entscheidungspunkte (Milestones)

- inklusive Aussagen zur Qualitätskontrolle
- DoD

> DoR: "Definition of Ready"
> DoD: "Definition of Done"

#### Der Grund für den Buchstaben X beim Extrem Programming und Erläuterung für mindestens drei von den vier Technike

> XP setzt bewährte Techniken im extremen Maße ein

E**X**TREME

1. Paar-Programmierung
   kontinuierliches Review
2. Testen
   kontinuierliches Testen
3. Refactoring
   kontinuierliches Design / Redesign
4. Feedback an Kunden
   kurze Release Zyklen

#### Mindestens eine übernehmenswerte Technik aus dem XP für andere Vorgehensweisen

- Entscheidung zu fällen, was am Besten sei, schwierig ( war auch nicht gefragt)
- Individuell lernen

Alle?
kontinuierliches Testen ist essenziel!

### SCRUM

#### Vier Phasen einer empirischen Prozess-Kontrolle benennen und die Vorteile darstellen

Vier Phasen:

- Plan
- Do
- Check
- Act (zurück zu Plan)

Charakter des PDCA:

- kurze Planungszeit, schnell in das Doing übergehen und nach kurzer Zeit prüfen
- soll zu einer besseren Lösung führen
- transparenter Prozess
- Doing + Überprüfung + Anpassung
- häufige Wiederholung

#### Den SCRUM-Ablauf beschreiben

<!--- kollidiert inhaltlich mit "Einzelnen Events aufzählen, bzw kann ich (Jonathan) die Fragen nicht wirklich unterscheiden --->

1. Vision $\rightarrow$ Produktbacklog: im Produktbacklog ist die oberste Aufgabe die Wichtigste
2. Sprint-Planning: Team erstellt ein Sprint-Backlog aus dem Produkt-Backlog (Definition eines Sprint-Ziels)
3. Bearbeitung des Sprints (meist 14 Tage)
  - Daily Meeting (jeder im Team erzählt ganz kurz, woran er gerade arbeitet)
  - am Ende des Sprints: Sprint Review (bezieht sich konkret auf den Inhalt des Sprints)
  - Retrospektive (bezieht sich auf den Prozess des Sprints, realisierbar durch KSSP) $\rightarrow$ zurück zu 2.
- Die 4 festen Events sind nicht abwählbar

aber Aussage
>Bei SCRUM kann vieles an Bedürfnisse vom Team angepasst werden

#### Die Rollen und deren Aufgaben im SCRUM-Prozess benennen

- **Product Owner**
- **SCRUM Master**
- **Team**

**Product Owner**

- muss eine "Brücke" zwischen Business und Development herstellen
- muss ROI (Return of Investment) gewährleisten
- ist die Schnittstelle zum Kunden $\rightarrow$ muss die Kundenbedürfnisse verstehen und einordnen
- **Value:** muss Kriterien für den Value definieren und ihn erhöhen $\rightarrow$ Was und Warum?
- ist für Sprint Reviews verantwortlich
- muss Backlog Prioritäten setzen

Aus praktischer Erfahrung ist der PO:

- ein Full-Time Job
- eine Authoritätsperson
- genau eine Person

**Entwickler-Team**

- besteht idealerweise aus 7+-2 Mitarbeiter
- selbstorganisierend
- Mitarbeiter ist typischerweise "I-shaped" $\rightarrow$ hat auf einem Gebiet extrem tiefes Wissen
- das Ziel ist jedoch ein "T-shaped" Mitarbeiter $\rightarrow$ hat ein breites Wissen, mit einem Spezialbereich
- sind Macher
- sind nach außen geschützt

**SCRUM-Master**

- Kümmerer (kümmert sich um Probleme seiner Mitarbeiter)
- Diener + Führer in einer Person
- Prozessbeobachter
- dokumentiert u.A. den Fortschritt der Entwicklung
- hilft dem Team, Probleme zu lösen
- idealerweise ist der SCRUM-Master ein fachfremder Mitarbeiter

#### Die einzelnen Events des SCRUM aufzählen und Ziel sowie personelle Zusammensetzung eines jeden Events kennen

- Sprint Planning (Alle)
- Daily Scrum (Dev-Team, gelegentlich SCRUM Master, nicht PO)
- Retro (Alle)
- Sprint Review (Alle + wechselnde Stakeholder)

[guckst du hier](https://agility.im/frequent-agile-question/who-attends-what-event-in-scrum/)

#### Die Zielrichtung für das Pflegen einer Pairing-Tabelle darstellen

**Pairing-Tabelle** als Werkzeug:
Ziel: eine realistische Aufteilung der Themen auf die Mitarbeiter

- Realisierung durch eine einfache (Excel) Tabelle
- es wird schnell klar, ob Mitarbeiter zu wenige oder zu viele Themen bearbeiten sollen
- die Machbarkeit des Sprints wird frühzeitig sichtbar

Einschränkungen:

- pro Zeile ein Thema
- Anzahl der Themen soll ca. Anzahl Mitarbeiter / 2 sein
- Spalten den Mitarbeitern zuordnen
- Verantwortliche (zu den Themen) zuordnen
- pro Mitarbeiter habe ich Informationen: Zu viele Verantwortlichkeiten? Zu viele Themen?
- pro Zeile: Informationen, wie viele Mitarbeiter im Thema involviert sind
- **ZIEL:** Probleme frühzeitig sichtbar machen! (und im Idealfall lösen)

> Die Anzahl der Zeilen (Themen) ist künstlich beschränkt! (da T-shaped Mitarbeiter --> die Mitarbeiter sollen voneinander lernen können)

#### Sagen, warum DOR und DOD verwendet werden sollten

- Klar festlegen wann Aufgabe / Story Ready $\Rightarrow$ Doing und Doing $\Rightarrow$ Done geschoben werden kann
- z.B. Scrum: Wann ist User-Story bereit zur Bearbeitung; Wann ist die fertiggestellt?
- Überblick über Fortschritt einer Aufgabe

#### Aus Checklisten herausfinden, welche Punkte nicht in eine DOR bzw. DOD kommen sollten

- leicht messbar muss es sein!
- Gesamten Prozess sichtbar machen

#### Checklisten den einzelnen Typen (DOR, DOD) zuordnen und ggf. wichtige fehlende Punkte ergänzen

?!

#### Das SCRUM-Manifest und dessen Anwendung erläutern

ist eine öffentliche Erklärung von Zielen / Absichten im SCRUM-Prozess als **Entscheidungshilfe** für ganzheitliche Transformationen

>(agile Prozesse, Geschäftsarchitekturen, liquide Netzwerkstrukturen, ...) 

gegenüber dem Klammern an alten Strukturen.

- **Individuen** stehen ***über*** den **Tools und Prozessen**
- **Produkt** steht ***über*** der **Dokumentation**
- **Zusammenarbeit** steht ***über*** **Vertragsverhandlungen**
- **Änderungen** stehen ***über*** dem **Plan**

**Anwendung**

- keine Anleitung, Manifest muss gelebt werden
- Verwendung von untergeordneten Dingen ist trotzdem möglich
- alte, starre Strukturen [Silodenken](https://www.pfi.or.at/blog/wie-schlimm-ist-silodenken/) aufbrechen, sich um den Menschen kümmern
- man braucht trotzdem einen konkreten Plan
- Umsetzung entscheidet am Ende; Nicht die Strategie

#### (Ich kann) ein Kanban-Board für eine Aufgabe erstellen und die Bedeutung eines Kanban-Boardes für die SW-Entwicklung sowie für Bereiche außerhalb der Informatik kennen

- Atomare Aufgaben auf Karten (phsyisch) oder digital (trello)
- zeitlich unbegrenzter Durchlauf: **Fortschritt des gesamten Projekts (auf einen Blick) einsehbar**
- Priorität sichtbar: oben nach unten; von hoch bis niedrig.
- maximal 2 Aufgaben / Mitarbeiter im Doing
- Anfangen, bevor alle ToDos klar sind / Neue können dazukommen

übliche Kategorien:

- ToDo
- Doing
- (On hold)
- Review
- Done
- eigene Kategorien

Beispiele außerhalb der IT:

- Projektarbeit DHGE
- "Studentenparty"

#### Ein STORY-Board für eine SW-Entwicklungs-Aufgabe erstellen und den Vorteil der Verwendung motivieren

- Lt. Kasche: Aus User-Sicht
- Kopfzeile: Einteilung in Blöcke, darunter detaillierter werden, Features beschreiben
- Priorisierung von oben nach unten
- MVP bilden
- Dem Nutzer zeigen / mit ihm erstellen $\Rightarrow$ gewünschte Priorisierung wird klar

### Aufwandsschätzungen

#### Scrum-Poker in seiner Art erläutern sowie Vor- und Nachteile auflisten

- Schätzmethode für fundierte, grobe Schätzung unter Einbezug des (meist agilen) Teams
- keine direkte Zeit+Geld Aussagen kommen als Ergebnis heraus!
- Spaßfaktor $\Rightarrow$ Teamgeist
- Basis des Planning-Poker: Karten mit Story-Points (quasi Aufwand)
- Kartenwert von unten aus meist Fibonacci, höher dann gröbere Schritte
  - 0: Aufgabe ist quasi schon erledigt
  - 0.5: Kaum Aufwand
  - 1-5: klein
  - 8-20: mittel
  - 40-100: XL
  - Kartenwert kann mit Fragezeichen versehen werden $\rightarrow$ man ist unsicher, was den Aufwand angeht
  **P**ausen-Karte (manchmal mit Kaffeetasse dargestellt): triviale Aufgabe oder: "Ich brauche eine Pause"

**Ablauf**

1. Scrum-Master liest Aufgabe vor
2. Fragen sind erlaubt $\rightarrow Timebox \leq 1 Min$, Aufgabe von Scrum-Master! **Keine bewertenden Aussagen zulassen!**
3. alle Karten umdrehen
4. Minimal + Maximal begründen ihre Wahl
- *alle* Anderen haben Redeverbot
5. zurück zu 2. $\rightarrow$ i.d.R. maximal 2 Iterationen

**Charakter der Veranstaltung/Bewertung**

Vorteile:

- Fragen können direkt geklärt werden, alle sind vor Ort
- keine $\alpha$-Tier-Meinungen in der Schätzung
- keine Autoritäts-Meinungen dabei (muss auch so umgesetzt werden!)
- alle sind mit im Boot $\Rightarrow$ Engagement
- nur Debatten bei unterschiedlichen Meinungen (effizient)
- alle haben eine Stimme
- Teams sind besser als einzelne Experten (i.d.R.)

Nachteile:

- zeitaufwendig, Eingewöhnungszeit
- nur Debatten bei unterschiedlichen Meinungen (betriebsblind)
- alle haben eine Stimme
- Diversität in Gruppen wird benötigt (T-shaped, mitreden können)
- keine Planung sondern Schätzung! (muss klar sein)

#### Die drei wesentlichen Säulen von Scrum-Poker ähnlichen Schätzverfahren benennen und begründen, warum ein neues Verfahren, welches ich mir ausdenken würde, genau diese drei Aspekte beheimaten sollte

- ???

- grobe Schätzwerte, Kategorien, Aufwand 44 oder 45 kann niemand schätzen, "mittel" oder "viel" schon eher
- Kommunikation und Arbeitsklima: alle sind dabei, nur Inhalt ist relevant

- Transparenz: Aufgaben sind bekannt, Meinungen der Extreme werden offen vorgetragen
- Überprüfung: SCRUM Master überprüft Prozess, keine wertenden Aussagen
- Anpassung: Schätzung wird nach Aussprache ggf. angepasst

- ToDo

#### Monatsaufgaben eines SW-Entwicklers benennen

- ToDo

#### Das Teufelsquadrat zur Argumentation verwenden und wissen, wann ich es einsetzen kann

- Inhalt
- Qualität
- $\frac{1}{Kosten}$
- $\frac{1}{Zeit}$

**Argumentation**

- Nicht alle Parameter können optimiert werden!
- Wenn ein oder zwei Ecken ausgereizt werden, "leiden" die anderen.
- Prioritätensetzung, Machbarkeit

**Verwendung**

- Zieldefinition bei Projektstart
- Steuerung bei Änderungen

#### Faktoren benennen, die Aufwandschätzungen beeinflussen

- ToDo

#### empirische Schätzverfahren benennen und deren Ablauf-Restriktionen darstellen

- ToDo

#### Delphi-Methode mit Scrum-Poker vergleichen

| Kategorie                           | Delphi                                      | SCRUM                                       |
| ---------------------------------- | ----------------------------------------------------------------------------------------- |
| Teilnehmer                         | mehrere unabhängige Experten                | Team, Product Owner, Scrum Master           |
| Anzahl Runden                      | quasi beliebig                              | maximal 2                                   |
| Aufwand                            | (sehr) hoch, aber nicht fürs Team! (extern) | hoch, dafür teambildend                     |
| geeignete Teamgröße der Projekte   | für kleine Teams nicht sinvoll              | für (sehr) große Teams ungeeignet           |
|                                    | nach oben open End                          |                                             |
| Konsenzfindung                     | Diskussion über Ausreiser                   | Diskussion über Ausreiser                   |
| Kosten                             | zusätzlich                                  | Personalkosten                              |
| Sichtbarkeit von Schätzfehlern     | beliebiger Zeitpunkt, Verzug möglich        | meist früh erkannt, Ausnahme: betriebsblind |

- ToDo

#### Algorithmische Schätzverfahren benennen und die Struktur der Berechnungsformeln kennen

- COCOMO
- Function-Point-Methode
- ToDo

**COCOMO**

"Constructive-Cost-Method"

Lines-of-Code $=l$

Mann-Monate $=MM$

Entwicklungszeit $=t$

Aufwandsanalyse $=t_{AA}$

$t_{SW}=A(B\cdot (\frac{l}{1000})^{1+C})^{D}+t_{Aufwandanalyse}$
mit $A,B > 2, 0 < C,D < 1$
z.B.
$t_{easySW}=2.5(2.4\cdot (\frac{l}{1000})^{1.05})^{0.38}+t_{AA}$
für einfache, mittlere, komplexe SW-Projekte
weitere Präzisierung möglich

**Function-Point-Methode**

- anstatt Codezeilen zu schätzen $\Rightarrow$ Evaluierung von Eingangsgrößen von Funktionen
- somit entsteht ein relatives Maß zur Bewertung von Funktionen $\rightarrow$ `function-points`
- *wenn* Kosten pro Funktion Point bekannt, dann ist eine Kostenschätzung möglich

Vorgehen:

- Zähle logische Transaktionen einer Funktion: Eingabe, Ausgabe, Anfrangen, Schnittstelle extern, Datenbankanfrage intern
- FP_roh ermitteln
  - Werte gewichtet: S, M, L
  - Anzahl Datenelemente je Datenbestand einer Transaktion legt jeweils Wert S, M, L fest
  - für jede logische Transaktion [...] kommen nach Größe variierend FP dazu

$Function Points = FP_{Roh}* Korrekturfaktoren$

- Bis zu 14 Einflussfaktoren als Korrekturfaktoren

- Beispiel Faustregel von Jones:
  - $MM=FP^{0.4}=\sqrt[5]{FP^2}\hat{=}t$
  - $Anzahl_{MA}=\frac{FP}{150}$

#### Schwachstellen des CoCoMo bzw. Function-Point-Methode darlegen

**allgemein**

- Starr, trocken, kein Teamgeist, keine Kommunikation
- Eingangsvariablen **müssen** zutreffend geschätzt werden
- ohne Maßzahlen von alten projekten **keine** zuverlässigen Aussage
  - Sie beziehen sich dadurch immer nur auf gleiche und ähnliche Teams
  - mit gleichen und ähnlichen Projekten.
  - Selbst noch nie sowas gemacht? Damit nicht zuverlässig schätzbar!
- Reaktion auf neue Anforderungen: nicht möglich

**COCOMO**

- Lines of Code ist eine fehlerbehaftete Angabe

**FP-Methode**

- präziser Entwurf nötig, Datenelemente, Transaktionen etc $\Rightarrow$ ändert sich oft während Entwicklung
- Kosten pro Function Point muss bekannt sein

## System-Entwurf

### Entwicklungskonzepte

#### Hauptaufgaben des Systeme-Entwurfs benennen

- ToDo

#### Themen für zu treffende Grundsatzentscheidungen beim System-Entwurf benennen

- ToDo

#### den Ablauf (Gliederung) des Entwurf-Prozesses darstellen

- ToDo

#### den Begriff einer Komponente vom Subsystem unterscheiden

- ToDo

#### Kriterien für einen guten System-Entwurf nennen und am Beispiel nach dessen Erfüllungsgraden suchen und diese quantifizieren

- ToDo

#### Prinzip der Software-Architektur-Sichten erläutern und motivieren

- ToDo

#### Qualitätssicherungs-Prinzipien für einen Architektur-Entwurf benennen und motivieren

- ToDo

#### Metriken für modulare Entwürfe nennen und ein geeignetes Anwendungsgebiet benennen

- ToDo

### Standard-Muster im Architektur-Entwurf

#### Standard-Muster einer Strukturellen-Sicht einer Software-Architektur benennen

- **Komposition von Klassen**
- Proxy (Stellvertreter)
- Adapter (Wrapper)
- Bridge (Implementation und Schnittstelle trennen)
- Composite (Baumstrukturen)

#### Vor- und Nachteile jedes Musters darstellen und anwenden

- ToDo

#### Standard-Muster einer Physikalischen-Sicht einer Software-Architektur benennen

- **Prozess der Erzeugung**
- Factory
- Builder (Erzeuger)
- Singleton

#### Vor- und Nachteile jedes Musters darstellen und anwenden1

- ToDo

#### Standard-Muster einer Ablauf-Sicht einer Software-Architektur benennen

- **Art und Weise wie Klassen kommunizieren und Aufgaben verteilen**
- Command
- Interpreter
- Iterator

#### Vor- und Nachteile jedes Musters darstellen und anwenden2

- ToDo

#### vorgegebene Muster wiedererkennen und verbessern (Schwachstellen benennen)

- ToDo

#### Die Mindest-Architektur auf einen konkreten Fall anwenden

- Drei-Schichten
- ToDo

#### Zweck für das Anlegen einer Sammlung mit Entwurfmustern nennen und begründen (motivieren)

- ToDo

#### Aus den drei großen Entwurfsmuster-Kategorien Vertreter benennen und jeweils eines davon mit einem Beispiel veranschaulichen

- ToDo

#### Den Unterschied zwischen dem Interpreter-Entwurfsmuster und „Interpreter“ als Architekturmuster der strukturellen Sicht benennen

- ToDo

#### begründen, warum Qualitätsverbesserung in der Software-Entwicklung durch Maßnahmen aus den 4 in der Vorlesung genannten Säulen erfolgen kann

- ToDo

#### Diese 4 Säulen benennen und kann eine Maßnahme beispielhaft beschreiben, die gleichzeitig zwei Säulen adressiert

- ToDo

#### Für jede dieser Säulenpaare (1-2, 1-3, 1-4, 2-3, 2-4, 3-4) eine Maßnahme benennen, idealerweise sogar eine Maßnahme, die alle 4 Säulen verbessert

- ToDo

#### Den Unterschied zwischen der Prüfung einer XML-Datei auf Wohlgeformtheit und Validität an inhaltsbasierten XML-Dateien erklären

- ToDo

#### Alle Objekt-Typen aufzählen, die in einer JSON-Datei stehen können

- ToDo

#### Ich kann mich bei einer vorgegebenen Datensammlung entscheiden, welches Dateiformat (XML, JSON, CVS) ich zur Speicherung verwenden würde

und dazu ein Entwurfsmuster für eine Software zur Konvertierung erläutern, wenn ich von externen Stelle solche Daten bekomme
die aber nicht in dem Format vorliegen, für das ich mich entschieden habe.

- ToDo

#### Möglichkeiten der Parallelisierung benennen und dessen Vor- und Nachteile darstellen

- ToDo
