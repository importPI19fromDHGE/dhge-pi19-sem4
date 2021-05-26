# RAID-Vortrag

<!-- markdownlint-disable-file -->

von Max und Benedict

## HW-Raid vs. SW-Raid

- Frage: RAID erzeugt zusätzlichen Rechenaufwand - warum?
  - komplexes RAID erfordert Paritäts-Kalkulationen (s. Kapitel Raid-Algorithmen)
  - Daten müssen ggf. mehrfach geschrieben werden
- können von CPU oder hardwarebeschleunigt berechnet werden

### SW-RAID

Software-RAID ist eine rein software-seitig umgesetzte RAID-Lösung.

Es gibt RAID-Implementierungen, die nicht als Hardware-RAID umgesetzt werden können, z.B. die von ZFS (vgl. \[bou06\])

Vorteile:

- keine Zusatzkosten für RAID-Karte oder HBA (Host Bus Adapter) (vgl. \[ada06\])
- auf moderner Hardware mit wenigen Datenträgern kaum Performance-Verlust, v.a. auf CISC-Prozessoren, da diese ggf. Rechenwerke für RAID typische Aufgaben haben
- sind zwischen kompatiblen Lösungen migrierbar, z.B. unter Linux: dort wird immer ``mdadm`` eingesetzt; ZFS immer migrierbar, wenn Software den Standard unterstützt
- kein hardwareseitiger Vendor-Lock-in

Nachteile:

- Array zur Boot-Zeit ungeschützt (vgl. \[ada06\])
  - Datenverlust oder -korruption wird zur Boot-Zeit nicht abgefangen \$rightarrow\$
- zusätzliche Last auf CPU, steigt mit Anzahl Disks und komplexeren RAID-Levels wie 5 oder 6 (vgl. \[ada06\])
- möglicherweise nicht auf andere Betriebssysteme migrierbar, wenn spez. Implementierung nicht unterstützt wird (vgl. \[ada06\]),
  - wobei sich diese Situation verglichen mit der Vergangenheit deutlich verbessert hat (z.B. Linux hat einheitliche Software-RAID-Lösung ``mdadm``)
- RAID-Software kann durch Malware übernommen oder beschädigt werden (vgl. \[ada06\])
- Abstürze gefährden Integrität (vgl. \[ada06\]); ZFS kann aber durchaus einen Power-loss überleben (Erfahrung von Max)
- kein Hardware-Cache, d.h. bei komplexeren RAID-Levels wie 5 und 6 tritt eine *write penalty* auf: urspr. Parität muss korrekt sein
  - also: read - modify - write; dazu keine Sicherheit einer Backup-Batterie (vgl. \[ada06\], \[tho15a\])
- kein Booten von RAID-Array, da für das BIOS nicht lesbar

## Hybrid-RAID

Hybrid-RAID ist ein hardware-beschleunitgtes Software-RAID. Typischerweise in Form eines HBAs oder Mainboards mit RAID-BIOS.
Es hat den Zweck, einige Nachteile von Software-RAID zu lindern oder beheben. (vgl. \[ada06\])

Vorteile:

- Schutz des Arrays zur Boot-Zeit (vgl. \[ada06\])
- Wartungsmöglichkeiten des Arrays im BIOS, v.a. hilfreich bei Boot von Array (vgl. \[ada06\])
- bessere OS-Unabhängigkeit durch Treiberunterstützung, die als Abstraktionsschicht dient (vgl. \[ada06\])
- manche Implementierungen enthalten einen XOR-Beschleuniger, was für bspw. RAID 5 oder 6 hilft (vgl. \[ada06\])

Nachteile:

- moderate Zusatzkosten durch HBA oder MB mit RAID-Suport (vgl. \[ada06\])
- Verwundbarkeit von Malware von Software-RAID geerbt (vgl. \[ada06\])
- keine Treiber für sehr neue OS-Releases oder exotischere Betriebssysteme verfügbar (vgl. \[ada06\]) Bsp.: TempleOS, ReactOS
- kein Hardware-Cache, d.h. bei komplexeren RAID-Levels wie 5 und 6 tritt eine *write penalty* auf: urspr. Parität muss korrekt sein
  - also: read - modify - write; dazu keine Sicherheit einer Backup-Batterie (siehe. oben)

