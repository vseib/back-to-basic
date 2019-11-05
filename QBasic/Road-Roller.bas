        DECLARE SUB Intro (platzhalter)
        DECLARE SUB Credits (iii, i2)
        CALL Intro(platzhalter)
        IF platzhalter = 23 THEN time = 29

'Zuordnungen (fest)
        LET start1 = 100
        LET start2 = 100
        LET start3 = 100
        LET x = 318
        LET y = 300
1       DO
        CLS

'Zuordnungen (variabel)
        LET a = x - 13
        LET b = y - 10
        LET c = x + 13
        LET d = y - 10
       
'Berechnungen fÅr Zeile 1, Loch 1, 2 & 3
        RANDOMIZE TIMER
        z1l1 = INT(RND * 6)
10      RANDOMIZE TIMER
        z1l2 = INT(RND * 6)
        xz1l1 = z1l1 * 106
        IF xz1l1 = 0 THEN LET xz1l1 = 700
        xz1l2 = z1l2 * 106
        IF xz1l2 = 0 THEN LET xz1l2 = 700
        IF xz1l2 = xz1l1 THEN GOTO 10
13      RANDOMIZE TIMER
        z1l3 = INT(RND * 6)
        xz1l3 = z1l3 * 106
        IF xz1l3 = 0 THEN LET xz1l3 = 700
        IF xz1l3 = xz1l2 THEN GOTO 13
        IF xz1l3 = xz1l2 THEN GOTO 13

'Ziellinie
        IF duhastesgeschafft = 1 THEN GOTO 300
        IF time = 30 THEN LINE (1, 100)-(640, 120), 12, BF

'Zeile 1
        CIRCLE (xz1l1, start1), 40, 8
        PAINT (xz1l1, start1), 8
        CIRCLE (xz1l2, start1), 40, 8
        PAINT (xz1l2, start1), 8
        CIRCLE (xz1l3, start1), 40, 8
        PAINT (xz1l3, start1), 8
        IF time = 0 THEN GOTO 5

'Zeile 2
        CIRCLE (xz2l1, start2), 40, 8
        PAINT (xz2l1, start2), 8
        CIRCLE (xz2l2, start2), 40, 8
        PAINT (xz2l2, start2), 8

'Zeile 3
        CIRCLE (xz3l1, start3), 40, 8
        PAINT (xz3l1, start3), 8
        CIRCLE (xz3l2, start3), 40, 8
        PAINT (xz3l2, start3), 8

'Figur
5       CIRCLE (x, y), 40, 14
        PAINT (x, y), 14

'Augen
        CIRCLE (a, b), 10, 10
        PAINT (a, b), 10
        CIRCLE (c, d), 10, 10
        PAINT (c, d), 10

'Good News
        IF duhastesgeschafft = 1 THEN GOTO 300

'Bad News
        IF loser = 1 THEN GOTO 200

'Bewegung & EinschrÑnkung
        INPUT "", bew$
        IF bew$ = "4" THEN x = x - 106
        IF bew$ = "6" THEN x = x + 106
        IF x = 0 THEN LET x = 106
        IF x = 636 THEN LET x = 530
        CLS

'Screenscroll
        LET start1 = start1 + 100
        IF begrenzer1 = 1 THEN LET start2 = start2 + 100
        IF begrenzer2 = 1 THEN LET start3 = start3 + 100
        IF start1 = 400 THEN LET start1 = 100
        IF start2 = 400 THEN LET start2 = 100
        IF start3 = 400 THEN LET start3 = 100
        LET begrenzer1 = 1

'Game Over
        IF x = xz1l1 AND y = start1 THEN LET loser = 1
        IF x = xz1l2 AND y = start1 THEN LET loser = 1
        IF x = xz1l3 AND y = start1 THEN LET loser = 1
        IF x = xz2l1 AND y = start2 THEN LET loser = 1
        IF x = xz2l2 AND y = start2 THEN LET loser = 1
        IF x = xz3l1 AND y = start3 THEN LET loser = 1
        IF x = xz3l2 AND y = start3 THEN LET loser = 1

'Zuordnungen (variabel)
        LET a = x - 13
        LET b = y - 10
        LET c = x + 13
        LET d = y - 10
      
'Berechnungen fÅr Zeile 2, Loch 1 & 2
        RANDOMIZE TIMER
        z2l1 = INT(RND * 6)
