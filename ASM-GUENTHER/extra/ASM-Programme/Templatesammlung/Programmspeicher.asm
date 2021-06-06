; Für Anwendung siehe Beispiel
; Hier nur der konkrete Codeschnipsel für den Programmspeicher, zum Verständnis, nicht lauffähig!

main:

  lpm  registera, z+ ;Der LPM-Befehl liest Inhalte aus dem Flash-Speicher in ein Register ein. Load from Program Memory
  ; z+ erhöht den Zeiger auf den Speicher nach Aufruf um 1

/* Some logic z.b. 

  cpi ton, 0 
  breq endMain ; wenn der eingelesene Wert eine 0 und damit das Ende der Daten ist, springe zu endMain
  lpm registerbz+ ; lies den wert auf den z zeit, inkrementiere danach Z
  out PORTB,registera
  rjmp main
*/

endMain: 
  ;something
rjmp main

data:
.db 118,60,95,20,79,40,59,40,71,40,59,20,71,20,79,80,89,60,79,20,95,40,118,40,105,80,118,40,0