### HW-RAID

Hardware-RAID ist mit eigenem Prozessor und RAM vollständig in Hardware gelöst und volltändig unabhängig vom Host (vgl. \[ada06\]). Es kommt oft als Add-in Karte (z.B. PCIe).

Kommt in folgenden Formen (vgl. \[ada06\]):

- RAID-Kontroller-Karte
  - I/O über PCIe oder PCI-X
  - Interfaces auf Addin-Karte
- RAID-on-Chip (RoC)
  - alle Komponenten (Prozessor, RAM,...) auf einem Chip auf MB
  - Interfaces auf MB

Vorteile:

- kein nennenswerter Overhead für CPU (vgl. \[ada06\])
- durch RAID-Prozessor skalierbarer, da mehr Rechenleistung exklusiv für RAID zur Verfügung steht (vgl. \[ada06\])
- einfachere Datenrettung (Anm. v. Max: Aussage kann nicht verifiziert werden; Quelle ist die Adaptec Inc., die auch RAID-Karten fertigt - mglw. *biased*) (vgl. \[ada06\])
- OS-unabhängig - dieses sieht nur die logische Disk (vgl. \[ada06\]) (und mglw. durch Treiber bereitgestellte Zusatzfeatures)
- Backup-Batterie kann für sicheren Schreibcache sorgen - Performance-Steigerung (vgl. \[ada06\])

Nachteile:

- gebunden an Hersteller, ggf. auch gleiche Firmware-Versionen erforderlich
- hohe zusätzliche Kosten (siehe Bild unten)
- bei Spontanversagen der RAID-Hardware Datenrettung erforderlich
- in Form eines RoC an MB gebunden

![hohe Kosten für Hardware-RAID](img/Screenshot%202021-03-28_raidkarte_jacob.jpg)

