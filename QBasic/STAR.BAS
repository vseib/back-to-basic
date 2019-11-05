CLS
SCREEN 12
COLOR 2

mittex = 320
mittey = 240
more = 200
1 move = 0
mode = mode + 1

LINE (mittex - more, mittey)-(mittex, mittey)

FOR i = 1 TO 20
    _LIMIT 20
    FOR ai = 1 TO 20000
    NEXT ai
    move = move + 10
    IF mode = 1 THEN LINE (mittex - more + move, mittey)-(mittex, mittey - move)
    IF mode = 2 THEN LINE (mittex + move, mittey)-(mittex, mittey - more + move)
    IF mode = 3 THEN LINE (mittex + more - move, mittey)-(mittex, mittey + move)
    IF mode = 4 THEN LINE (mittex - move, mittey)-(mittex, mittey + more - move)
NEXT i

IF mode = 4 THEN GOTO 2 ELSE GOTO 1

2 PRINT "By Viktor Seib, 26. September 2001"
COLOR 0
INPUT "", a
