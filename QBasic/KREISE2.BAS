CLS
SCREEN 12
x = 1
y = 2
farbe = 1
durchmesser = 10

DO
FOR i = 1 TO 500
NEXT i

n1 = x * (3.14159 / 180)
n2 = y * (3.14159 / 180)
x = x + 1
y = y + 1

IF x > 360 THEN
        x = x - 360
        farbe = farbe + 1
        IF farbe = 16 THEN farbe = 1
        durchmesser = durchmesser + 5
        IF durchmesser = 200 THEN
                CLS
                durchmesser = 10
        END IF
END IF

IF y > 360 THEN y = y - 360

CIRCLE (300, 230), durchmesser, farbe, n1, n2
LOOP WHILE INKEY$ = ""
PRINT "By Viktor 25 April 2000"

input "", a