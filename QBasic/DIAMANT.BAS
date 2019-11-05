CLS
LET y = 100: LET a = 300: LET b = 10
SCREEN 9
DO
    _LIMIT 20
    x = x + 10
    RANDOMIZE TIMER
    soun = INT(RND * 5001) + 500
    SOUND soun, .8
    LINE (a, b)-(x, y), 11
LOOP UNTIL x = 600
DO
    _LIMIT 20
    y = y + 5
    RANDOMIZE TIMER
    soun = INT(RND * 5001) + 500
    SOUND soun, .8
    LINE (a, b)-(x, y), 10
LOOP UNTIL y = 200
DO
    _LIMIT 20
    x = x - 10
    RANDOMIZE TIMER
    soun = INT(RND * 5001) + 500
    SOUND soun, .8
    LINE (a, b)-(x, y), 14
LOOP UNTIL x = 0
DO
    _LIMIT 20
    y = y - 5
    RANDOMIZE TIMER
    soun = INT(RND * 5001) + 500
    SOUND soun, .8
    LINE (a, b)-(x, y), 9
LOOP UNTIL y = 100
LET y = 200: LET a = 300: LET b = 300
x = x - 10
DO
    _LIMIT 20
    x = x + 10
    RANDOMIZE TIMER
    soun = INT(RND * 5001) + 500
    SOUND soun, .8
    LINE (a, b)-(x, y), 13
LOOP UNTIL x = 600
DO
    _LIMIT 20
    y = y - 5
    RANDOMIZE TIMER
    soun = INT(RND * 5001) + 500
    SOUND soun, .8
    LINE (a, b)-(x, y), 12
LOOP UNTIL y = 100
DO
    _LIMIT 20
    x = x - 10
    RANDOMIZE TIMER
    soun = INT(RND * 5001) + 500
    SOUND soun, .8
    LINE (a, b)-(x, y), 15
LOOP UNTIL x = 0
DO
    _LIMIT 20
    y = y + 5
    RANDOMIZE TIMER
    soun = INT(RND * 5001) + 500
    SOUND soun, .8
    LINE (a, b)-(x, y), 11
LOOP UNTIL y = 200
PRINT "By Viktor 29.12.1999"
INPUT "", a

