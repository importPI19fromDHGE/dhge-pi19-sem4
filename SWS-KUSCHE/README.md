# Kryptographie und Softwaresicherheit

## Prüfungen

- Klausur wäre bevorzugt
- Alternativ: Referate über freies Thema, was zu SWS passt
- MPP1: Krypto wird sehr gern geprüft

## Einführung und Inhalt

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

## Symmetrische Verfahren

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

## Asymmetrische Verfahren

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

### ...SA vs ...DH

- DH verwendet zusätzlich Zufallszahlen
  - bietet "Forward secrecy"; RSA nicht
- Kenntnis d. priv. asym. Keys sorgt für:
  - aufgezeichnete verschlüsselte Daten nicht entschlüsselbar
  - symm. Keys nicht nachträglich knackbar
  - alte Sessions nicht nachträglich knackbar
- Kennntnis d. sym. Keys einer Session heißt nicht, dass andere Sessions geknackt werden können
- DH heißt, es wird innerhalb einer asym. Verschlüsselung eine sym. Verschlüsselung verwendet, der mit jeder neuen Session neu generiert wird
