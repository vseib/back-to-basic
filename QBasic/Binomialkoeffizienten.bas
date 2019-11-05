1 'Prog: Binomialkoeffizienten, by Viktor Seib, 14. Juni / 11. November 2001
DEFINT A-Z
DECLARE SUB Intro ()
DECLARE SUB Fakultaet ()
DECLARE SUB SimpleFakultaet ()
DECLARE SUB StartAgain ()

COMMON SHARED wahl, again$

CLS : CLEAR : CLOSE    'L”scht den Bildschirm, setzt alle Variablen
                       'auf Null und schlieát alle ge”ffneten Dateien

Intro
IF wahl = 1 THEN Fakultaet
IF wahl = 2 THEN SimpleFakultaet
IF wahl = 3 THEN END

StartAgain
IF again$ = "j" THEN GOTO 1 ELSE END

DEFDBL A-Z
        'diese Sub sollte korrekterweise Koeffizienten heiáen
        'diese Sub berechnet die Anzahl der m”glichen Kombinazionen aus n,
        'die aus k Gliedern bestehen (Zum Beispiel 6 aus 49: n=49, k=6)
        'die allgemeine Formel fr die Berechnung lautet: n! / ((n-k)! * k!))
SUB Fakultaet
              
wahl = 0

PRINT
5 INPUT "        Geben Sie die Zahlen ein (z.B. '3,10' fr 3 aus 10): ", k, n         'Benutzereingabe von zu berechnenden Koeffizienten

IF k > n THEN GOTO 5
IF n = 0 THEN GOTO 5
IF n < 0 OR k < 0 THEN GOTO 5
IF k = 0 THEN GOTO 10
IF n = 1 THEN GOTO 10
IF n = k THEN GOTO 10
IF k = 1 THEN GOTO 20
NminusK = n - k
IF NminusK = 1 THEN GOTO 20

ergebnis1 = n
ergebnis2 = NminusK
ergebnis3 = k



DO                                     'Diese Schleife berechnet
n = n - 1                              'die Fakult„t von n
ergebnis1 = ergebnis1 * n
LOOP UNTIL n = 1

DO                                      '... berechnet Fakult„t von NminusK
NminusK = NminusK - 1
ergebnis2 = ergebnis2 * NminusK
LOOP UNTIL NminusK = 1
               
DO                                      '... berechnet Fakult„t von k
k = k - 1
ergebnis3 = ergebnis3 * k
LOOP UNTIL k = 1

endergebnis = ergebnis1 / (ergebnis2 * ergebnis3)

COLOR 9
PRINT
PRINT "        Es gibt "; FIX(endergebnis); "verschiedene Kombinationen."
EXIT SUB

10 COLOR 9
PRINT
PRINT "        Es gibt 1 Kombination."
EXIT SUB

20 COLOR 9
PRINT
PRINT "        Es gibt "; n; "verschiedene Kombinationen."
END SUB

DEFINT A-Z
SUB Intro

111 CLS
COLOR 11
PRINT
PRINT "                              Binomialkoeffizienten"
PRINT
PRINT "                    14. Juni / 11. November 2001 by Viktor Seib"
PRINT
PRINT "        (1) Anzahl der m”glichen Kombinationen berechnen (ohne Wiederholung)"
PRINT "            zum Beispiel: 3 aus 10 (1-2-3 und 1-3-2 w„re eine Wiederholung)"
PRINT
PRINT "        (2) berechnet die Fakult„t einer natrlichen Zahl x (1 < x < 171)"
PRINT
PRINT "        Bitte w„hlen Sie eine Option:"
PRINT
PRINT "                     1. Kombinationen berechnen"
PRINT "                     2. Fakult„t berechnen"
COLOR 9
PRINT "                     3. Programm beenden"
COLOR 11
PRINT
INPUT "        Ihre Wahl: ", wahl

IF wahl > 3 OR wahl < 1 THEN GOTO 111
END SUB

DEFDBL A-Z
SUB SimpleFakultaet

wahl = 0

PRINT
123 INPUT "        Bitte geben Sie die Zahl ein: ", n            'Eingabe der Zahl, derer Fakult„t berechnet wird
IF n < 2 OR n > 170 THEN GOTO 123
ergebnis1 = n
nnn = n

DO                                     'Diese Schleife berechnet
n = n - 1                              'die Fakult„t von n
ergebnis1 = ergebnis1 * n
LOOP UNTIL n = 1

COLOR 9
PRINT
PRINT "        Die Fakult„t von "; nnn; " betr„gt:"; ergebnis1;
PRINT

END SUB

DEFSTR A-Z
SUB StartAgain

COLOR 11
PRINT
INPUT "        Nochmal (j/n)"; again$

END SUB

