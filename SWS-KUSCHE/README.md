Kryptographie und Softwaresicherheit
====================================

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!--newpage-->

# Prüfungen

- Klausur wäre bevorzugt
- Alternativ: Referate über freies Thema, was zu SWS passt
- MPP1: Krypto wird sehr gern geprüft

# Einführung und Inhalt

- Kryptographie = Lehre der Verschlüsselung
- dieses Modul umfasst weiterhin:
  - Verschlüsselungsverfahren
  - (kryptografische) Hashes
  - Signaturen + Zertifikate
  - Anwendung: PGP, De-Mail
  - Anwendung: Blockchain z.B. Bitcoin
  - Kryptographische Zufallszahlen
  - Passwörter
  - Steganographie
  - Anwendung: Disk Encryption
  - Anwendung: TPM
  - Typische Sicherheitslücken, sichere Programmierung
- Vorlesungsziel: Verständnis und Sensibilisierung
  - nicht Ziel: Exakte Detail-Kenntnisse von Algorithmen, Praktische Programmierung, Mathematik, Netzwerkverschlüsselung, IT-Sicherheit - sprengen den Rahmen
- Ziele / Anwendung krypt. Verfahren
  - Geheimhaltung, Vertraulichkeit, Zugriffsschutz: Verschlüsselungsverfahren
  - Integrität: Datensicherheit, krypt. Hash-Funktionen
  - Authentizität: Nichtabstreitbarkeit, Sicherstellung Senders: Signaturen und Zertifikate
  - Authentifizierung und Passwörter
- Krypto-Algorithmen nie selbst einprogrammieren
- lieber auf für gut befundene Implementierungen nutzen, bevorzugt Open-Source

# Symmetrische Verfahren

- **selber Schlüssel zum Ver- und Ent-schlüsseln**
- manchmal auch denselben Algorithmus
- arbeiten blockweise, typischerweise zwischen 64 Bit und 512 Bit
- typische Schlüssellänge: 128-256 Bit (Hinweis: 64 Bit sind zu wenig!)
- basieren auf einfachen Bit-Operationen: XOR, Shifts, Rotation, Plus/Minus, Permutationen
  - nur Shift + XOR reicht nicht
  - meist keine Multiplikationen usw., da zu langsam
- relativ einfache Algorithmen, oft in mehreren "Runden" wiederholt
- in HW implementierbar: "Krypto-Beschleuniger"
- Vektor-Einheiten, d.h. SSE/AVX kann verwendet werden
- müssen schnell sein (100MB/s)
- Beispiele:
  - DES (56 Bits, unsicher)
  - Triple-DES
  - IDEA (unfrei)
  - AES / Rijndael (schlechteste Sicherheit, beste Performance v.a. in HW)
  - (Blowfish), Twofish, Serpent (sind weitere, sichere Verfahren)
  - CAST, MARS, CR6
- Problem: Sender und Empfänger braucht denselben Schlüssel
  - Schlüsseltausch - wie wird der Schlüssel sicher übertragen (z.B. über Internet), ohne dass Dritter abfangen kann

# Asymmetrische Verfahren

- Verwendung eines Schlüssel-Paars
  - "öffentlicher" Schlüssel zum Verschlüsseln
  - "privater" Schlüssel zum Entschlüsseln
- Daher auch: Pubic-Key-Verfahren
- Private Key und Public Key können auch Rollen tauschen, z.B. beim Signieren
- Empfänger berechnet einmalig persönliches Schlüsselpaar, veröffentlicht öff. Schlüssel und verwahrt priv. Schlüssel sicher
- arbeiten ebenfalls blockweise, aber größeren Block- und Schlüssel-Längen: 2048 bis 4096, darunter evtl. zu wenig
- Arbeiten intern mit 2048-Bit-Ints, also etwa 600 Dezimalstellen, Multiplikation, Restrechnung,...
- aufwändiger, langsamer
- schlecht durch Hardware- oder Vektor-Befehle zu beschleunigen
- unterschiedliche Algorithmen zum Ver- + Ent-schlüsseln
- basieren auf Problemen der diskreten Mathematik
  - in einer Richtung schnell (Schlüsselgenerierung)
  - in anderer Richtung extrem aufwändig (berechnen d. priv. Schlüssels mit öff.)
  - **"Einweg-Funktionen"**
- Bsp. 1: Faktorisierung großer Zahlen
  - für zwei große Primzahlen p und q
  - ``n = p * q`` leicht zu berechnen
  - Berechnung von p und q aus n praktisch unmöglich
