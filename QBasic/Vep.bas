1 CLS
10 PRINT "Willkommen bei VeP 1.0"
20 INPUT "Kennst du dich mit VeP aus (j/n) "; w$
30 IF w$ = "n" THEN GOTO 65
40 IF w$ = "j" THEN GOTO 120
45 PRINT w$; "? Du hast zu dicke Finger!"
50 GOTO 20
65 CLS
70 PRINT "Gebrauchsanweisung"
80 PRINT "Gebe die Nummer deines Systems an (2-16)."
85 PRINT "Eine Ziffer darf nicht grî·er oder gleich System sein."
86 PRINT "Wenn du das 16er System benutzt, musst du fÅr A 10, fÅr B 11, fÅr"
87 PRINT "C 12, fÅr D 13, fÅr E 14, fÅr F 15 schreiben."
90 PRINT "Gebe die Anzahl der Ziffern an (1-13), aus denen sich deine Zahl"
91 PRINT "zusammensetzt."
100 PRINT "Gebe die Ziffern deiner Zahl von links nach rechts ein."
110 PRINT "DrÅcke nach jeder Ziffer Enter."
115 PRINT "Jetzt geht's los."
116 GOTO 121
120 CLS
121 INPUT "Systemnummer"; a
122 IF a = 0 THEN GOTO 1000 ELSE GOTO 123
123 IF a = 1 THEN GOTO 1000 ELSE GOTO 124
124 IF a > 16 THEN GOTO 1000 ELSE GOTO 130
130 INPUT "Anzahl der Ziffern"; b
131 IF b = 0 THEN GOTO 130
132 IF b > 13 THEN GOTO 133 ELSE GOTO 135
133 PRINT "Zu viel"
134 GOTO 130
135 CLS
137 PRINT "In der nÑchsten Zeile erste Ziffer eingeben."
140 IF b = 1 THEN GOTO 177
141 IF b = 2 THEN GOTO 176
142 IF b = 3 THEN GOTO 175
143 IF b = 4 THEN GOTO 174
144 IF b = 5 THEN GOTO 173
145 IF b = 6 THEN GOTO 172
146 IF b = 7 THEN GOTO 171
147 IF b = 8 THEN GOTO 170
148 IF b = 9 THEN GOTO 169
149 IF b = 10 THEN GOTO 168
150 IF b = 11 THEN GOTO 167
151 IF b = 12 THEN GOTO 166
165 INPUT "13"; c
166 INPUT "12"; d
167 INPUT "11"; e
168 INPUT "10"; f
169 INPUT "9"; g
170 INPUT "8"; h
171 INPUT "7"; i
172 INPUT "6"; j
173 INPUT "5"; k
174 INPUT "4"; l
175 INPUT "3"; m
176 INPUT "2"; n
177 INPUT "1"; o
178 CLS
180 x = c * a + d
181 y = x * a + e
182 z = y * a + f
183 p = z * a + g
184 q = p * a + h
185 r = q * a + i
186 s = r * a + j
187 t = s * a + k
188 u = t * a + l
189 v = u * a + m
190 w = v * a + n
191 z = w * a + o
195 PRINT "Die decodierte Zahl ist"; z
200 INPUT "Nochmal(n), Ende(e), Credits(c)"; x$
210 IF x$ = "n" THEN GOTO 430
215 IF x$ = "e" THEN GOTO 300
216 IF x$ = "c" THEN GOTO 399
220 GOTO 200
300 CLS
310 PRINT "Bis bald."
320 END
399 CLS
400 PRINT "Created and programmed by Viktor (27.08.1999 - 31.08.1999)"
410 PRINT "Written (on a peace of paper) by Viktor on the 25th august 1999"
420 PRINT "Special thanks to Dirk (The Jedi-Master) J. Thomas for teaching"
421 PRINT "me to programm Basic"
422 PRINT "Tested by Viktor"
423 PRINT "Debug by Viktor"
425 GOTO 200
430 CLEAR
431 GOTO 120
1000 PRINT "UngÅltige Systemangabe!"
1001 GOTO 121



