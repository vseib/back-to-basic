DECLARE SUB Intro ()
DECLARE SUB Konstanten ()
DECLARE SUB Eingabe ()
DECLARE SUB Rechnung ()
DECLARE SUB Endbericht ()

COMMON SHARED t, x, y, g, i, i2, v0, a, vx, vy, xpos, ypos

Intro
Konstanten
Eingabe
Rechnung
Endbericht

SUB Eingabe

CLS
PRINT
PRINT
INPUT "Anfangsgeschwindigkeit (m/s) = ", v0
INPUT "                  Wurfwinkel = ", a
a = (3.141592654# / 180) * a             '  "a" ist der winkel alpha

END SUB

SUB Endbericht

PRINT
PRINT
PRINT "             Wurfweite = "; (CINT(xpos * 10)) / 10; "m"
PRINT "             Wurfdauer = "; (CINT(t * 100)) / 100; "s"
xmax = v0 * (t / 2) * COS(a)
ymax = v0 * (t / 2) * SIN(a) - (g / 2 * (t / 2) ^ 2)
PRINT "        hîchster Punkt = "; (CINT(ymax * 100)) / 100; "m"

DO
LOOP WHILE INKEY$ = ""

END SUB

SUB Intro

CLS
SCREEN 12
COLOR 11

PRINT
PRINT "                                  Wurfbahn.bas"
PRINT
PRINT "                    21. Oktober / 16. Dezember 2001 by Viktor Seib"
PRINT
PRINT "                   Dieses Programm berechnet und zeichnet Wurfbahnen"
PRINT
PRINT
PRINT
PRINT
PRINT
PRINT
PRINT
PRINT
PRINT
PRINT
PRINT
PRINT
PRINT
PRINT "Zum Fortfahren beliebige Taste drÅcken."
DO
LOOP WHILE INKEY$ = ""
t = 0
CLS
END SUB

SUB Konstanten

'konstante Startwerte
t = 0
x = 50
y = 400
g = 9.81
i2 = 0    'delay beim Zeichnen

END SUB

SUB Rechnung

'diese Sub berechnet die Position des geworfenen Objekts in AbstÑnden von t = 0.01 s

DO
xpos = v0 * t * COS(a)
ypos = v0 * t * SIN(a) - (g / 2 * t ^ 2)
t = t + .01

FOR i = 1 TO i2      'Schleife um das Zeichnen zu verzîgern
NEXT i

PSET (x + xpos * 5, y - ypos * 5)    'Zeichnet die Bahnpunkte ein

LOOP UNTIL ypos < 0

END SUB