20      RANDOMIZE TIMER
        z2l2 = INT(RND * 6)
        xz2l1 = z2l1 * 106
        IF xz2l1 = 0 THEN LET xz2l1 = 700
        xz2l2 = z2l2 * 106
        IF xz2l2 = 0 THEN LET xz2l2 = 700
        IF xz2l2 = xz2l1 THEN GOTO 20

'Ziellinie
        IF time = 30 THEN LINE (1, 199)-(640, 219), 12, BF

'Zeile 1
        CIRCLE (xz1l1, start1), 40, 8
        PAINT (xz1l1, start1), 8
        CIRCLE (xz1l2, start1), 40, 8
        PAINT (xz1l2, start1), 8
        CIRCLE (xz1l3, start1), 40, 8
        PAINT (xz1l3, start1), 8

'Zeile 2
        CIRCLE (xz2l1, start2), 40, 8
        PAINT (xz2l1, start2), 8
        CIRCLE (xz2l2, start2), 40, 8
        PAINT (xz2l2, start2), 8
        IF time = 0 THEN GOTO 15
'Zeile 3
        CIRCLE (xz3l1, start3), 40, 8
        PAINT (xz3l1, start3), 8
        CIRCLE (xz3l2, start3), 40, 8
        PAINT (xz3l2, start3), 8
        
'Figur
15      CIRCLE (x, y), 40, 14
        PAINT (x, y), 14

'Augen
        CIRCLE (a, b), 10, 10
        PAINT (a, b), 10
        CIRCLE (c, d), 10, 10
        PAINT (c, d), 10

'Bad News
        IF loser = 1 THEN GOTO 200

'Bewegung & EinschrÑnkung
        INPUT "", bew$
        IF bew$ = "4" THEN x = x - 106
        IF bew$ = "6" THEN x = x + 106
        IF x = 0 THEN LET x = 106
        IF x = 636 THEN LET x = 530
        CLS

'Screenscroll
        LET start1 = start1 + 100
        IF begrenzer1 = 1 THEN LET start2 = start2 + 100
        IF begrenzer2 = 1 THEN LET start3 = start3 + 100
        IF start1 = 400 THEN LET start1 = 100
        IF start2 = 400 THEN LET start2 = 100
        IF start3 = 400 THEN LET start3 = 100
        LET begrenzer2 = 1

'Game Over
        IF x = xz1l1 AND y = start1 THEN LET loser = 1
        IF x = xz1l2 AND y = start1 THEN LET loser = 1
        IF x = xz1l3 AND y = start1 THEN LET loser = 1
        IF x = xz2l1 AND y = start2 THEN LET loser = 1
        IF x = xz2l2 AND y = start2 THEN LET loser = 1
        IF x = xz3l1 AND y = start3 THEN LET loser = 1
        IF x = xz3l2 AND y = start3 THEN LET loser = 1
      
'Zuordnungen (variabel)
        LET a = x - 13
        LET b = y - 10
        LET c = x + 13
        LET d = y - 10
      
'Berechnungen fÅr Zeile 3, Loch 1 & 2
        RANDOMIZE TIMER
        z3l1 = INT(RND * 6)
30      RANDOMIZE TIMER
        z3l2 = INT(RND * 6)
        xz3l1 = z3l1 * 106
        IF xz3l1 = 0 THEN LET xz3l1 = 700
        xz3l2 = z3l2 * 106
        IF xz3l2 = 0 THEN LET xz3l2 = 700
        IF xz3l2 = xz3l1 THEN GOTO 30

'Ziellinie
        IF time = 30 THEN LINE (1, 298)-(640, 318), 12, BF

'Zeile 1
        CIRCLE (xz1l1, start1), 40, 8
        PAINT (xz1l1, start1), 8
        CIRCLE (xz1l2, start1), 40, 8
        PAINT (xz1l2, start1), 8
        CIRCLE (xz1l3, start1), 40, 8
        PAINT (xz1l3, start1), 8

'Zeile 2
        CIRCLE (xz2l1, start2), 40, 8
        PAINT (xz2l1, start2), 8
        CIRCLE (xz2l2, start2), 40, 8
        PAINT (xz2l2, start2), 8

