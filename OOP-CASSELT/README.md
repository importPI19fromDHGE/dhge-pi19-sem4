# WPM1 Objektorientierte Programmierung mit Java

## Einleitung

- Bauen eines JARs von einer Klassensammlung: ``jar cmf Manifest.txt name.jar *.class``
  - mit Programm ``jar``
  - Benötigt wird Manifest.txt, welche Version und Hauptklasse enthält

### Java-Sprachelemente

- einzeilige Kommentare am Zeilenende mit ``//``
- Blockkommentar: Start mit ``/*``, Ende mit ``*/``
- Bezeichner **müssen** mit `_`, `$`, oder einem Unicode-Buchstaben beginnen, aber nicht mit einer Ziffer, einem reservierten Wort oder ungültigen Zeichen (???) wie dem `!`
- Bezeihner sind case-sensitiv
- Namenskonventionen:
  - Klassennamen mit großem CamelCase: ``KlassenName``
  - Variablen- und Methoden-Namen mit kleinem camelCase: ``compSumme()``
  - Konstanten in Capslock SNAKE_CASE: ``MAX_SPEED``
- primitive Datentypen sind initialisiert
- Referenzvariablen sind ggf. ``null``
- Literale: Ganzzahlen, Fließkommazahlen, Zeichen, null, Strings, Konstanten

### Methoden

Deklaration:

```java
returntyp methodenName(parameterliste) {
    // Methodenkörper
    return something;
}
```

### Strings

- Gleichheit von Strings: Wir betrachten folgenden Code:

``String s1 = "abc", s2 = "abc", s3 = new String("abc");``

  - Java speichert Stringliterale in einem Pool, weshalb ``s1`` und ``s2`` auf dieselbe Adresse verweisen
  - ``s1 == s2`` ergibt ``true``, aber ``s1 == s3`` ``false``
  - **Daher immer ``s1.equals()`` verwenden!**

## Basiskonzepte der OOP & Java

- 4 Grundkonzepte:
  - Abstraktion: Gemeinsame Eigenschaften und Fähigkeit werden zusammengefasst beschrieben
  - Datenkapselung: Zustandsänderungen nur über dafür vorgesehene Operationen (Methoden)
  - Vererbung: Erweiterung vorhandener Objekte mit zusätzlichen Eigenschaften + Operationen bei bleibender Kompatibilität zum Urpsrungstyp
  - Polymorphie: Laufzeitprüfung, wie auf vererbte Objekte reagiert wird
- Klassen und Objekte $\rightarrow$ setze ich mal voraus
- Unterschied Operationen und Methoden:
  - Operation: was wird gemacht?
  - Methode: wie wird gemacht?
- in Java werden keine Prototypen gebraucht

### Packages

- Verwalten Klassen und Zugriffsrechte
- erste Anweisung **muss** ``package paketname;`` sein
- ohne Zugriffsmodifier an Klasse: nur für eigenes Package sichtbar
- Modifier ``public`` an Klasse: Klasse für alle Packages sichtbar