- Bsp. 2: Diskreter Logarithmus
  - a^x kongruent m mod p <!--TODO: MathJax-->
  - für a,x,m,p ganzzahlig
  - leicht für m gesucht, a,x,p gegeben
  - sehr schwer für a,m,p gegeben und kleinstes lösendes x gesucht
  - Anwendung: **Diffie-Hellman, DSH, Elgamal**
- ähnliche Idee: ECC = **elliptische Kurven**
- im Wesentlichen auch diskreter Logarithmus, aber nicht mit ganzen Zahlen, sondern Punkten auf Kurven
  - Rechenschritte schwieriger, schlechter auf HW optimierbar, aber kürzere Schlüssel ausreichend
  - Bsp.: ECDSA für Signaturen, ECDH für Schlüsseltausch; Curve25519 gilt als bestes Verfahren

## ...SA vs ...DH

- DH verwendet zusätzlich Zufallszahlen
  - bietet "Forward secrecy"; RSA nicht
- Kenntnis d. priv. asym. Keys sorgt für:
  - aufgezeichnete verschlüsselte Daten nicht entschlüsselbar
  - symm. Keys nicht nachträglich knackbar
  - alte Sessions nicht nachträglich knackbar
- Kennntnis d. sym. Keys einer Session heißt nicht, dass andere Sessions geknackt werden können
- DH heißt, es wird innerhalb einer asym. Verschlüsselung eine sym. Verschlüsselung verwendet, der mit jeder neuen Session neu generiert wird

# Hybride Verfahren

- Prxis: Kombination beider Verfahren, z.B. SSL / TLS, IPsec, PGP,...
- zuerst asym. Verfahren zum Schlüsseltausch, damit symmetrisch verschlüsselt

# Krypto-Analyse

- Ziel: Angriff auf Kryptographie
  - Klartext herausfinden, Schlüssel herausfinden
- **Ein Verschlüsselungsverfahren ist gebrochen, wenn das mit deutlich weniger Aufwand als *Brute Force* gelingt**

# Anforderungen

- kein statistischer / struktureller Zusammenhang zw. Klartext und Chiffrat: **"pseudo-zufälliger Output"**
- keine erkennbare Zusammenhänge *bestimmte Bits im Input / Schlüssel* <==> *Bestimmte Bits im Output*
- keine Beschreibung durh ein algebraisches Gleichungssystem
  - verhindert u.a. statistische Analysen (z.B. Zeichenhäufigkeit)
- Beständigkeit gegen **"Known Plaintext"-Attacken**:
  - Klartext und Chiffrat bekannt (zumindest in Teilen)
  - Schlüsselgesucht
  - Extremfall: Krypto-Box in Händen des Angreifers
- Sonderfall **Differenzielle Analyse**
  - kleine Änderung im Original - Rückschluss auf Schlüsselteile aus resultierenden Änderungen im Chiffrat?
  - Anforderung **Lawinen-Effekt = Diffusion**:
    - kleine Änderungen im Klartext bewirken große Änderungen im Chiffrat; sollte immer 50% sein
- Beständigkeit gegen **Seitenkanal-Attacken**
  - Timing- und Stromverbrauchs-Analyse
  - Rückschlüsse aus Sprung- und Cache-Verhalten
  - Analyse der Funk-Abstrahlung
  - **Der Algorithmus muss für Beobachter von außen für alle Inputs + Schlüssel *gleich* rechnen**

## Anforderungen an Zukunft

- "Quantencomputer-feste" Algorithmen
  - bei AES wird effektive Schlüssellänge halbiert
  - faktorisieren / logarithmieren in polynomialer Zeit

# Verschlüsselung langer Daten

- Problemstellung: wie bisherige Verfahren für lange Datenströme nutzen? (Blockchiffre zu Stromchiffre)

## EDB (Electronic Code Book Mode)

- Datenstrom in Blöcke teilen
- Jeden Block separat verschlüsseln
- Nachteile
  - Gleicher Block = gleiches Chiffrat
  - Block-Reihenfolge evtl. unbemerkt verfälschbar
- Vorteil: Wiederaufsetzen nach Fehlern / Verlusten (wenn nur ein Block kaputt)

## CBC (Cipher Block Chaining Mode)

- bei jedem Block vor Verschlüsselung wird XOR mit vorigem Chiffrat durchgeführt
- Beim ersten Block XOR mit Initialisierungsvektor, z.B. Zufalllszahl
- Problem mit gleichen Blöcken behoben
- Vertauschung d. Reihenfolge fällt auf
- bei Fehler gehen 2 Blöcke verloren