'Zeile 3
        CIRCLE (xz3l1, start3), 40, 8
        PAINT (xz3l1, start3), 8
        CIRCLE (xz3l2, start3), 40, 8
        PAINT (xz3l2, start3), 8

'Figur
        CIRCLE (x, y), 40, 14
        PAINT (x, y), 14

'Augen
        CIRCLE (a, b), 10, 10
        PAINT (a, b), 10
        CIRCLE (c, d), 10, 10
        PAINT (c, d), 10

'Bad News
        IF loser = 1 THEN GOTO 200

'Bewegung & EinschrÑnkung
        IF time = 30 THEN LET duhastesgeschafft = 1
        IF time = 30 THEN GOTO 1
        INPUT "", bew$
        IF bew$ = "4" THEN x = x - 106
        IF bew$ = "6" THEN x = x + 106
        IF x = 0 THEN LET x = 106
        IF x = 636 THEN LET x = 530

'Screenscroll
        LET start1 = start1 + 100
        IF begrenzer1 = 1 THEN LET start2 = start2 + 100
        IF begrenzer2 = 1 THEN LET start3 = start3 + 100
        IF start1 = 400 THEN LET start1 = 100
        IF start2 = 400 THEN LET start2 = 100
        IF start3 = 400 THEN LET start3 = 100
        LET time = time + 1

'Game Over
        IF x = xz1l1 AND y = start1 THEN LET loser = 1
        IF x = xz1l2 AND y = start1 THEN LET loser = 1
        IF x = xz1l3 AND y = start1 THEN LET loser = 1
        IF x = xz2l1 AND y = start2 THEN LET loser = 1
        IF x = xz2l2 AND y = start2 THEN LET loser = 1
        IF x = xz3l1 AND y = start3 THEN LET loser = 1
        IF x = xz3l2 AND y = start3 THEN LET loser = 1

LOOP UNTIL time = 31

'Game Over
200     COLOR 4, 0
        PRINT
        PRINT
        PRINT "                                 GAME OVER"
        INPUT "", qqqqqqqq
        END

'Successfull
300     COLOR , 0
       
        'Ziellinie
        IF time = 30 THEN LINE (1, 298)-(640, 318), 12, BF
       
        'Figur
        CIRCLE (x, y), 40, 14
        PAINT (x, y), 14
       
        'Augen
        CIRCLE (a, b), 10, 10
        PAINT (a, b), 10
        CIRCLE (c, d), 10, 10
        PAINT (c, d), 10
       
        PRINT
        INPUT "                           Du hast es geschafft!", jippie
        
        CALL Credits(iii, i2)

SUB Credits (iii, i2)

        CLS
        PRINT "Everything was made by Viktor between 26 December 1999 and 19 February 2000"
        PRINT
        PRINT
        PRINT "                Road-Roller"; CHR$(184); " 2000, all rights reserved"
        INPUT "", qqqq
END SUB

SUB Intro (platzhalter)

        CLS
        COLOR 11
      
'Spielanleitung
        PRINT
        PRINT
        PRINT "                      Willkommen bei Road-Roller"; CHR$(184)
        PRINT
        PRINT
        PRINT
        PRINT "   Spielanleitung"
        PRINT
        PRINT "   Du  bist  der  gelbe  Kreis mit den grÅnen Augen.  Die Steuerung erfolgt"
        PRINT "   Åber die Tasten 4  (nach links)  und 6 (nach rechts) auf der numerischen"
        PRINT "   Tastatur.  Jede andere Eingabe  (oder Åberhaupt keine Eingabe)  wird als"
        PRINT "   ''keine Bewegung''  interpretiert.  Jede  Richtungsangabe muss mit Enter"
        PRINT "   bestÑtigt werden, worauf die Reihe Åber der Spielfigur nach unten rÅckt."
        PRINT "   Der Spieler hat die Aufgabe,  darauf zu achten,  dass die Spielfigur mit"
        PRINT "   keinem der Lîchen in BerÅhrung kommt.  Tritt dieser Zustand ein, ist das"
        PRINT "   Spiel beendet.  Da die Position der Lîcher zufÑllig berechnet wird, kann"
        PRINT "   es zu ausweglosen Situationen kommen."
        PRINT
        PRINT
        INPUT "                                 Viel Spass", platzhalter
      
        CLS
        SCREEN 9
        COLOR 11, 11
       
END SUB

