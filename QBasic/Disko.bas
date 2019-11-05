1 CLS
INPUT "Welchen Modus m”chtest du sehen [Disko (d) oder Haschisch (h)]"; Modus$
SCREEN 9
CLS
DO
IF Modus$ = "h" GOTO 10
CLS 1
10 RANDOMIZE TIMER
x = INT(RND * 624) + 1: y = INT(RND * 320) + 1: c = INT(RND * 15) + 1
A = INT(RND * 614) + 1: S = INT(RND * 310) + 1: D = INT(RND * 15) + 1
q = INT(RND * 619) + 1: w = INT(RND * 315) + 1: e = INT(RND * 15) + 1
r = INT(RND * 614) + 1: t = INT(RND * 310) + 1: z = INT(RND * 15) + 1
LINE (q + 40, w + 7)-(q + 60, w + 27), l, BF: l = l + 1: IF l = 16 THEN l = 1
LINE (q, w)-(q + 20, w + 20), e, BF
LINE (r, t)-(r + 25, t + 25), z, BF
LINE (x, y)-(x + 15, y + 15), c, BF
LINE (A, S)-(A + 25, S + 25), D, BF
LOOP WHILE INKEY$ = ""
PRINT "By Viktor 9. Dezember 1999"
20 INPUT "Nochmal (j/n)"; h$
IF h$ = "j" THEN GOTO 1
IF h$ = "n" THEN END ELSE GOTO 20