## CFB (Cipher Feedback Mode)

- Verkettung ähnlich CBC
- XOR mit Plaintext nach Verschlüsselung des vorigen Chiffrats
- selten verwendet

## CTR (Counter Mode)

- arbeitet Pro Block, ohne Verkettung
- Verschlüsselung: Zufallszahl + fortlfd. Zähler
  - erzeugt jedes mal einen anderen pseudo-zufälligen Bitstrom
- Klartext wird danach dazu verschlüsselt: XOR mit diesem Bitstrom
- Verschlüsselung + Entschlüsselung ident
- parallelisierbar
- vorausrechenbar (Verschlüsselungs-Berechnung hängt nicht vom Klartext ab)
- Echte Stromchiffre - kann Byte für Byte abeiten
- Bei Bitfehlern nur genau entsprechende Bits betroffen
  - d.h. verfälschbar

## OFB (Output Feedback Mode)

- s.o., aber statt Zähler wird Output verwendet

## GCM (Galois/Counter Mode)

- wie CTR, aber mit zusätzlicher Auth-Tag-Berechnung
- gilt als derzeit bestes Verfahren
- in vielen Standards verwendet
- Auth-Tag = Prüfsumme
  - fälschungssicher
- "GMAC": Nur Auth-Tag-Berechnung, unverschlüsselt

# Hashes & Signatur

- bei Dateien, Mails: nur Unverfälschtheit
- Hash + Signatur + Zertifikats-Infrastruktur: Unverfälschtheit, Authentizität, Vertrauenswürdigkeit, Nicht-Abstreitbarkeit
- Hash = Prüfsumme, Fingerabdruck
- oft fixe Länge und kürzer als Nachricht
  - daher bijektive Funktion
- Informationsverlust: Original-Nachricht nicht aus Hash herstellbar
- verschiedene Original-Nachrichten können gleichen Hash haben
- Anforderungen an kryptograph. Hashfkt.:
  - kollisionsresistent
  - Lawineneffekt: kleine Änderung in Original, große Änderung im Hash
  - Einweg-Funktion: darf nie *rückrechenbar* sein
- Hash gilt als gebrochen, wenn schneller als Brute-Force lösbar

## Kollisionen Fall 1

- gegeben, fix:
  - nur Hashwert
  - oder Nachricht A und deren Hashwert
- gesucht: andere Nachricht B, die denselben Hash ergibt
- B wird so konstruiert, dass
  - zu großen Teilen ident zu A
  - einer kleinen, gezielten Veränderung zu A
  - beliebig dazukonstruierte, möglichst unauffällige Veränderung zur "Korrektur" des Hashes

## Kollision Fall 2

- gegeben: gewünschte Nachrichten-Schnipsel (z.B. Anfang)
- gesucht: 2 verschiedene Nachrichten, die den Schnipsel enthalten und denselben, aber nicht vorgegebenen Hash enthalten
- Verschicke B, aber behaupte, A wäre echte Nachricht
- meist leichter als Fall 1

## Hash-Verfahren

- MD4 / MD5: "Message Digest"; seit >10y geknackt
- SHA, SHA1: "Secure Hash Algorithm"; seit 2005 theoretisch geknackt
- SHA-2 = SHA-256, SHA-384, SHA-512: längere SHA-Varianten, noch sicher
- SHA-3

## Anwendung

- Unverfälschtheit garantieren
- Speicherung Passwörter
- lange, hochwertige Zufallszahlen
- OTP (One Time Passwords)
- Challenge-Response-Verfahren
- Blockchain

- wenn Hash-Funktion geknackt, werden Krypto-Zertifikate wertlos

## Signaturen

- Sender / Ersteller berechnet Hashwert, verschlüsselt Hash mit Private Key, verschickt Originaldaten plus Signatur (**enthält** verschlüsselter Hash)
- Empfänger entschlüsselt Signatur mit Public Key, berechnet Hash der Originaldaten + vergleicht
- jeder kann also Signatur prüfen

### Voraussetzungen

Das System ist nur vertrauenswürdig, solange:

- kein unbefugter Zugang zum Private Key
- Zusammenhang zwischen Schlüsselpaar und Identität der Person

Lösungsansätze:

zu 1.:

- **Qualifizierte elektronische Signatur**: privater Key auf Chipkarte gespeichert, verlässt Karte nie
- aktive Karte, kann rechnen, Signatur auf Karte berechnet
- CA darf keine Kopie des Private Key haben
