CLS
SCREEN 12
x = 1
y = 2
1 zahl = 30
zahl2 = 150
y2 = 180
x2 = 181
stopkreis = 0
sprung = 0
sprung2 = 0

DO
    _LIMIT 300
    FOR i = 1 TO 300
    NEXT i
    CIRCLE (210, 220), 90, 0, anfang1, ende1

    'Kreisbogenberechnung (Kreis 1)
    anfang1 = x * (3.14159 / 180)
    ende1 = y * (3.14159 / 180)
    y = y + 1
    IF y > zahl THEN x = x + 1
    IF y = 361 THEN
        y = 360
        zahl = -1
    END IF
    IF x = 330 THEN GOTO 10

    CIRCLE (210, 220), 90, 11, anfang1, ende1
    FOR i = 1 TO 5000
    NEXT i

LOOP WHILE INKEY$ = ""

10 DO
    _LIMIT 300
    FOR i = 1 TO 300
    NEXT i
    CIRCLE (390, 220), 90, 0, ende2, anfang2

    'šbermalen vom šbergang (Kreis1 zu Kreis2)
    IF sprung = 1 GOTO 20
    CIRCLE (210, 220), 90, 0, anfang1, ende1

    'Kreisbogenberechnung (šbergang von Kreis1 zu Kreis2)
    anfang1 = x * (3.14159 / 180)
    ende1 = y * (3.14159 / 180)
    y = y + 1
    x = x + 1
    IF y > 360 THEN y = 360
    IF x = 361 THEN sprung = 1

    CIRCLE (210, 220), 90, 11, anfang1, ende1

    'Kreisbogenberechnung (Kreis 2)
    20 anfang2 = x2 * (3.14159 / 180)
    ende2 = y2 * (3.14159 / 180)
    y2 = y2 - 1
    IF y2 < zahl2 THEN x2 = x2 - 1
    IF y2 = 0 THEN
        y2 = 360
        zahl2 = 361
        LET stopkreis = 1
    END IF
    IF x2 = 0 THEN x2 = 360
    IF stopkreis = 1 THEN
        IF y2 = 178 THEN y2 = 179
        IF x2 = 207 THEN GOTO 30
    END IF

    CIRCLE (390, 220), 90, 11, ende2, anfang2

    FOR i = 1 TO 5000
    NEXT i

LOOP WHILE INKEY$ = ""


30 x = 1
y = 2
DO
    _LIMIT 300
    FOR i = 1 TO 300
    NEXT i

    'šbermalen vom šbergang (Kreis2 zu Kreis1)
    IF sprung2 = 1 THEN GOTO 40
    CIRCLE (390, 220), 90, 0, ende2, anfang2

    'Kreisbogenberechnung (šbergang von Kreis2 zu Kreis1)
    anfang2 = x2 * (3.14159 / 180)
    ende2 = y2 * (3.14159 / 180)
    x2 = x2 - 1
    IF x2 = 0 THEN x2 = 360
    IF x2 = 178 THEN sprung2 = 1

    CIRCLE (390, 220), 90, 11, ende2, anfang2


    40 CIRCLE (210, 220), 90, 0, anfang1, ende1

    'Kreisbogenberechnung (Kreis 1)
    anfang1 = x * (3.14159 / 180)
    ende1 = y * (3.14159 / 180)
    y = y + 1
    IF y > zahl THEN x = x + 1
    IF y = 361 THEN
        y = 360
        zahl = -1
    END IF
    IF x = 100 THEN GOTO 1

    CIRCLE (210, 220), 90, 11, anfang1, ende1

    FOR i = 1 TO 5000
    NEXT i

LOOP WHILE INKEY$ = ""

INPUT "", a

