1 DECLARE SUB computing (fehler, eingabe$, position, sysnum, startzahl$, dauer, poswert$, asciiposwert, poswert, sysposwert, ausgang, startzahl)
CALL computing(fehler, eingabe$, position, sysnum, startzahl$, dauer, poswert$, asciiposwert, poswert, sysposwert, ausgang, startzahl)
CLEAR
GOTO 1

SUB computing (fehler, eingabe$, position, sysnum, startzahl$, dauer, poswert$, asciiposwert, poswert, sysposwert, ausgang, startzahl)

5 CLS
COLOR 11
PRINT
PRINT "                                  VeP 2.0 "; CHR$(184)
PRINT
PRINT "                      16 - 18 February 2000 by Viktor Seib"
PRINT
PRINT
PRINT "          Dieses  Programm  decodiert  Zahlen  der Systeme  2 bis 16"
PRINT "          ins  Dezimale System.  Geben  Sie zuerst  die Systemnummer"
PRINT "          der zu decodierenden Zahl und danach die Zahl selbst  ein."
PRINT "          Achten Sie darauf, dass die einzelnen Ziffern nicht gr”áer"
PRINT "          oder gleich  Systemnummer sein drfen und dass  eventuelle"
PRINT "          Buchstaben (Systeme 11 - 16) klein  eingegeben werden. Auf"
PRINT "          Eingabefehler wird nur begrenzt hingewiesen."
PRINT
PRINT
PRINT

LET position = 1
INPUT "     Wie lautet die Systemnummer"; sysnum
IF sysnum > 16 THEN GOTO 5
IF sysnum < 2 THEN GOTO 5
PRINT
INPUT "     Welche Zahl soll decodiert werden"; startzahl$
LET dauer = LEN(startzahl$)

IF dauer = 1 THEN GOTO 30

DO

10 LET poswert$ = MID$(startzahl$, position, 1)
LET asciiposwert = ASC(poswert$)
LET poswert = asciiposwert - 48
IF poswert > 10 THEN
   LET poswert = poswert - 39
END IF
IF poswert = sysnum THEN LET fehler = 1
IF poswert > sysnum THEN LET fehler = 1
LET sysposwert = sysposwert + poswert
IF ausgang = 1 THEN GOTO 20
LET sysposwert = sysposwert * sysnum
IF position = 1 THEN LET sysposwert = poswert * sysnum
LET position = position + 1

LOOP UNTIL position = dauer

LET ausgang = 1
GOTO 10
20 PRINT
PRINT "     Das Ergebnis lautet:"; sysposwert
COLOR 4
PRINT
IF fehler = 1 THEN PRINT "     Es erfolgte ein Eingabefehler" ELSE GOTO 50
GOTO 50

30 IF startzahl$ = "a" THEN LET startzahl = 10
IF startzahl$ = "b" THEN LET startzahl = 11
IF startzahl$ = "c" THEN LET startzahl = 12
IF startzahl$ = "d" THEN LET startzahl = 13
IF startzahl$ = "e" THEN LET startzahl = 14
IF startzahl$ = "f" THEN LET startzahl = 15
IF startzahl > 9 THEN GOTO 40
PRINT
PRINT "     Das Ergebnis lautet:"; startzahl$
GOTO 50

40 PRINT
PRINT "     Das Ergebnis lautet:"; startzahl
GOTO 50

50 COLOR 11
PRINT
INPUT "     Nochmal(n) oder Ende(e)"; eingabe$
IF eingabe$ = "e" THEN END
IF eingabe$ = "n" THEN GOTO 60 ELSE GOTO 50

60 END SUB

