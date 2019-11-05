CLS
SCREEN 12
y = -70
up = 0
q2 = 120
q1 = 90
q3 = 1
q4 = 31

DO

FOR i = 1 TO 5000
NEXT i

CIRCLE (310, 220), 100, 0, n3, n4
CIRCLE (310, 220), 80, 0, n1, n2
LINE STEP(0, 0)-STEP(x, y), 0

10 IF up = 0 THEN
        top = 0
        y = y + 1
        IF y > 65 THEN LET y = y - .6
        IF y > 68 THEN LET y = y - .3
        IF y < -65 THEN LET y = y - .6
        IF y < -68 THEN LET y = y - .3
        IF y > 70 THEN LET up = 1
END IF

IF up = 1 THEN
        y = y - 1
        IF y > 65 THEN LET y = y + .6
        IF y > 68 THEN LET y = y + .3
        IF y < -65 THEN LET y = y + .6
        IF y < -68 THEN LET y = y + .3
        IF y < -70 THEN
                LET up = 0
                LET top = 1
                LET q1 = q1 - 30
                LET q3 = q3 + 30
                SOUND 300, 1
        END IF
END IF

IF top = 1 THEN GOTO 10

x = SQR(70 ^ 2 - y ^ 2)
IF up = 1 THEN LET x = -x

q1 = q1 + 1
q2 = q2 + 1
q3 = q3 - 1
q4 = q4 - 1

IF q1 > 360 THEN q1 = 0
IF q2 > 360 THEN q2 = 0
IF q3 < 0 THEN q3 = 360
IF q4 < 0 THEN q4 = 360
IF q3 > 360 THEN q3 = q3 - 360

n1 = q1 * (3.14159 / 180)
n2 = q2 * (3.14159 / 180)
n3 = q3 * (3.14159 / 180)
n4 = q4 * (3.14159 / 180)
 
CIRCLE (310, 220), 100, 11, n3, n4
CIRCLE (310, 220), 80, 14, n1, n2
LINE STEP(0, 0)-STEP(x, y)

LOOP WHILE INKEY$ = ""
PRINT "by Viktor 5. Mai 2000"
input "", a
