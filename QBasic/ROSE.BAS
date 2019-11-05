'By Viktor, 22. Juni 2000

CLS
SCREEN 12
mm = 1
1 dm = 5
time = 0
DO
    _LIMIT 5000
    FOR i = 1 TO 1000
    NEXT i
    x = x + 1
    IF x = 361 THEN x = 0
    n = x * (3.14159 / 180)
    nn = x * (3.14159 / 180) - 0.025
    IF nn < 0 THEN nn = 0
    IF dm < 0 GOTO 10
    CIRCLE (300, 232), dm, farbe, nn, n
    dm = dm + mm
    time = time + 1
    IF time > 250 THEN mm = -1.5
LOOP WHILE INKEY$ = ""
INPUT "   ", a
COLOR 0
END
10 IF sauber = 1 THEN GOTO 20
IF sauber = 0 THEN CLS
farbe = 12
sauber = 1
20 mm = mm + 2.4
enee = enee + 1
IF enee = 50 THEN GOTO 30
GOTO 1
30 COLOR 0

