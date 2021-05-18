Praktikum hardwarenahe Programmierung
=====================================

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!--newpage-->

# AVR ATmega 8515L

- 40 Pins, 4 Ports, 2 Pins f. externen Takt
- 8 Bit RISC Microcontroller
- 8 kB Flash <!--Whoa-->
- 512 Byte EEPROM
- 512 Byte SRAM
- bis zu 64kB externen SRAM
- 8Bit + 16Bit Zähler
- 0 bis 8 MHz
- interne und externe Interrupts
- interner Watchdog (mit Brownout Detection)
- CPU entspricht Havard-Architektur und unterstützt Single Level Pipelining
- RAM: Adresse ``0x60``
- Stack: wächst von unten nach oben; Pointer muss initialisiert werden

## besondere Register

- Statusregister: Informationen zu Ergeignissen von arithmetischen und logischen Operationen, wie z.B. Zero-Flag
  - Besonderheit `I`-Flag: muss manuell auf 1 gesetzt werden, wenn Interrupts behandelt werden sollen