Bildquelle: [Jacob Elektronik](https://direkt.jacob.de/produkte/LSI-MEGARAID-SAS-LSI00417-artnr-1917966.html) Abruf: 28.03.2021 12:30

### Fazit

- HW-Raid eignet sich für viele Festplatten, um den Overhead auszulagern
- Software-RAID eignet sich für kleinere Arrays (4-6), v.a. als (Home-)Lab bzw. Low-Cost Lösung und temporäre Setups
- für RAID0 / RAID 1 ist Software-RAID geeignet
- SW-RAID wenn möglich als Hybrid-RAID
- ZFS bietet optimierte SW-RAID-Implementierung, auch für sehr große Arrays optimiert

## RAID-Fehlererkennung

Quelle: \[tld21\]

- Linux-Kernel beobachtet SMART-Werte
- Lesefehler werden protokolliert
- bei Fehlern wird RAID-Software oder -Treiber informiert

Fehlertypen nach \[tho15b\]:

- RAID degraded: ein oder mehrere Datenträgerdefekte liegen vor, aber das RAID kann noch ohne Datenverlust arbeiten.
  - mit intakten Platten Backup machen
  - defekte Platten ersetzen und ggf. Rebuild starten bzw. neues RAID und Backup einspielen
- RAID offline: ein oder mehrere Datenträgerdefekte liegen vor und das Array ist nicht mehr lesbar.
  - Datenrettung beauftragen oder neues RAID mit intakten Platten machen

## RAID-Rebuild

- wird durchgeführt, um degraded Array wieder online zu bringen
- Annahme: Daten auf den verbleibenden Platten korrekt
  - Konsistenzprüfung, ggf. Korrektur bei intakten Platten mit Resync-Prozedur
- Ablauf:
  - defekte Platte(n) durch intakte ersetzen
  - Rebuild starten
  - verbleibende Platten werden Sektorweise gelesen
  - zu schreibende Daten werden sektorweise für neue Platte berechnet und geschrieben
- RAID 0: kein Rebuild möglich
- RAID 1: gespiegelte Daten werden kopiert, keine Möglichkeit zur Integritätsprüfung
- Raid 5/6: verlorengegangene Paritäten + verlorengegangene Daten werden berechnet

### Risiko

- Platten einer Charge haben eine ähnliche Lebenserwartung - Risiko eines weiteren Ausfalls erhöht
- hohe Last der intakten Platten während eines Rebuilds
- RAID-1 schützt nicht vor korrupten Daten (z.B. Bit-Rot, Myonen)
- während des Rebuilds fällt eine weitere Platte aus
- falscher Datenträger getauscht
- Firmware-Update löscht Konfiguration
- "Festplattenroulette" (\[tho15b\]): wahlloses Tauschen von Datenträgern

### Demo

vgl. \[ell16\], \[baj19\]

Vorbereitung:

- RAID init: ``sudo mdadm --create --verbose /dev/md0 --level=1 --raid-devices=2 /dev/sdb /dev/sdc``
- Status auslesen: ``cat /proc/mdstat``
- Formatieren: ``sudo mkfs.ext4 -F /dev/md0``

Live:

- ``sudo mount /dev/md0 /mnt/``
- VHDX failen: ``mdadm /dev/md0 -f /dev/sdc``
- Array-Status auslesen: ``mdadm -–query -–detail /dev/md0``
- failed VHDX removen: ``mdadm -–manage /dev/md0 -–remove /dev/sdc``
- Spare hinzufügen: ``mdadm -–manage /dev/md0 -–add /dev/sdd``

## Quellen

(Max)

\[ada06\] Adaptec, Inc.: Hardware RAID vs. Software RAID: Which Implementation is Best for my Application?, 2021.
[https://www.adaptec.com/nr/rdonlyres/14b2fd84-f7a0-4ac5-a07a-214123ea3dd6/0/4423_sw_hwraid_10.pdf](https://www.adaptec.com/nr/rdonlyres/14b2fd84-f7a0-4ac5-a07a-214123ea3dd6/0/4423_sw_hwraid_10.pdf)
Abruf: 27.03.2021

\[tho15a\] Thomas-Krenn: RAID, 2015. [https://www.thomas-krenn.com/de/wiki/RAID](https://www.thomas-krenn.com/de/wiki/RAID) Abruf: 27.03.2021

\[tho15b\] Thomas-Krenn: RAID Datenrettung, 2015. [https://www.thomas-krenn.com/de/wiki/RAID_Datenrettung](https://www.thomas-krenn.com/de/wiki/RAID_Datenrettung) Abruf: 28.03.2021

\[tho18\] Thomas-Krenn: Mdadm recovery und resync, 2018. [https://www.thomas-krenn.com/de/wiki/Mdadm_recovery_und_resync](https://www.thomas-krenn.com/de/wiki/Mdadm_recovery_und_resync) Abruf: 29.03.2021

\[tld21\] The Linux Documentation Project: RAID-HOWTO, 2021. [https://tldp.org/HOWTO/Software-RAID-HOWTO-6.html#ss6.1](https://tldp.org/HOWTO/Software-RAID-HOWTO-6.html#ss6.1) Abruf: 28.03.2021

\[bou06\] Bourbonnais, Roch: WHEN TO (AND NOT TO) USE RAID-Z, 2006. [https://blogs.oracle.com/roch/when-to-and-not-to-use-raid-z](https://blogs.oracle.com/roch/when-to-and-not-to-use-raid-z) Abruf: 28.03.2021

\[ell16\] Ellingwood, Justin: How To Create RAID Arrays with mdadm on Ubuntu 16.04, 2016.
[https://www.digitalocean.com/community/tutorials/how-to-create-raid-arrays-with-mdadm-on-ubuntu-16-04](https://www.digitalocean.com/community/tutorials/how-to-create-raid-arrays-with-mdadm-on-ubuntu-16-04)
Abruf: 30.03.2021

\[baj19\] Bajrami, Valentin: Replacing a failed RAID 6 drive with mdadm, 2019. [https://www.redhat.com/sysadmin/raid-drive-mdadm](https://www.redhat.com/sysadmin/raid-drive-mdadm) Abruf: 30.03.2021
