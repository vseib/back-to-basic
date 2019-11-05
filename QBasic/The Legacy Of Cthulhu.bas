DECLARE SUB DelaySub ()
DECLARE SUB Battle ()
DECLARE SUB Start ()
DECLARE SUB Credits ()
DECLARE SUB Finale ()
DECLARE SUB Hoehle ()
DECLARE SUB MagierGilde ()
DECLARE SUB FischerHaus ()
DECLARE SUB AlterHaus ()
DECLARE SUB Berge ()
DECLARE SUB SteppeO ()
DECLARE SUB Kueste ()
DECLARE SUB Wald ()
DECLARE SUB SteppeW ()
DECLARE SUB SteppeN ()
DECLARE SUB Passwort ()
DECLARE SUB Anleitung ()
DECLARE SUB Limits ()
DECLARE SUB Intro ()
DECLARE SUB Home ()
DECLARE SUB Stadt ()
DECLARE SUB Kirche ()
DECLARE SUB Schloss ()
DECLARE SUB SteppeS ()
DECLARE SUB HaendlerHaus ()

COMMON SHARED gehehin, location, item$, keingottesdienst, stadttoroffen, schondagewesen
COMMON SHARED nopassword, lautegegeben, kompassschonzurueck, durchganggewaehrt, kannnichtindenwald
COMMON SHARED brilleschongegeben, angelwurderepariert, angelwirdgeraderepariert, ilikefish
COMMON SHARED brauchepulver, name$, augeeingesetzt, dead

CLS: CLEAR

Start
Limits
Intro

SCREEN 0

100
IF dead = 1 THEN gehehin = 19
IF gehehin = 0 THEN END
IF gehehin = 1 THEN Home
IF gehehin = 2 THEN Stadt
IF gehehin = 3 THEN Kirche
IF gehehin = 4 THEN Schloss
IF gehehin = 5 THEN SteppeS
IF gehehin = 6 THEN SteppeN
IF gehehin = 7 THEN SteppeW
IF gehehin = 8 THEN Wald
IF gehehin = 9 THEN Kueste
IF gehehin = 10 THEN SteppeO
IF gehehin = 11 THEN Berge
IF gehehin = 12 THEN HaendlerHaus
IF gehehin = 13 THEN AlterHaus
IF gehehin = 14 THEN FischerHaus
IF gehehin = 15 THEN MagierGilde 'im Spiel "H�hle" benannt
IF gehehin = 16 THEN Hoehle 'Gang hinter dem Wasserfall
IF gehehin = 17 THEN Finale 'erreichbar �ber Sub_Hoehle
IF gehehin = 18 THEN Battle 'erreichbar �ber Sub_Finale
IF gehehin = 19 THEN Credits
GOTO 100

SUB AlterHaus

    position = 0
    13 CLS
    COLOR 3
    location = 13

    PRINT "Ort: ": LOCATE 1, 6: COLOR 10: PRINT "Haus des alten Mannes": COLOR 3
    LOCATE 1, 31: PRINT "Position: ": COLOR 10: LOCATE 1, 40: PRINT position: COLOR 3
    LOCATE 1, 45: PRINT "Item: ": LOCATE 1, 51: COLOR 10: PRINT item$: COLOR 3

    LOCATE 3, 1
    IF brilleschongegeben = 0 THEN
        PRINT "Das Haus des alten Mannes befindet sich im guten Zustand. �berall im Haus"
        PRINT "befinden sich B�cherregale. Der alte Mann sitzt an seinem Tisch und sortiert"
        PRINT "seine Briefmarkensammlung."
    ELSE
        PRINT "Das Haus des alten Mannes befindet sich im guten Zustand. �berall im Haus"
        PRINT "befinden sich B�cherregale. Der alte Mann sitzt an seinem Tisch und liest"
        PRINT "eines seiner B�cher."
    END IF

    LOCATE 8, 1: COLOR 7
    PRINT "1. Umsehen"
    PRINT "2. Ansprechen"
    PRINT "3. Gegenstand benutzen"
    PRINT "4. zum alten Mann gehen (1)"
    PRINT "5. gehe raus (in den Wald)"

    LOCATE 15, 1: COLOR 3: PRINT "Deine Aktion: "
    DO
        LOCATE 15, 15: COLOR 7: PRINT "           "
        LOCATE 15, 15: COLOR 7: INPUT "", action
    LOOP UNTIL action > 0 AND action < 6
    COLOR 3

    IF position = 0 THEN
        IF action < 4 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 13
        END IF
    END IF

    IF action = 5 THEN
        gehehin = 8
        GOTO 1300
    END IF

    IF action = 4 THEN
        position = 1
        GOTO 13
    END IF

    IF position = 1 THEN
        IF action = 1 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 13
        END IF
        IF action = 2 THEN
            IF angelwurderepariert = 1 THEN
                CLS
                INPUT "Krondir: Ich hoffe die Pilze haben dir geschmeckt.", asdf$
                GOTO 13
            END IF
            IF angelwirdgeraderepariert = 1 THEN
                IF item$ = "Korb mit Pilzen" THEN
                    CLS
                    PRINT "Krondir: Sorry, ich kann dir nur einen Korb mit Pilzen geben."
                    INPUT "", asdf$
                    GOTO 13
                ELSE CLS
                    PRINT "Krondir: Ich bin eben im Wald gewesen."
                    PRINT "Heute habe ich sehr viele Pilze gefunden."
                    PRINT "Hier hast du einen Korb voll, lass es dir schmecken."
                    INPUT "", asdf$
                    PRINT
                    COLOR 7
                    INPUT "Krondir gibt dir ein Korb voll Pilze.", asdf$
                    item$ = "Korb mit Pilzen"
                    GOTO 13
                END IF
            END IF
            IF item$ = "Laute" OR lautegegeben = 1 THEN
                CLS
                PRINT "Krondir: Da war also eine Laute drin!"
                PRINT "Ich hoffe du bist damit zufrieden, etwas anderes kann ich dir nicht"
                PRINT "anbieten."
                INPUT "", asdf$
                GOTO 13
            END IF
            IF brilleschongegeben = 0 THEN
                CLS
                PRINT "Alter Mann: Hallo, mein Name ist Krondir."
                PRINT "Ich lese so gerne B�cher, aber meine Brille ist kaputt. Und ohne"
                PRINT "Brille sehe ich viel zu schlecht. Du hast nicht zuf�llig noch eine"
                INPUT "Brille die du mir schenken k�nntest?", asdf$
                GOTO 13
            END IF
            IF brilleschongegeben = 1 THEN
                DO
                    CLS
                    PRINT "Krondir: Nochmal danke f�r die Brille."
                    PRINT "Wie gesagt, die Zahlenkombination f�r das Schloss der Truhe ist auch mir"
                    PRINT "ein R�tsel. Vor allem, weil in dem Land, aus dem McDix kommt, Zahlen"
                    PRINT "vollkommen unbekannt sind. Dort wird alles mit Buchstaben geschrieben."
                    PRINT "Aber wenn du mich fragst, das gr��ere R�tsel ist sein Name, weil er f�r"
                    PRINT "das Land wo der Mann herkommt ziemlich ungew�hnlich ist."
                    PRINT "Leider f�llt mir der Name des Landes nicht mehr ein, aber ich glaube wenn du"
                    PRINT "w�sstest aus welchem Land er kommt, w�sstest du auch die Kombination."
                    PRINT
                    INPUT "M�chtest du dein Gl�ck probieren, und eine Kombination eingeben?", asdf$
                LOOP UNTIL asdf$ = "ja" OR asdf$ = "nein"
                IF asdf$ = "nein" THEN GOTO 13
                COLOR 7
                PRINT
                PRINT
                IF asdf$ = "ja" THEN INPUT "Gebe hier die Kombination ein: ", kombination$
                IF kombination$ = "1409" THEN
                    PRINT
                    INPUT "Das war die richtige Kombination!", asdf$
                    PRINT
                    INPUT "In der Truhe liegt eine Laute, die du mitnimmst.", asdf$
                    item$ = "Laute"
                    GOTO 13
                ELSE PRINT
                    INPUT "Mit dieser Kombination l�sst sich das Schloss leider nicht �ffnen.", asdf$
                    GOTO 13
                END IF

            END IF
        END IF
        IF action = 3 THEN
            IF item$ = "Brille" THEN
                CLS
                PRINT "Krondir: Eine Brille!!!"
                PRINT "Danke sch�n! Daf�r gebe ich dir die Truhe, die da in der Ecke steht."
                PRINT "Oder genauer gesagt, den Inhalt der Truhe, weil sie selbst viel zu"
                PRINT "schwer zum Tragen ist."
                PRINT "Da gibt es nur ein Problem, der Mann der mir die Truhe gab hie� McDix."
                PRINT "Er kam von weit her, aus einem Land wo sie keine Zahlen kennen. In seinem"
                PRINT "Land wird alles in Buchstaben geschrieben. Er hat mir die Kombination"
                PRINT "f�r das Schloss nicht verraten. Aber wenn du dein Gl�ck probieren willst,"
                INPUT "sag mir nur bescheid.", asdf$
                brilleschongegeben = 1
                item$ = "kein Gegenstand vorhanden"
                GOTO 13
            ELSE INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
                GOTO 13
            END IF
        END IF
    END IF

    1300
END SUB

SUB Anleitung

    CLS
    COLOR 15

    PRINT "                          Spielanleitung"
    PRINT
    PRINT
    PRINT "Die Steuerung erfolgt �berwiegend �ber die Zifferntasten."
    PRINT "Vereinzelt m�ssen W�rter wie z.B. 'ja' oder 'nein' eingegeben werden."
    PRINT "Jede Eingabe muss mit der Enter Taste best�tigt werden."
    PRINT
    PRINT "Oft wird z.B. eine Beschreibung der Umgebung gegeben und keine Eingabe"
    PRINT "verlangt. An diesen Stellen bleibt das Spiel scheinbar stehen."
    PRINT "In Wirklichkeit wartet es auf den Druck der Enter Taste. Dieses"
    PRINT "'Stehenbleiben' des Spiels dient dazu, sicherzugehen, dass der Spieler"
    PRINT "den gesamten Text auf dem Bildschirm gelesen hat, bevor es, mit dem"
    PRINT "Druck der Enter Taste, weitergeht."

    LOCATE 30, 1: COLOR 7
    INPUT "Weiter mit Enter", asdf$
    COLOR 15: CLS

    PRINT "Der Spielbildschirm ist folgenderma�en aufgebaut:"
    PRINT
    PRINT "In der linken oberen Ecke befindet sich der Punkt 'Ort'. Er gibt an, an"
    PRINT "welchem Ort des Spiels der Spieler sich gerade befindet. (z.B. Kirche)"
    PRINT
    PRINT "In der Mitte der obersten Zeile befindet sich der Punkt 'Position'. Dieser"
    PRINT "gibt an, an welcher Position innerhalb des Ortes sich der Spieler gerade"
    PRINT "befindet. Die Position wird in Zahlen angegeben. (Beispiel weiter unten)"
    PRINT
    PRINT "In der rechten oberen Ecke befindet sich der Punkt 'Item'. Er gibt an,"
    PRINT "welchen Gegenstand der Spieler gerade mit sich f�hrt. (z.B Hammer)"
    PRINT "Es kann jeweils nur ein Gegenstand mitgef�hrt werden."

    LOCATE 30, 1: COLOR 7
    INPUT "Dr�cke Enter f�r einen Beispielbildschirm", asdf$

    CLS
    COLOR 3
    PRINT "Ort: ": LOCATE 1, 6: COLOR 10: PRINT "Marktplatz": COLOR 3
    LOCATE 1, 31: PRINT "Position: ": COLOR 10: LOCATE 1, 40: PRINT " 1": COLOR 3
    LOCATE 1, 45: PRINT "Item: ": LOCATE 1, 51: COLOR 10: PRINT "Hammer": COLOR 3

    LOCATE 3, 1
    PRINT "Auf dem Marktplatz befinden sich viele Leute."
    PRINT "Es scheint die Sonne und es ist sehr hei�."

    LOCATE 6, 1: COLOR 7
    PRINT "1. Umsehen"
    PRINT "2. Ansprechen"
    PRINT "3. Gegenstand benutzen"
    PRINT "4. zum Brunnen gehen (1)"
    PRINT "5. zum H�ndler gehen (2)"
    PRINT "6. gehe weg (in die Stadt)"

    LOCATE 13, 1: COLOR 15
    PRINT "------------------------------------------------------------------------------"
    PRINT "       In der ersten Zeile befinden sich die 3 eben erw�hnten Punkte."
    PRINT "Der Spieler befindet sich auf dem Marktplatz und zwar steht er gerade beim"
    PRINT "Brunnen. Das wird durch die 1 beim Punkt 'Position' und die eingeklammerte"
    PRINT "1, die hinter dem Wort 'Brunnen' steht, angegeben (siehe Aktion Nr.4:"
    PRINT "'zum Brunnen gehen (1)' ). Position 0 bedeutet, dass man diesen Ort gerade"
    PRINT "erst betreten hat."
    PRINT "       Die 2 n�chsten Zeilen geben eine Kurzbeschreibung zum aktuellen Ort."
    PRINT
    PRINT "       Weiter unten sind die hier verf�gbaren Aktionen aufgelistet. Durch das"
    PRINT "Dr�cken der vorangestellten Zahl wird die entsprechende Aktion ausgef�hrt."
    PRINT "Die Aktionen 1 bis 3 beziehen sich auf die Aktuelle Position und sind an"
    PRINT "jedem Ort gleich. Diese 3 Aktionen funktionieren nicht bei Position 0."
    PRINT "Bei Aktion Nr.6 ist in den Klammern keine Positionsangabe vorhanden."
    PRINT "Das bedeutet, dass der Spieler beim Ausf�hren dieser Aktion den aktuellen"
    PRINT "Ort verlassen wird."

    LOCATE 30, 1: COLOR 7
    INPUT "Weiter mit Enter", asdf$

    CLS
    COLOR 15

    PRINT "Im Spiel m�ssen hin und wieder bestimmte W�rter eingegeben werden."
    PRINT "Bei der Eingabe ist genau auf die Schreibweise zu achten."
    PRINT
    PRINT "Beispiel: Wenn 'HalloDuDa' eingegeben werden m�sste, w�hre u.a. folgendes"
    PRINT "falsch: 'halloduda' / 'hallo du da' / 'Halloduda'."
    PRINT
    PRINT "Ab und zu wird eine Frage gestellt, die eindeutig mit 'ja' oder 'nein'"
    PRINT "beantwortet werden kann. Dabei sollten beide W�rter klein geschrieben"
    PRINT "werden."
    PRINT
    PRINT
    PRINT "Bei den Passw�rtern ist ebenfalls auf die genaue Schreibweise zu achten."
    PRINT "Jedes Passwort gibt es als Zahlenkombination oder als ein Wort."
    PRINT
    PRINT "Beispiel: 1234 bzw. ErstesPasswort"
    PRINT "Beide Passw�rter w�rden denselben Effekt haben."

    LOCATE 30, 1: COLOR 7
    INPUT "Dr�cke Enter um zum Titelbildschirm zur�ckzukehren", asdf$

END SUB

SUB Battle

    CLS
    COLOR 7
    PRINT "Kampfanleitung"
    PRINT
    PRINT "Stellen Sie sich 5 Ebenen vor. Sie befinden sich auf Ebene 1,"
    PRINT "der Drache ist auf Ebene 5. Zwischen Ihnen und dem Drachen sind"
    PRINT "die �brigen 3 Ebenen. Weder Sie, noch der Drache k�nnen die eigene"
    PRINT "Ebene verlassen. Die einzigen m�glichen Bewegungsrichtungen sind"
    PRINT "links und rechts. Neben Ihrem Namen wird eine Zahl stehen, die"
    PRINT "Ihre Position angibt (von 1 - ganz links; bis 5 - ganz rechts)."
    PRINT
    PRINT "Sie k�nnen nun, um den Drachen zu besiegen, Pfeile schie�en."
    PRINT "Dabei fliegt der Pfeil geradeaus �ber alle Ebenen. (Das hei�t, wenn"
    PRINT "Sie den Pfeil von Position 3 abschie�en, kommt er auf der letzten"
    PRINT "Ebene bei 3 an.) Wenn der Drache dann ebenfalls auf Position 3 ist,"
    PRINT "oder sich zuf�llig auf Position 3 bewegt, wird er vom Pfeil getroffen."
    PRINT "Nach 3 Treffern haben Sie den Kampf gewonnen."
    PRINT
    PRINT "Aber vorsicht, der Drache spuckt Feuerb�lle. F�r die Feuerb�lle gelten"
    PRINT "die selben Regeln, wie f�r Ihre Pfeile, allerdings k�nnen 2 Feuerb�lle"
    PRINT "auf einmal auf Sie zukommen. Der Kampf ist sofort zu Ende, wenn Sie"
    INPUT "von einem Feuerball getroffen werden.", asdf$
    PRINT
    PRINT "Weitere Regeln:"
    PRINT "- Bewegen und gleichzeitig schie�en geht nicht."
    PRINT "- Sie k�nnen nur jede 2 Runde einen Pfeil abschie�en."
    PRINT "- Wenn Sie eine andere Eingabe machen, als die 3 vorgesehenen"
    PRINT "  (links, rechts, Pfeil schie�en), dann wird keine Aktion ausgef�hrt."
    PRINT
    INPUT "Viel Erfolg", asdf$

    CLS

    dragonpos = 3 'gibt die Position des Drachen an
    'dragonmove - gibt die neue Bewegung des Drachen an
    yourpos = 3 'gibt die Position des Spielers an
    'yourmove - gibt die Bewegung des Spielers an
    'fire1 und fire2 - Berechnung ob oder ob nicht ein Feuerball gespuckt wird

    DO

        RANDOMIZE TIMER 'berechnet die Bewegung des Drachen
        dragonmove = INT(RND * 3) + 1
        dragonmove = dragonmove - 2
        dragonpos = dragonpos + dragonmove
        IF dragonpos > 5 THEN dragonpos = 5
        IF dragonpos < 1 THEN dragonpos = 1


        '---------------------------------
        'Drache spuckt Feuerb�lle - Anfang


        IF ball1fliegt = 0 THEN 'Pr�fung ob Feuerball1 schon fliegt
            RANDOMIZE TIMER
            fire1 = INT(RND * 2)
      
            IF fire1 = 1 THEN
                f1z1 = dragonpos
                ball1fliegt = 1
            END IF
        ELSE f1z1 = 0
        END IF

        IF ball2fliegt = 0 THEN 'Pr�fung ob Feuerball2 schon fliegt
            RANDOMIZE TIMER
            fire2 = INT(RND * 2)
      
            IF fire2 = 1 THEN
                f2z1 = dragonpos
                ball2fliegt = 1
              
                IF f1z1 = f2z1 THEN 'Kontrolle, dass die Feuerb�lle nicht
                    f2z1 = 0 'identisch sind
                    ball2fliegt = 0
                END IF
            END IF
        ELSE f2z1 = 0
        END IF


        'Drache spuckt Feuerb�lle - Ende
        '-------------------------------

        LOCATE 7, 13: PRINT "                " 's�ubert die Eingabezeile

        LOCATE 1, 1: COLOR 12 'stellt die Arena dar - Anfang
        PRINT "Drache:"; dragonpos
        COLOR 9
        PRINT "Feuerball:"; f1z1; " Feuerball:"; f2z1; " Pfeil:"; pz3
        PRINT "Feuerball:"; f1z2; " Feuerball:"; f2z2; " Pfeil:"; pz2
        PRINT "Feuerball:"; f1z3; " Feuerball:"; f2z3; " Pfeil:"; pz1
        COLOR 11
        PRINT name$; ":"; yourpos
        PRINT

        LOCATE 8, 1: COLOR 8
        PRINT "4 = links, 6 = rechts                 "
        PRINT "5 = Pfeil abschie�en                  "
        PRINT "                                      "

        '---------------------
        'Pfeil fliegt - Anfang

        pend = pz3 'pend = Pfeil Ende - Der Pfeil kommt am Ende an
        IF pend > 0 THEN
            pfeilfliegt = 0
            IF pend = dragonpos THEN
                dragonhit = dragonhit + 1
                LOCATE 15, 1: COLOR dragonhit
                PRINT "Du hast den Drachen schon"; dragonhit; "mal getroffen!"
                IF dragonhit = 3 THEN GOTO 235111
                pend = 0
            END IF
        END IF

        pz3 = pz2 'p = Pfeil; z3 = Zeile 3
        pz2 = pz1 'Pfeil fliegt weiter

        'Pfeil fliegt - Ende
        '-------------------

        LOCATE 7, 1: COLOR 7 'fragt die Bewegung des Spielers ab
        INPUT "Deine Bewegung: ", yourmove

        IF pfeilfliegt = 0 THEN 'Spieler schie�t Pfeil
            IF yourmove = 5 THEN
                pz1 = yourpos
                pfeilfliegt = 1
            END IF
        ELSE pz1 = 0
        END IF

        IF yourmove = 4 THEN yourpos = yourpos - 1 'kontrolliert die G�ltigkeit
        IF yourmove = 6 THEN yourpos = yourpos + 1 'der Bewegung
        IF yourpos > 5 THEN yourpos = 5
        IF yourpos < 1 THEN yourpos = 1 'stellt die Arena dar - Ende


        '--------------------------
        'Feuerb�lle fliegen - Anfang

        f1end = f1z3 'Feuerball1 kommt am Ende an
        IF f1end > 0 THEN
            ball1fliegt = 0
            IF f1end = yourpos THEN GOTO 235000
        END IF

        f1z3 = f1z2 'Positionsvariablen: f1 = Feuerball 1; z3 = Zeile 3
        f1z2 = f1z1 'Feuerball1 fliegt weiter


        f2end = f2z3 'Feuerball2 kommt am Ende an
        IF f2end > 0 THEN
            ball2fliegt = 0
            IF f2end = yourpos THEN GOTO 235000
        END IF

        f2z3 = f2z2 'Positionsvariablen: f2 = Feuerball 2; z3 = Zeile 3
        f2z2 = f2z1 'Feuerball2 fliegt weiter

        'Feuerb�lle fliegen - Ende
        '-------------------------

    LOOP

    235000
    CLS: COLOR 7
    PRINT "Du wurdest von einem Feuerball getroffen."
    PRINT
    PRINT "Deine Kleidung f�ngt Feuer und du windest dich vor Schmerz"
    INPUT "auf dem Boden.", asdf$
    PRINT
    PRINT "Auf einmal st�rmen 4 Menschen in die H�hle."
    INPUT "Mit einem m�chtigen Zauberspruch vernichten sie den Drachen.", asdf$
    PRINT
    PRINT "Einer von ihnen kommt zu dir und sagt:"
    COLOR 3
    PRINT "Danke, "; name$; " du hast deine Mission erf�llt."
    PRINT "Dein Tod wird nicht umsonst sein. Ab hier k�nnen wir die Aufgabe"
    PRINT "weiterf�hren."
    PRINT
    COLOR 7
    INPUT "An der Stimme erkennst du den K�nig.", asdf$
    CLS
    INPUT "Bald darauf bist du tot.", asdf$
    dead = 1
    EXIT SUB

    235111
    CLS: COLOR 3
    PRINT "Du hast den Drachen 3 mal getroffen!"
    COLOR 7
    PRINT
    PRINT "Er f�llt auf den Boden und schreit ein letztes Mal vor Schmerz auf,"
    INPUT "bevor er stirbt.", asdf$

    CLS
    PRINT "Hinter dir betreten 3 Menschen den Raum."
    PRINT "Du drehst dich um und erkennst den K�nig, den Magier aus der Gilde"
    PRINT "und den Forscher, der beim H�ndler war. Sie sind alle gleich gekleidet."
    PRINT
    PRINT "Auf einmal kommt Arnaw, der Reisende, den du in der Steppe gesehen hast rein."
    PRINT "Er tr�gt ein blutverschmiertes Schwert und ist genauso gekleidet,"
    INPUT "wie die anderen drei.", asdf$
    PRINT
    COLOR 3
    PRINT "Arnaw: Dieser Verr�ter wird uns nicht l�nger st�ren."
    PRINT "Ich habe ihn von dem irdischen Dasein erl�st."
    COLOR 7
    PRINT
    INPUT "Er steckt das Schwert weg.", asdf$

    CLS: COLOR 3
    PRINT "K�nig: Du hast deine Aufgabe sehr gut erledigt, "; name$; "."
    INPUT "Ab hier machen wir weiter.", asdf$
    COLOR 7
    PRINT
    PRINT "Der K�nig macht einen Wink mit der Hand. Die anderen 3 laufen zu"
    PRINT "dir r�ber und halten dich fest."
    COLOR 3
    PRINT
    PRINT "K�nig: Wir sind das, was ihr als die Sekte des Tultron bezeichnet."
    PRINT "Nat�rlich hat es nie einen Tultron gegeben."
    PRINT "Wir f�nf... ach nein, jetzt wir nur noch vier..."
    PRINT "Der f�nfte weiht ja nicht mehr unter uns...   "
    INPUT "Wir vier sind die wahren Anf�hrer der Sekte.", asdf$
    PRINT
    PRINT "Du fragst dich sicher, warum noch kein Mensch die Sekte entlarven"
    PRINT "und vernichten konnte."
    PRINT "Ich sage dir warum, weil wir uns als Gilde der Magier tarnen."
    INPUT "Und nat�rlich kommt keiner auf die Idee die Magier zu verd�chtigen.", asdf$

    CLS
    PRINT "K�nig: Nun, "; name$; ", treuer Diener, ich danke dir."
    PRINT "Ohne dich h�tten wir das Gef�ngnis unseres Meister Yog Sothoth"
    PRINT "niemals gefunden."
    PRINT "Achja, und die Geschichte mit Cthulhu entspricht zwar der Wahrheit,"
    PRINT "aber kein Mensch hat versucht ihn aufzuwecken. Er schlummert immer"
    PRINT "noch vor sich hin, tief unter den Bergen des Wahnsinns, wie sie von"
    PRINT "Einigen genannt werden."
    PRINT
    PRINT "Du "; name$; " wirst nun die Ehre haben das erste Opfer"
    INPUT "f�r Yog Sothoth zu werden.", asdf$

    CLS
    COLOR 7
    PRINT "Der K�nig geht auf die versiegelte T�r des Pentagon zu"
    PRINT "sagt einige Spr�che auf und das Pentagon f�llt in sich "
    INPUT "zusammen.", asdf$
    PRINT
    COLOR 3
    PRINT "K�nig: Yog Sothoth, du bist jetzt frei."
    PRINT "Nimm dein erstes Opfer in Empfang."
    PRINT
    COLOR 7
    PRINT "Aus den Ruinen des Pentagon kommt ein schwacher Luftwirbel."
    PRINT "Als der Windhauch dich ber�hrt, f�hlst du K�lte in dir aufsteigen."
    INPUT "Deine Augen fallen zu und du stirbst im n�chsten Moment.", asdf$
    dead = 1
       
END SUB

SUB Berge

    position = 0
    11 CLS
    COLOR 3
    location = 11

    PRINT "Ort: ": LOCATE 1, 6: COLOR 10: PRINT "Berge": COLOR 3
    LOCATE 1, 31: PRINT "Position: ": COLOR 10: LOCATE 1, 40: PRINT position: COLOR 3
    LOCATE 1, 45: PRINT "Item: ": LOCATE 1, 51: COLOR 10: PRINT item$: COLOR 3

    LOCATE 3, 1
    PRINT "Nach einem kurzen Aufstieg befindest du dich auf einer kleinen Ebene in den"
    PRINT "Bergen, die von hohen Steilw�nden umgeben ist. �ber der Steilwand am Ende"
    PRINT "des Weges ist ein Plateau zu erkennen."

    LOCATE 8, 1: COLOR 7
    PRINT "1. Umsehen"
    PRINT "2. Ansprechen"
    PRINT "3. Gegenstand benutzen"
    PRINT "4. zum Ende des Weges gehen (1)"
    PRINT "5. gehe raus (in die Steppe)"

    LOCATE 15, 1: COLOR 3: PRINT "Deine Aktion: "
    DO
        LOCATE 15, 15: COLOR 7: PRINT "           "
        LOCATE 15, 15: COLOR 7: INPUT "", action
    LOOP UNTIL action > 0 AND action < 6
    COLOR 3

    IF position = 0 THEN
        IF action < 4 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 11
        END IF
    END IF

    IF position = 1 THEN
        IF action = 2 OR action = 3 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 11
        END IF
        IF action = 1 THEN
            COLOR 7
            CLS
            PRINT "�ber dir kannst du ein Plateau erkennen."
            INPUT "Aber ohne richtige Ausr�stung kommst du hier nicht hoch.", asdf$
            GOTO 11
        END IF
    END IF

    IF action = 4 THEN
        position = 1
        GOTO 11
    END IF

    IF action = 5 THEN gehehin = 10

END SUB

SUB Credits

    CLS
    COLOR 7
    DelaySub
    LOCATE 12, 37
    PRINT "Credits"
    COLOR 15
    DelaySub
    LOCATE 12, 37
    PRINT "Credits"
    COLOR 15
    DelaySub

    CLS
    COLOR 11
    PRINT
    PRINT "                            The Legacy of Cthulhu";
    COLOR 12
    PRINT "                           presented by Ejso Simcha";

    DelaySub
    COLOR 3
    PRINT "                                  Programmer"
    COLOR 9
    PRINT "                                 Viktor Seib"

    DelaySub
    COLOR 3
    PRINT "                                  Producer"
    COLOR 9
    PRINT "                                 Viktor Seib"

    DelaySub
    COLOR 3
    PRINT "                                  Debugger"
    COLOR 9
    PRINT "                                 Viktor Seib"

    DelaySub
    COLOR 3
    PRINT "                          Release Version Beta Tester"
    COLOR 9
    PRINT "                                 Viktor Seib"

    DelaySub
    DelaySub

    CLS
    COLOR 11
    PRINT
    PRINT "                            The Legacy of Cthulhu";
    COLOR 12
    PRINT "                           presented by Ejso Simcha";
    LOCATE 6, 1
    COLOR 3
    PRINT "                             Pre-Release Beta Tester"
    COLOR 9
    PRINT "                                 Andre Steimers"
    PRINT "                                 Marius Hasske"
    PRINT "                                  Robert Seib"
    PRINT "                                 Thomas R�llig"
    PRINT "                                 Wladimir Krebs"

    DelaySub
    COLOR 3
    PRINT "                               Besonderen Dank an"
    COLOR 9
    PRINT "                                 Dirk J. Thomas"
    PRINT "                         f�r dein Beispiel der Kampfszene,"
    PRINT "                              das ich nachgebaut habe"
    PRINT
    PRINT "                                alle Beta Tester"
    PRINT "                                f�r eure Ausdauer"

    LOCATE 20, 1
    DelaySub
    DelaySub
    LOCATE 1, 1
    DelaySub
    DelaySub

    CLS
    COLOR 11
    PRINT
    PRINT "                            The Legacy of Cthulhu";
    COLOR 12
    PRINT "                           presented by Ejso Simcha";
    COLOR 9
    PRINT
    PRINT
    PRINT "                         Release Version 1.0 (v. 0.43)"
    PRINT
    PRINT "                                 programmiert"
    PRINT "                  vom 24. Dezember 2001 bis zum 1. Juli 2002"
    PRINT
    PRINT "                                   released"
    PRINT "                                 5. Juli 2002"
    PRINT
    PRINT "          'Vega' steht im Titelbild stellvertretend f�r 'Viktor Seib'"

    LOCATE 20
    COLOR 12
    INPUT "                                       ENDE", asdf$
    IF asdf$ = "5" THEN asdf = 15
    COLOR 0, asdf
    PRINT
    PRINT "                       Das Universall-Passwort lautet: wisitla                "
    COLOR 7, 0
    END
END SUB

SUB DelaySub

    PRINT
    PRINT

    FOR i = 1 TO 25000
        FOR ii = 1 TO 10
        NEXT ii
    NEXT i

END SUB

SUB Finale

    CLS

    COLOR 7
    PRINT "Kaum bist du durch die T�r gegangen, f�llt die Wand hinter"
    PRINT "dir zu. Es bleibt nur der Weg nach vorne."
    PRINT
    PRINT "Du gehst einen l�ngeren Weg geradeaus. Die H�hle ist nicht"
    INPUT "beleuchtet und so musst du dich langsam vorantasten.", asdf$

    CLS
    PRINT "Nach einigen Minuten kommst du in einen Raum, in dem auf einmal"
    PRINT "Fackeln angehen."
    PRINT "Du siehst dich um und findest einen Bogen mit Pfeilen, den du"
    INPUT "mitnimmst.", asdf$

    CLS
    PRINT "Au�erdem sieht du vor dir einen mit Fackeln beleuchteten Weg,"
    PRINT "der noch tiefer in den Berg hineinf�hrt."
    PRINT "Da das der einzig m�gliche Weg ist, folgst du ihm."
    PRINT
    PRINT "Bald darauf befindest du dich in einem riesigen Raum."
    PRINT
    PRINT "Auf einmal taucht vor dir ein 3 Meter gro�er Drache auf."
    PRINT "Hinter ihm kannst du ein Pentagon erkennen, das scheinbar"
    INPUT "als Gef�ngnis dient.", asdf$

    DO
        CLS: COLOR 3
        PRINT "Drache: Mein Name ist Smej und ich befehle dir stehenzubleiben!"

        LOCATE 5, 1: COLOR 7
        PRINT "W�hle was du sagst:"
        PRINT
        PRINT "1: Ich bin im Auftrag des K�nigs unterwegs. Meine Mission ist sehr"
        PRINT "   wichtig, also lass mich vorbei!"
        PRINT
        PRINT "2: Geh mir aus dem Weg du Objekt des B�sen!"
        PRINT
        PRINT
        INPUT "Deine Wahl: ", wahl$
    LOOP UNTIL wahl$ = "1" OR wahl$ = "2"

    IF wahl$ = "2" THEN GOTO 2351000

    DO
        CLS: COLOR 3
        PRINT "Smej: Im Auftrag eines K�nigs?"
        PRINT "Ich bin der W�chter des gefangenen Yog Sothoth, im Auftrag eines Gottes!"

        LOCATE 7, 1: COLOR 7
        PRINT "W�hle was du sagst:"
        PRINT
        PRINT "1: Und was f�r ein Gott soll das bitte sein?"
        PRINT
        PRINT "2: Der K�nig wurde f�r sein Amt von Gott auserw�hlt!"
        PRINT "   Ich handele auch im Auftrag Gottes!"
        PRINT
        PRINT
        INPUT "Deine Wahl: ", wahl$
    LOOP UNTIL wahl$ = "1" OR wahl$ = "2"

    IF wahl$ = "2" THEN GOTO 235100

    DO
        CLS: COLOR 3
        PRINT "Smej: Der allm�chtige Enki"

        LOCATE 5, 1: COLOR 7
        PRINT "W�hle was du sagst:"
        PRINT
        PRINT "1: Ich habe noch nie etwas �ber Enki geh�rt."
        PRINT "   Er muss ein unwichtiger Gott sein. Jetzt h�r auf meine Zeit"
        PRINT "   zu verschwenden und geh mir aus dem Weg!"
        PRINT
        PRINT "2: Ok, lass mich meinen Auftrag erkl�ren, vielleicht l�sst du"
        PRINT "   mich dann vorbei."
        PRINT
        PRINT
        INPUT "Deine Wahl: ", wahl$
    LOOP UNTIL wahl$ = "1" OR wahl$ = "2"

    IF wahl$ = "1" THEN GOTO 235110
    IF wahl$ = "2" THEN
        CLS
        GOTO 235120
    END IF

    235100
    CLS: COLOR 3
    PRINT "Smej: Nein, der allm�chtige Enki w�hlt keine menschlichen"
    INPUT "K�nige! Aber lasse mich trotzdem deinen Auftrag vernehmen!", asdf$
    PRINT
    PRINT

    235120
    PRINT name$; ":  Die Sekte des Tultron hat es schon fast geschafft"
    PRINT "Cthulhu aufzuwecken! Der einzige Ausweg ist es, Yog Sothoth aus"
    PRINT "seinem Gef�ngnis zu befreien."
    PRINT "Er ist ein guter Gott und nur er kann Cthulhu aufhalten!"
    INPUT "Das ist mein Auftrag!", asdf$

    DO
        CLS: COLOR 3
        PRINT "Smej: Nein! Das ist eine L�ge!"
        PRINT "Yog Sothoth ist b�se und Cthulhu k�nnte er nicht aufhalten,"
        PRINT "selbst wenn er es wollte!"
        PRINT "Ich sage dir die Wahrheit: Yog Sothoth ist der Seelenfresser!"
        PRINT "Er kann nur in einem Pentagon gefangen gehalten werden."
        PRINT "Wenn du ihn freil�sst, frisst er die Seelen aller Menschen!"
        PRINT "Ich bin hier um das zu verhindern!"
        PRINT "Dein K�nig ist b�se! Er hat dich angelogen! Er ist dein Feind!"
        LOCATE 10, 1
        COLOR 7
        PRINT "W�hle was du sagst:"
        PRINT
        PRINT "1: Nein, der K�nig ist ein wahrer Freund! Ich bin schon seit Jahren"
        PRINT "   mit ihm befreundet und er hat mich noch nie entt�uscht!"
        PRINT "   Wieso sollte ich dir glauben? Tritt vor und lass uns k�mpfen!"
        PRINT "   Ich habe es eilig!"
        PRINT
        PRINT "2: Der K�nig hat keinen Grund mich anzul�gen. Wir sind schon seit"
        PRINT "   Jahren befreundet. Aber mein Gef�hl sagt mir, dass du Recht hast."
        PRINT
        INPUT "Deine Wahl: ", wahl$
    LOOP UNTIL wahl$ = "1" OR wahl$ = "2"

    IF wahl$ = "1" THEN GOTO 235150
    IF wahl$ = "2" THEN GOTO 235170


    2351000
    DO
        CLS: COLOR 3
        PRINT "Smej: Nein, mein Auftrag ist es Yog Sothoth zu bewachen."
        PRINT "Und das ist eine Mission des Guten. Und jetzt geh bitte"
        PRINT "wieder weg."

        LOCATE 6, 1: COLOR 7
        PRINT "W�hle was du sagst:"
        PRINT
        PRINT "1: Niemals! Es geht um meine Ehre und um die Rettung der"
        PRINT "   gesamten Welt!"
        PRINT
        PRINT "2: Das sehe ich ein. Ich gehe weg."
        PRINT
        PRINT
        INPUT "Deine Wahl: ", wahl$
    LOOP UNTIL wahl$ = "1" OR wahl$ = "2"

    IF wahl$ = "2" THEN GOTO 235160

    235110
    DO
        CLS: COLOR 3
        PRINT "Smej: Du l�sst mir keine Wahl!"
        PRINT "Entweder du gehst oder ich werde dich t�ten!"

        LOCATE 5, 1: COLOR 7
        PRINT "W�hle was du sagst:"
        PRINT
        PRINT "1: So sei es! Lass uns k�mpfen!"
        PRINT
        PRINT "2: Wer wird denn gleich Gewalt anwenden?"
        PRINT "   Ich gehe ja schon."
        PRINT
        PRINT
        INPUT "Deine Wahl: ", wahl$
    LOOP UNTIL wahl$ = "1" OR wahl$ = "2"

    IF wahl$ = "2" THEN GOTO 235160

    235150
    gehehin = 18
    EXIT SUB

    235160 CLS
    PRINT "Kaum hast du dich zum Weggehen umgedreht, betreten der K�nig,"
    PRINT "der Magier aus der Gilde, Arnaw und der Forscher, den du"
    INPUT "beim H�ndler gesehen hast, den Raum. Sie sind alle gleich gekleidet.", asdf$

    CLS
    COLOR 3
    PRINT "K�nig: "; name$; ", hilf uns diesen Drachen zu t�ten!"
    PRINT "Er ist es, der Yog Sothoth bewacht und uns daran hindert,"
    INPUT "ihn freizulassen.", asdf$
    PRINT
    PRINT "Smej: Ihr d�rft Yog Sothoth nicht freilassen, er wird alle Lebewesen"
    INPUT "auf der Erde vernichten indem er ihre Seelen frisst!", asdf$

    CLS
    COLOR 7
    PRINT "Auf einmal betritt Ruach den Raum."
    PRINT "Arnaw will nach seinem Schwert greifen, aber der K�nig h�lt ihn"
    PRINT "mit einer Geste zur�ck."
    INPUT "Ruach h�lt, deutlich sichtbar, Abstand zu den anderen vier.", asdf$

    CLS
    COLOR 3
    PRINT "Smej: Alle f�nf auf einmal hier versammelt! Nun kann ich euren dunklen"
    INPUT "Machenschaften ein Ende setzten, so wie es Enki befohlen hat!", asdf$
    PRINT
    PRINT name$; " zum K�nig: Ich verstehe nicht, was meint er damit?"
    INPUT "", asdf$
    PRINT "K�nig: Glaub ihm kein Wort, er ist ein Diener Cthulhu's und er will..."
    PRINT: COLOR 7
    PRINT "Ruach unterbricht ihn:"
    COLOR 3
    PRINT "Der Drache sagt die Wahrheit, "; name$; ". Wir f�nf sind die Anf�hrer"
    PRINT "der Sekte des Tultron, besser bekannt als die Gilde der Magier."
    PRINT "Als ich ihre Pl�ne durchschaut habe, bin ich aus der Gilde ausgetreten."
    PRINT "Sie sind n�mlich die Diener von Yog Sothoth. Sie wollten ihn befreien und"
    INPUT "mit Hilfe seiner Macht die Welt unterwerfen!", asdf$
    PRINT
    INPUT "K�nig: Schweig du elender Verr�ter!", asdf$

    CLS
    COLOR 7
    PRINT "Arnaw zieht sein Schwert und l�uft auf Ruach zu. Dieser holt seins"
    INPUT "und sie beginnen zu k�mpfen.", asdf$
    PRINT
    PRINT "Der K�nig versucht eine Zauberformel aufzusagen, um den Drachen zu"
    INPUT "t�ten. Die anderen beiden st�rzen sich auf dich und schlagen dich bewusstlos.", asdf$

    CLS
    PRINT "Als du wieder zu dir kommst, siehst du den toten Drachen auf dem Boden."
    INPUT "Daneben liegen die Leichen von Ruach und dem K�nig.", asdf$
    PRINT
    PRINT "Hinter dir h�rst du die Stimme von Arnaw:"
    COLOR 3
    PRINT "Yog Sothoth, nimm dein erstes Opfer entgegen!"
    COLOR 7
    INPUT "", asdf$
    PRINT "Noch bevor du dich umdrehen kannst, f�hlst du, wie ein schwacher"
    PRINT "Luftwirbel deinen K�rper ber�hrt."
    PRINT "Dir wird kalt und deine Augen fallen zu. Im n�chsten Augenblick stirbst du."
    INPUT "", asdf$
    dead = 1
    EXIT SUB

    235170 CLS
    PRINT "Du drehst dich um und siehst, wie Ruach den Raum betritt und"
    INPUT "auf dich zugeht.", asdf$

    CLS
    COLOR 3
    PRINT "Ruach: "; name$; ", warte!"
    PRINT
    PRINT "Bin ich froh, dass ich dich noch rechtzeitig erreicht habe."
    PRINT "Ich h�tte nicht gedacht, dass du so weit kommst und dass dich das"
    INPUT "Skelett in der H�hle nicht abschrecken w�rde.", asdf$

    CLS
    PRINT "Ruach: Ich muss dir etwas Wichtiges �ber den K�nig erz�hlen!"
    PRINT "Ich habe es gerade erst von den Menschen in der Stadt erfahren."
    PRINT "Sie haben sich versammelt um die Burg zu st�rmen. Ich wollte zuerst"
    PRINT "mitmachen, weil ich noch eine alte Rechnung mit dem K�nig zu begleichen habe."
    PRINT "Aber dann ist mir eingefallen, dass ich f�r dich ein Auge gebaut habe."
    INPUT "Deswegen bin ich schnell hierhin geeilt.", asdf$

    CLS
    PRINT "Ruach: Ich habe vor Jahren meine Ausbildung in der Gilde der Magier"
    PRINT "abgebrochen."
    PRINT "Der Grund daf�r war, dass es Magier in den h�chsten Positionen gab, die"
    PRINT "eigensinnige Ziele verfolgten, aber das wusste ich am Anfang noch nicht."
    PRINT "Obwohl ich erst in der Ausbildung war, wurde ich in den Rat der 5 h�chsten"
    PRINT "Magier aufgenommen. Scheinbar habe ich sie mit meinen F�higkeiten"
    PRINT "beeindruckt."
    PRINT "Aber in dieser hohen Position erhielt ich Einblicke in die geheimen Pl�ne der"
    PRINT "Gilde. Ich habe bei den Versammlungen Einspruch erhoben, wurde aber immer"
    PRINT "wieder �berstimmt. Die anderen 4 fingen an zu bedauern, dass sie mich in den"
    PRINT "Rat der 5 aufgenommen haben und wollten mich wieder loswerden. Und da das ein"
    PRINT "Amt auf Lebenszeit ist, haben sie versucht mich umzubringen."
    PRINT "So etwas habe ich aber geahnt und war vorbereitet. Als es dann so weit war,"
    PRINT "konnte ich mich verteidigen und fliehen. Dabei habe ich aber einen von ihnen"
    INPUT "schwer verletzt. Dieser ist dann wenig sp�ter gestorben.", asdf$

    CLS
    PRINT "Ruach: Heute habe ich erfahren, dass der K�nig sein Nachfolger war."
    PRINT "Und erst dann wurde mir eine Sache klar, auf die ich schon fr�her"
    PRINT "h�tte kommen sollen: Die Gilde der Magier und die Sekte des Tultron"
    PRINT "ist ein und die selbe Organisation."
    PRINT "Aber beides, sowohl die Sekte als auch die Gilde sind Tarnungen."
    PRINT "In Wirklichkeit sind die 4 �brigen Mitglieder des Rates die Anbeter des"
    PRINT "Yog Sothoth, des Seelenfressers. Sie Opfern ihm Menschenseelen und"
    INPUT "er verhilft ihnen zur Unsterblichkeit und gro�er Macht.", asdf$

    CLS
    PRINT "Ruach: Aber Yog Sothoth wurden vor langer Zeit eingesperrt und bis vor"
    PRINT "Kurzem wussten die 4 nicht, wo er ist. Aber als sie es dann erfahren"
    PRINT "haben, mussten sie sich beeilen. Denn Yog Sothoth l�sst sich nur in 1"
    PRINT "von 10 Jahren b�ndigen. Und in 2 Tagen w�re es schon zu sp�t."
    PRINT "Wenn Yog Sothoth nach dieser Zeit freikommt und man versuch ihn zu b�ndigen,"
    PRINT "ruft er alle seine dunklen Kr�fte zusammen und dann kann es passieren, dass"
    PRINT "er Cthulhu aufweckt. Cthulhu ist der dunkelste aller G�tter, ihn kann keiner"
    INPUT "aufhalten. Wenn er aufwacht, w�re das das Ende der Welt.", asdf$

    CLS
    PRINT "Ruach: Ich, als das 5 Mitglied des Rates, werde versuchen das zu verhindern."
    PRINT "Wirst du mir dabei helfen?"
    PRINT
    PRINT name$; ": Ja, du hast wahrscheinlich Recht. Ich werde dir helfen!"
    INPUT "", asdf$
    PRINT "Ruach: Das ist eine gute Entscheidung."
    PRINT
    PRINT "Smej: Du sprichst weise Worte, Fremder. Enki sagt ich soll euch helfen."
    PRINT "Aber ich darf selber nichts unternehmen, ihr m�sst das tun was ich euch sage."
    PRINT "Die beste L�sung w�re es den H�hleneingang zum Einsturz zu bringen. Ihr"
    PRINT "beiden k�nnt den zweiten Ausgang benutzen. Er ist sehr eng aber er f�hrt"
    PRINT "ebenfalls nach drau�en."
    PRINT
    PRINT name$; ": Sag uns was wir machen sollen."
    INPUT "", asdf$

    CLS
    PRINT "Smej: Dreht euch um. Seht ihr die zwei S�ulen da?"
    PRINT "In jeder S�ule sind drei goldene Steine in unterschiedlichen H�hen."
    PRINT "Dr�ckt bei beiden S�ulen gleichzeitig den obersten dann den mittleren"
    PRINT "und schlie�lich den untersten Stein in die S�ule rein."
    PRINT "Achtet darauf, dass ihr es gleichzeitig macht, sonst wird nichts"
    PRINT "passieren."
    PRINT
    INPUT "Ruach: Alles klar.", asdf$

    CLS: COLOR 7
    PRINT "Ruach geht zu einer der S�ulen. Du gehst zur anderen."
    PRINT "Ihr dr�ckt gleichzeitig die Steine in die S�ulen rein."
    PRINT "Als ihr beim letzten Stein angekommen seid, h�rt ihr Stimmen"
    PRINT "und Schritte, die vom Eingang her schnell auf euch zukommen."
    PRINT "Der H�hleneingang beginnt zu beben und die Decke st�rzt ein."
    PRINT "Noch bevor die H�hle komplett eingest�rzt ist, betritt der K�nig"
    INPUT "den Raum. Die anderen drei werden unter Tr�mmern begraben.", asdf$
    COLOR 3
    PRINT
    PRINT "K�nig zu dir: Du Verr�ter! Daf�r wirst du sterben!"
    COLOR 7
    PRINT
    PRINT "Er zieht sein Schwert und l�uft auf dich zu."
    INPUT "Ruach zieht ebenfalls sein Schwert und stellt sich dem K�nig in den Weg.", asdf$

    CLS: COLOR 3
    PRINT "Ruach: Du kannst deinem Schicksal nicht entkommen, Huzpaa!"
    PRINT
    PRINT "K�nig: Schweig! Wage es nicht noch einmal diesen Namen auszusprechen!"
    PRINT
    PRINT "Ruach: Heute wird die Rache mein sein! Ich habe schon seit Jahren darauf"
    PRINT "gewartet! Du wirst bedauern, es damals nicht zu Ende gebracht zu haben!"
    PRINT
    PRINT "K�nig: Niemals wirst du �ber mich triumphieren!"
    COLOR 7
    PRINT
    PRINT "Der K�nig st�rzt sich mit seinem Schwert auf Ruach. Ein wilder"
    PRINT "Schwertkampf beginnt. Als du Ruach helfen willst, sagt er dir,"
    PRINT "dass du dich da raushalten sollst."
    PRINT
    INPUT "Du h�lst dich zur�ck und gehst zu Smej.", asdf$

    CLS
    PRINT "Nach einigen Minuten f�llt der K�nig tot zu Boden."
    PRINT "Ruach geht, schwer verletzt, zu dir und Smej."
    COLOR 3
    PRINT
    PRINT "Ruach (spricht sehr schwach und leise): Nach so vielen Jahren..."
    PRINT "Die Rache... Sie war mein!"
    COLOR 7
    PRINT
    PRINT "Er f�llt vor Schw�che auf den Boden und stirbt wenig sp�ter an"
    INPUT "seinen Verletzungen.", asdf$

    CLS
    PRINT "Nach einiger Zeit, in der du Ruach begraben hast, zeigt dir Smej"
    PRINT "den anderen Ausgang aus der H�hle und sagt dir, dass du den Zugang"
    INPUT "versperren sollst, wenn du drau�en bist.", asdf$

    CLS
    PRINT "Du verabschiedest dich von ihm und gehst den engen Gang hinauf, der"
    PRINT "aus der H�hle f�hrt."
    INPUT "", asdf$
    PRINT "Nach einiger Zeit ist der Gang so eng, dass du auf dem Boden kriechen"
    PRINT "musst, um weiterzukommen."
    INPUT "", asdf$

    CLS
    PRINT "Schlie�lich erreichst du den Ausgang. Du befindest dich oben in den"
    PRINT "Bergen auf einem Plateau."
    PRINT "Von hier hast du eine sehr gute Aussicht."
    INPUT "Du siehst, dass das Schloss in Flammen steht.", asdf$

    CLS
    COLOR 14
    INPUT "Im Westen geht die Sonne unter.", asdf$
    gehehin = 19
    EXIT SUB

END SUB

SUB FischerHaus

    position = 0
    14 CLS
    COLOR 3
    location = 14

    PRINT "Ort: ": LOCATE 1, 6: COLOR 10: PRINT "Haus des Fischers": COLOR 3
    LOCATE 1, 31: PRINT "Position: ": COLOR 10: LOCATE 1, 40: PRINT position: COLOR 3
    LOCATE 1, 45: PRINT "Item: ": LOCATE 1, 51: COLOR 10: PRINT item$: COLOR 3

    LOCATE 3, 1
    PRINT "Im Haus des Fischers liegen �berall Angelsachen herum. An den W�nden befinden"
    PRINT "sich zahlreiche Troph�en. Der Fischer sitzt an seinem Tisch und ist mit"
    PRINT "irgendetwas besch�ftigt."

    LOCATE 8, 1: COLOR 7
    PRINT "1. Umsehen"
    PRINT "2. Ansprechen"
    PRINT "3. Gegenstand benutzen"
    PRINT "4. zum Fischer gehen (1)"
    PRINT "5. gehe raus (zur K�ste)"

    LOCATE 15, 1: COLOR 3: PRINT "Deine Aktion: "
    DO
        LOCATE 15, 15: COLOR 7: PRINT "           "
        LOCATE 15, 15: COLOR 7: INPUT "", action
    LOOP UNTIL action > 0 AND action < 6
    COLOR 3

    IF position = 0 THEN
        IF action < 4 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 14
        END IF
    END IF

    IF position = 1 THEN
        IF action = 1 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 14
        END IF
        IF action = 2 THEN
            IF ilikefish = 0 THEN
                CLS
                PRINT "Fischer: Hallo, mein Name ist Dag."
                PRINT
                PRINT "Ich habe mir vorgenommen, in den n�chsten 2 Wochen mal Urlaub zu"
                PRINT "machen und nicht mehr zu fischen. Au�erdem muss ich meine Unterlagen"
                PRINT "in Ordnung bringen. Du wei�t schon, wegen den Steuern an den K�nig,"
                INPUT "die bald wieder f�llig sind.", asdf$
                GOTO 14
            END IF
            IF ilikefish = 1 THEN
                IF item$ = "Dose mit W�rmern" THEN GOTO 14141
                CLS
                PRINT "Dag: Hallo."
                PRINT
                PRINT "Was sagst du?"
                PRINT "Du m�chtest, dass ich einen Fisch f�r dich fange?"
                PRINT "Du wei�t ja, dass ich Urlaub habe. Aber was soll's."
                PRINT "Nur gibt es da ein kleines Problem, meine beste Angel ist"
                PRINT "kaputt. Und die anderen habe ich zur Zeit verliehen, weil"
                PRINT "ich ja sowieso Urlaub habe. Au�erdem habe ich keine K�der"
                INPUT "mehr.", asdf$
                CLS
                PRINT "Dag: Ich mache dir einen Vorschlag:"
                PRINT "Ich werde jetzt versuchen meine Angel zu reparieren und in"
                PRINT "der Zwischenzeit versuchst du ein paar K�der aufzutreiben."
                PRINT "Das sollte ja keine all zu schwere Aufgabe sein, daf�r musst"
                INPUT "du ja nur kurz vor die T�r gehen.", asdf$
                PRINT
                COLOR 7
                INPUT "Dag gibt dir eine Dose f�r die K�der.", asdf$
                item$ = "Dose"
                ilikefish = 2
                GOTO 14
            END IF
            IF ilikefish = 2 THEN
                14141 CLS
                PRINT "Dag: Hast du die K�der schon gefunden?"
                INPUT "Normal m�ssten bei mir im Garten welche sein.", asdf$
                GOTO 14
            END IF
            IF ilikefish = 3 THEN
                CLS
                PRINT "Dag: Du hast die Angel noch nicht repariert?"
                INPUT "Schade...", asdf$
                GOTO 14
            END IF
            IF ilikefish = 4 THEN
                CLS
                INPUT "Dag: Ich hoffe der Fisch entsprach deinen Erwartungen!", asdf$
                GOTO 14
            END IF
        END IF
        IF action = 3 THEN
            IF item$ = "Dose mit W�rmern" THEN
                CLS
                PRINT "Dag: Wunderbar, die K�der h�tten wir schon mal."
                PRINT "Aber ich konnte die Angel leider nicht reparieren."
                PRINT "Wenn ich mich nicht irre, kommst du aus der Stadt."
                PRINT "Vielleicht kann dort jemand die Angel reparieren?"
                INPUT "Ich gebe sie dir mal mit.", asdf$
                item$ = "kaputte Angel"
                ilikefish = 3
                GOTO 14
            END IF
            IF item$ = "Angel" THEN
                CLS
                ilikefish = 4
                PRINT "Dag: Oh, die Angel ist wieder ganz!"
                PRINT "Danke dir!"
                PRINT "Ich gehe jetzt schnell raus und besorge dir einen sch�nen,"
                INPUT "gro�en Fisch!", asdf$
                COLOR 7
                PRINT
                PRINT "Dag geht raus zum Fischen."
                       
                DO
                    LOCATE 9, 5
                    PRINT TIME$
                    IF TIME$ > now$ THEN warte = warte + 1
                    now$ = TIME$
                LOOP UNTIL warte = 6
                       
                LOCATE 11, 1
                COLOR 3
                LOCATE 9
                PRINT "Dag: So, hier ist der Fisch!"
                INPUT "Nochmals danke daf�r, dass du meine Angel repariert hast.", asdf$
                COLOR 7
                PRINT
                INPUT "Dag gibt dir den Fisch.", asdf$
                item$ = "Fisch"
                GOTO 14
            ELSE INPUT "Diese Aktion zeigt keine Wirkung", asdf$
                GOTO 14
            END IF
        END IF
    END IF

    IF action = 4 THEN
        position = 1
        GOTO 14
    END IF

    IF action = 5 THEN gehehin = 9

END SUB

SUB HaendlerHaus

    position = 0
    12 CLS
    COLOR 3
    location = 12

    PRINT "Ort: ": LOCATE 1, 6: COLOR 10: PRINT "Haus des H�ndlers": COLOR 3
    LOCATE 1, 31: PRINT "Position: ": COLOR 10: LOCATE 1, 40: PRINT position: COLOR 3
    LOCATE 1, 45: PRINT "Item: ": LOCATE 1, 51: COLOR 10: PRINT item$: COLOR 3

    LOCATE 3, 1
    PRINT "Das Haus des H�ndlers ist sehr gem�tlich eingerichtet. An den W�nden"
    PRINT "h�ngt lauter Kram aus fernen L�ndern."
    PRINT "Der H�ndler hat gerade Besuch von einem Forscher von der Insel Napi,"
    PRINT "im Norden des Landes."

    LOCATE 8, 1: COLOR 7
    PRINT "1. Umsehen"
    PRINT "2. Ansprechen"
    PRINT "3. Gegenstand benutzen"
    PRINT "4. zum H�ndler gehen (1)"
    PRINT "5. zum Forscher gehen (2)"
    PRINT "6. gehe raus (in die Stadt)"

    LOCATE 15, 1: COLOR 3: PRINT "Deine Aktion: "
    DO
        LOCATE 15, 15: COLOR 7: PRINT "           "
        LOCATE 15, 15: COLOR 7: INPUT "", action
    LOOP UNTIL action > 0 AND action < 7

    COLOR 3
    IF position = 0 THEN
        IF action < 4 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 12
        END IF
    END IF

    IF action = 4 THEN
        position = 1
        GOTO 12
    END IF

    IF action = 5 THEN
        position = 2
        GOTO 12
    END IF

    IF action = 6 THEN GOTO 120


    IF position = 1 THEN
        IF action = 1 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 12
        END IF
        IF action = 2 THEN
            IF kompassschonzurueck = 0 THEN
                CLS
                PRINT "H�ndler: Hallo "; name$; "!"
                LOCATE 3, 1: PRINT "Ich wei�, du bist sehr besch�ftigt, aber kannst du mir einen Gefallen tun?"
                PRINT "Wenn du das n�chste Mal im Wald bist, kannst du bitte nachsehen, ob da"
                PRINT "irgendwo mein Kompass rumliegt? Ich habe den n�mlich vor ein paar"
                INPUT "Monaten da verloren.", asdf$
                GOTO 12
            END IF
            IF kompassschonzurueck = 1 THEN
                CLS
                PRINT "H�ndler: Hallo "; name$; "!"
                LOCATE 3, 1: PRINT "Danke daf�r, dass du meinen Kompass wiedergefunden hast."
                PRINT "Ich wusste doch, dass man sich immer auf dich verlassen kann."
                INPUT "", asdf$
                GOTO 12
            END IF
        END IF
        IF action = 3 THEN
            IF item$ = "Kompass" THEN
                kompassschonzurueck = 1
                CLS
                PRINT "H�ndler: Das ist ja..."
                PRINT "...mein Kompass!"
                PRINT "Vielen Dank! Lass mal sehen, was ich hier habe..."
                PRINT "Ich hoffe du kannst damit etwas anfangen."
                LOCATE 6, 1: COLOR 7
                INPUT "Der H�ndler gibt dir eine Brille.", asdf$
                1212 CLS
                PRINT "Das aktuelle Passwort lautet: 25481 bzw. Klavkalasch"
                PRINT
                PRINT "weiter mit 2"
                INPUT "", asdf$
                IF asdf$ <> "2" THEN GOTO 1212
                item$ = "Brille"
                COLOR 3: GOTO 12
            END IF
            IF item$ = "Gutschein" THEN
                CLS
                PRINT "H�ndler: Ein Gutschein, so, so..."
                INPUT "Dann lass mal sehen...", asdf$
                LOCATE 4, 1: PRINT "Tut mir leid, aber dieser Gutschein ist schon vor 4 Monaten"
                PRINT "abgelaufen."
                PRINT "Aber Ok, du hast schon so viel f�r mich getan, da kann ich ruhig"
                PRINT "eine Ausnahme machen."
                PRINT "Das ist ein Gutschein f�r Gartenwerkzeug. Zur Zeit ist das Beste,"
                PRINT "was ich dir geben kann, diese Schaufel."
                INPUT "Ich hoffe sie n�tzt dir.", asdf$
                LOCATE 12, 1: COLOR 7
                INPUT "Der H�ndler gibt dir eine Schaufel.", asdf$
                item$ = "Schaufel"
                GOTO 12
            ELSE
                INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
                GOTO 12
            END IF
        END IF
    END IF

    IF position = 2 THEN
        IF action <> 2 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 12
        END IF
        IF action = 2 THEN
            CLS
            PRINT "Forscher: Ich habe eine neue Entdeckung gemacht!"
            PRINT "Ich habe herausgefunden, dass es noch Milliarden von anderen Planeten"
            PRINT "und Galaxien im Universum gibt! Wir sind Teil von etwas Gr��erem!"
            PRINT "Auch du wirst irgendwann erkennen, dass du Teil von etwas Gr��erem"
            PRINT "bist. Ich hoffe du wirst nicht negativ �berrascht sein."
            INPUT "", asdf$
            GOTO 12
        END IF
    END IF

    120 gehehin = 2

END SUB

SUB Hoehle

    position = 0
    16 CLS
    COLOR 3
    location = 16

    PRINT "Ort: ": LOCATE 1, 6: COLOR 10: PRINT "Gang im Wasserfall": COLOR 3
    LOCATE 1, 31: PRINT "Position: ": COLOR 10: LOCATE 1, 40: PRINT position: COLOR 3
    LOCATE 1, 45: PRINT "Item: ": LOCATE 1, 51: COLOR 10: PRINT item$: COLOR 3

    LOCATE 3, 1
    PRINT "Die H�hle hinter dem Wasserfall ist viel gr��er als du es zun�chst gedacht"
    PRINT "h�ttest. Am Ende der H�hle sind an einer Wand mehrere Schalter angebracht."
    PRINT "Gegen�ber von den Schaltern ist ein dreieckiges Loch in der Wand."
    PRINT "Etwa in der Mitte der H�hle liegt ein Skelett."

    LOCATE 8, 1: COLOR 7
    PRINT "1. Umsehen"
    PRINT "2. Ansprechen"
    PRINT "3. Gegenstand benutzen"
    PRINT "4. zum Skelett gehen (1)"
    PRINT "5. zum dreieckigen Loch gehen (2)"
    PRINT "6. zu den Schaltern gehen (3)"
    PRINT "7. gehe raus (in die Steppe)"
                                  
    LOCATE 16, 1: COLOR 3: PRINT "Deine Aktion: "
    DO
        LOCATE 16, 15: COLOR 7: PRINT "           "
        LOCATE 16, 15: COLOR 7: INPUT "", action
    LOOP UNTIL action > 0 AND action < 8
    COLOR 3

    IF position = 0 THEN
        IF action < 4 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 16
        END IF
    END IF

    IF position = 1 THEN
        IF action = 2 OR action = 3 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 16
        END IF
        IF action = 1 THEN
            CLS
            COLOR 7
            PRINT "Neben dem Skelett ist folgendes auf der Wand eingeritzt:"
            PRINT
            COLOR 3
            PRINT "  That is not dead which can eternal lie,"
            PRINT "  and with strange aeons even death may die."
            INPUT "", asdf$
            COLOR 7
            PRINT "Au�erdem f�llt dir auf, dass das Skelett k�nstlich ist, jemand"
            INPUT "muss es zur Abschreckung hier hingelegt haben.", asdf$
            GOTO 16
        END IF
    END IF

    IF position = 2 THEN
        IF action = 1 THEN
            CLS
            INPUT "Du siehst ein dreieckiges Loch.", asdf$
            GOTO 16
        END IF
        IF action = 2 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 16
        END IF
        IF action = 3 THEN
            IF item$ = "Auge des Ruach" THEN
                CLS
                COLOR 7
                PRINT "Du setzt das Auge des Ruach in das daf�r vorgesehene Loch."
                PRINT "Es beginnt auf die gegen�berliegende Wand mit den Schaltern"
                INPUT "zu strahlen.", asdf$
                item$ = "kein Gegenstand vorhanden"
                augeeingesetzt = 1
                GOTO 16
            ELSE
                INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
                GOTO 16
            END IF
        END IF
    END IF

    IF position = 3 THEN
        IF action = 2 OR action = 3 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 16
        END IF
        IF action = 1 THEN
            IF augeeingesetzt = 0 THEN
                CLS
                COLOR 7
                PRINT "Auf der Wand �ber den Schaltern siehst du folgendes:"
                PRINT
                COLOR 3
                PRINT "34tdna97xrn38gm47gn4zhjcwc0ah647mxg7rn4n07"
                PRINT "867n02v6n02e6�ft454ln76nmcgljokffcv2m78zm�"
                PRINT "dahltu4857439xm84rm�ao�hc58t74xmndueh4884d"
                PRINT "d�ka484paxghpg4gl9t4hgxreighr�et4mrgpxxhfd"
                PRINT "slkdgja48tghsuhglghp958zjnbsdusgilt840xgjf"
                PRINT
                PRINT "Dr�cke die roten Schalter um weiterzukommen:"
                INPUT "", asdf$
                IF asdf$ = "thekheleli" OR asdf$ = "wisitla" THEN
                    richtig = 1
                    GOTO 1600
                END IF
                INPUT "Das zeigt keine Wirkung.", asdf$
                GOTO 16
            END IF
            IF augeeingesetzt = 1 THEN
                CLS
                COLOR 7
                PRINT "Auf der Wand �ber den Schaltern siehst du folgendes:"
                PRINT
                COLOR 3
                PRINT "34"
                COLOR 4: LOCATE 3, 3
                PRINT "t"
                COLOR 3: LOCATE 3, 4
                PRINT "dna97xrn38gm47gn4zhjcwc0a"
                COLOR 4: LOCATE 3, 29
                PRINT "h"
                COLOR 3: LOCATE 3, 30
                PRINT "647mxg7rn4n07"
                       
                PRINT "867n02v6n02"
                COLOR 4: LOCATE 4, 12
                PRINT "e"
                COLOR 3: LOCATE 4, 13
                PRINT "6�ft454ln76nmcgljo"
                COLOR 4: LOCATE 4, 31
                PRINT "k"
                COLOR 3: LOCATE 4, 32
                PRINT "ffcv2m78zm�"
                       
                PRINT "da"
                COLOR 4: LOCATE 5, 3
                PRINT "h"
                COLOR 3: LOCATE 5, 4
                PRINT "ltu4857439xm84rm�ao�hc58t74xmndu"
                COLOR 4: LOCATE 5, 36
                PRINT "e"
                COLOR 3: LOCATE 5, 37
                PRINT "h4884d"
                       
                PRINT "d�ka484paxghpg4g"
                COLOR 4: LOCATE 6, 17
                PRINT "l"
                COLOR 3: LOCATE 6, 18
                PRINT "9t4hgxreighr�"
                COLOR 4: LOCATE 6, 31
                PRINT "e"
                COLOR 3: LOCATE 6, 32
                PRINT "t4mrgpxxhfd"
                       
                PRINT "s"
                COLOR 4: LOCATE 7, 2
                PRINT "l"
                COLOR 3: LOCATE 7, 3
                PRINT "kdgja48tghsuhglghp958zjnbsdusg"
                COLOR 4: LOCATE 7, 33
                PRINT "i"
                COLOR 3: LOCATE 7, 34
                PRINT "lt840xgjf"
                       
                PRINT
                PRINT "Dr�cke die richtigen Schalter um weiterzukommen:"
                INPUT "", asdf$
                IF asdf$ = "thekheleli" OR asdf$ = "wisitla" THEN
                    richtig = 1
                    GOTO 1600
                END IF
                INPUT "Das zeigt keine Wirkung.", asdf$
                GOTO 16
            END IF
        END IF
    END IF

    IF action = 4 THEN
        position = 1
        GOTO 16
    END IF

    IF action = 5 THEN
        position = 2
        GOTO 16
    END IF

    IF action = 6 THEN
        position = 3
        GOTO 16
    END IF

    IF action = 7 THEN gehehin = 10

    1600
    IF asdf$ = "wisitla" THEN augeeingesetzt = 1
    IF richtig = 1 THEN
        IF augeeingesetzt = 0 THEN
            CLS
            COLOR 7
            PRINT "Auf einmal geht die Wand vor dir auf."
            PRINT
            PRINT "Noch bevor du dich bewegen kannst, fliegt aus dem dreieckigen"
            PRINT "Loch hinter dir ein Giftpfeil und trifft dich am R�cken."
            PRINT "Vor Schmerz sinkst du auf den Boden."
            INPUT "Nach circa 10 Minuten bist du tot.", asdf$
            dead = 1
            GOTO 1700
        END IF
        IF augeeingesetzt = 1 THEN
            COLOR 7
            PRINT
            PRINT "Auf einmal geht die Wand vor dir auf."
            INPUT "Du gehst durch.", asdf$
            170 CLS
            PRINT "Das aktuelle Passwort lautet: 6935107 bzw. SkidooNow"
            PRINT
            PRINT "weiter mit 6"
            INPUT "", asdf$
            IF asdf$ <> "6" THEN GOTO 170
            gehehin = 17
        END IF
    END IF
    1700
END SUB

SUB Home

    position = 0
    1 CLS
    COLOR 3
    location = 1

    PRINT "Ort: ": LOCATE 1, 6: COLOR 10: PRINT "Dein Haus": COLOR 3
    LOCATE 1, 31: PRINT "Position: ": COLOR 10: LOCATE 1, 40: PRINT position: COLOR 3
    LOCATE 1, 45: PRINT "Item: ": LOCATE 1, 51: COLOR 10: PRINT item$: COLOR 3

    LOCATE 3, 1
    PRINT "Dein Haus ist �berdurchschnittlich gut ausgestattet, was du vor allem"
    PRINT "der Gro�z�gigkeit des K�nigs zu verdanken hast, der dich f�r erf�llte"
    PRINT "Auftr�ge reichhaltig belohnt.   "
    PRINT "Neben deinem Bett steht dein Arbeitstisch."

    LOCATE 8, 1: COLOR 7
    PRINT "1. Umsehen"
    PRINT "2. Ansprechen"
    PRINT "3. Gegenstand benutzen"
    PRINT "4. zum Arbeitstisch gehen (1)"
    PRINT "5. gehe raus (in die Stadt)"
    COLOR 12
    PRINT "6. Spiel beenden"

    LOCATE 15, 1: COLOR 3: PRINT "Deine Aktion: "
    DO
        LOCATE 15, 15: COLOR 7: PRINT "           "
        LOCATE 15, 15: COLOR 7: INPUT "", action
    LOOP UNTIL action > 0 AND action < 7

    IF action = 6 THEN
        PRINT: COLOR 12
        INPUT "Spiel beenden? (keine Eingabe = nein ; beliebige Eingabe = ja)", asdf$
        IF asdf$ = "" THEN GOTO 1 ELSE gehehin = 0
        EXIT SUB
    END IF

    IF action = 4 THEN
        position = 1
        GOTO 1
    END IF
        
    IF action = 5 THEN
        gehehin = 2
        EXIT SUB
    END IF

    IF position = 0 THEN
        COLOR 3
        INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
        COLOR 7
        GOTO 1
    END IF

    IF position = 1 THEN
        IF action = 1 THEN
            CLS
            COLOR 7
            PRINT "Auf dem Tisch liegt ein Brief, darin steht:"
            COLOR 3: LOCATE 4, 1
            PRINT "An "; name$; ", den ehrenvollen Diener des K�nigs."
            LOCATE 6, 1
            PRINT "Das K�nigreich ist in gro�er Not. Eine unvorstellbar"
            PRINT "dunkle Macht bedroht den Frieden unseres Landes und"
            PRINT "der gesamten Welt!"
            PRINT "Ich bitte dich, loyaler Freund, komm so schnell es"
            PRINT "dir m�glich ist zum Schloss, dort werde ich dir mehr"
            PRINT "erz�hlen. Es hier niederzuschreiben w�re viel zu gef�hrlich."
            LOCATE 13, 1
            PRINT "Wenn dich eine Wache fragt, wer du bist,"
            PRINT "sag du bist der Weltenretter."
            LOCATE 16, 1
            PRINT "Wir k�nnen niemandem mehr vertrauen!"
            LOCATE 18, 1: COLOR 7
            PRINT "Weiter unten auf der Seite befindet sich das k�nigliche Siegel."
            LOCATE 20, 1
            PRINT "Dir f�llt wieder ein, dass du den Brief sp�t in der Nacht"
            INPUT "von einem Boten des K�nigs erhalten hast.", asdf$
            GOTO 1
        ELSE: COLOR 3: INPUT "Diese Aktion zeigt keine Wirkung.", asdf$: COLOR 7: GOTO 1
        END IF
    END IF
END SUB

SUB Intro

    SCREEN 12

    12345 CLS
    COLOR 10
    LOCATE 2, 25: PRINT "    The Legacy of Cthulhu";
    LOCATE 3, 25: PRINT "    ---------------------"
    COLOR 12

    '////////////////////////////////////////////////////////////////////////////
    '    _____________________
    '   |Cthulhu Symbol Anfang|
    '    ---------------------

    la = 120 'L�nge der horizontalen Grundlinie
    x1 = 250 'x-Koordinate am Anfang der horizontalen Grundlinie
    x2 = x1 + la 'x-Koordinate am Ende der horizontalen Grundlinie
    y1 = 170 'y-Koordinate der horizontalen Grundlinie
    xm = x1 + (la / 2) 'Mitte der horizontalen Grundlinie
    xme = xm + (la / 4) 'x-Mitte-Ende: x-Koordinate bei 3 Viertel der Grundlinie
    xma = xm - (la / 4) 'x-Mitte-Anfang: x-Koordinate bei 1 Viertel der Grundlinie
    loopvar = 0 'Variable, die die Loops z�hlt

    'Grundlinie
    LINE (x1, y1)-(x2, y1) 'horizontale Grundlinie
    LINE (x1, y1)-(x1 + 5, y1 - 5) 'Pfeil am linken Ende (nach oben)
    LINE (x1, y1)-(x1 + 5, y1 + 5) 'Pfeil am linken Ende (nach unten)

    'schneidende Senkrechten
    LINE (xm, y1 - 10)-(xm, y1 + 5) 'in der Mitte der hor. Grundlinie
    LINE (x2, y1 - 7)-(x2, y1 + 7) 'am Ende...
    LINE (xme + 8, y1 - 10)-(xme + 8, y1 + 5) 'bei 3 Viertel... verschoben um x: +7
    LINE (xma - 7, y1 - 12)-(xma - 7, y1 + 7) 'bei 1 Viertel... verschoben um x: -7

    'unterhalb der Grundlinie
    LINE (xm - 5, y1 + 5)-(xm + 5, y1 + 5) 'hor. Linie in der Mitte
    LINE (xme + 3, y1 + 5)-(xme + 13, y1 + 5) 'hor. Linie bei 3 Viertel
    CIRCLE (xma - 7, y1 + 10), 3 'Kreis bei 1 Viertel


    'Schlangenlinie �ber der Grundlinie
    'Kreise werden von links nach rechts gez�hlt
       
    'Kreis 1 (unten)
    a = 160
    e = 360
    DO
        a1 = a * (3.14159 / 180) 'Anfang f�r den Kreisbogen
        e1 = e * (3.14159 / 180) 'Ende f�r den Kreisbogen
        CIRCLE (xma - 7, y1 - 19), 13, , a1, e1, 1.4 / 1.2
        a = 0
        e = 43
        loopvar = loopvar + 1 'Variable die die Loops z�hlt
    LOOP UNTIL loopvar = 2

    'Kreis 2 (oben)
    a = 0
    e = 215
    DO
        a1 = a * (3.14159 / 180) 'Anfang f�r den Kreisbogen
        e1 = e * (3.14159 / 180) 'Ende f�r den Kreisbogen
        CIRCLE (xma + 11, y1 - 40), 20, , a1, e1, 2 / 1.2
        a = 320
        e = 360
        loopvar = loopvar + 1 'Variable die die Loops z�hlt
    LOOP UNTIL loopvar = 4

    'Kreis 3 (unten)
    a = 140
    e = 360
    DO
        a1 = a * (3.14159 / 180) 'Anfang f�r den Kreisbogen
        e1 = e * (3.14159 / 180) 'Ende f�r den Kreisbogen
        CIRCLE (xm, y1 - 18), 13, , a1, e1
        a = 1
        e = 40
        loopvar = loopvar + 1 'Variable die die Loops z�hlt
    LOOP UNTIL loopvar = 6
       
    'Kreis 4 (oben)
    a = 0
    e = 220
    DO
        a1 = a * (3.14159 / 180) 'Anfang f�r den Kreisbogen
        e1 = e * (3.14159 / 180) 'Ende f�r den Kreisbogen
        CIRCLE (xme - 11, y1 - 40), 20, , a1, e1, 2 / 1.2
        a = 310
        e = 360
        loopvar = loopvar + 1 'Variable die die Loops z�hlt
    LOOP UNTIL loopvar = 8
        
    'Kreis 5 (unten)
    a = 150
    e = 360
    DO
        a1 = a * (3.14159 / 180) 'Anfang f�r den Kreisbogen
        e1 = e * (3.14159 / 180) 'Ende f�r den Kreisbogen
        CIRCLE (xme + 8, y1 - 18), 13, , a1, e1
        a = 0
        e = 35
        loopvar = loopvar + 1 'Variable die die Loops z�hlt
    LOOP UNTIL loopvar = 10

    'Kreis 6 (oben)
    a = 95
    e = 225
    a1 = a * (3.14159 / 180) 'Anfang f�r den Kreisbogen
    e1 = e * (3.14159 / 180) 'Ende f�r den Kreisbogen
    CIRCLE (x2 - 3, y1 - 40), 20, , a1, e1, 2 / 1.2


    'Schlangenlinie links von der horizontalen Grundlinie
    'Kreise werden von rechts nach links gez�hlt

    'Kreis 1
    a = 0
    e = 220
    DO
        a1 = a * (3.14159 / 180) 'Anfang f�r den Kreisbogen
        e1 = e * (3.14159 / 180) 'Ende f�r den Kreisbogen
        CIRCLE (x1 + 7, y1 - 31), 10, , a1, e1, 1.5 / 1.2
        a = 307
        e = 360
        loopvar = loopvar + 1 'Variable die die Loops z�hlt
    LOOP UNTIL loopvar = 12

    'Kreis 2
    a = 0
    e = 20
    DO
        a1 = a * (3.14159 / 180) 'Anfang f�r den Kreisbogen
        e1 = e * (3.14159 / 180) 'Ende f�r den Kreisbogen
        CIRCLE (x1 - 7, y1 - 22), 10, , a1, e1, 1.5 / 1.2
        a = 210
        e = 360
        loopvar = loopvar + 1 'Variable die die Loops z�hlt
    LOOP UNTIL loopvar = 14

    'Kreis 3
    a = 0
    e = 160
    DO
        a1 = a * (3.14159 / 180) 'Anfang f�r den Kreisbogen
        e1 = e * (3.14159 / 180) 'Ende f�r den Kreisbogen
        CIRCLE (x1 - 19, y1 - 21), 8, , a1, e1, 1.5 / 1.2
        a = 230
        e = 360
        loopvar = loopvar + 1 'Variable die die Loops z�hlt
    LOOP UNTIL loopvar = 16
        
    'Kreis 4 (kleiner Kreis, ganz au�en)
    a = 90
    e = 200
    a1 = a * (3.14159 / 180) 'Anfang f�r den Kreisbogen
    e1 = e * (3.14159 / 180) 'Ende f�r den Kreisbogen
    CIRCLE (x1 - 25, y1 - 13), 2, , a1, e1


    'Verzierungen oberhalb der Schlangenlinie

    'Zeichen 1
    LINE (x1 + 12, y1 - 40)-(x1 + 12, y1 - 60) 'vertikale Linie
    LINE (x1 + 9, y1 - 60)-(x1 + 15, y1 - 60) 'horizontale Linie

    LINE (x1 + 12, y1 - 40)-(x1 + 17, y1 - 50) 'diagoanle Linie
    CIRCLE (x1 + 19, y1 - 52), 2 'Kreis am Ende der Diagonalen
       
    'Zeichen 2
    LINE (xm - 10, y1 - 53)-(xm - 10, y1 - 68) 'vertikale Linie
    LINE (xm - 13, y1 - 68)-(xm - 7, y1 - 68) 'horizontale Linie

    LINE (xm - 10, y1 - 53)-(xm - 3, y1 - 61) 'diagoanle Linie
    CIRCLE (xm - 1, y1 - 61), 2 'Kreis am Ende der Diagonalen

    'Zeichen 3
    LINE (xme - 4, y1 - 56)-(xme - 4, y1 - 71) 'vertikale Linie
    LINE (xme - 7, y1 - 71)-(xme - 1, y1 - 71) 'horizontale Linie

    LINE (xme - 4, y1 - 56)-(xme + 3, y1 - 63) 'diagoanle Linie
    CIRCLE (xme + 5, y1 - 64), 2 'Kreis am Ende der Diagonalen

    'Zeichen 4
    LINE (x2 - 14, y1 - 51)-(x2 - 14, y1 - 59) 'vertikale Linie
    LINE (x2 - 17, y1 - 59)-(x2 - 11, y1 - 59) 'horizontale Linie

    CIRCLE (x2 - 22, y1 - 55), 2 'linker Kreis
    LINE (x2 - 20, y1 - 53)-(x2 - 14, y1 - 50) 'diagonale Linie
    CIRCLE (x2 - 2, y1 - 60), 2
    '    ___________________
    '   |Cthulhu Symbol Ende|
    '    -------------------
    '///////////////////////////////////////////////////////////////////////////

    COLOR 11
    LOCATE 16, 29: PRINT "1. Neues Spiel starten"
    LOCATE 17, 29: PRINT "2. Passwort eingeben"
    LOCATE 18, 29: PRINT "3. Spielanleitung"
    LOCATE 19, 29: PRINT "4. Beenden"

    COLOR 9
    'LOCATE 27, 30: PRINT "        by Vega"
    LOCATE 28, 28: PRINT "programmed by Vega, 2002"
    COLOR 11

    DO
        LOCATE 22, 33: PRINT "                                         "
        LOCATE 22, 33: INPUT "Deine Wahl: ", wahl
    LOOP UNTIL wahl = 1 OR wahl = 2 OR wahl = 3 OR wahl = 4

    IF wahl = 3 THEN
        Anleitung
        GOTO 12345
    END IF

    IF wahl = 4 THEN END

    IF wahl = 1 THEN
        CLS
        COLOR 3
        PRINT "Neues Spiel"
        PRINT
        PRINT
        PRINT "Geben Sie hier den Namen ein, mit dem Sie w�hrend des Spiels"
        INPUT "angesprochen werden m�chten: ", name$
        IF name$ = "" THEN name$ = "Callas"
        CLS
        PRINT "Es ist noch fr�h am Morgen."
        INPUT "Du wachst auf und verl�sst das Bett.", asdf$
        gehehin = 1
        EXIT SUB
    END IF

    IF wahl = 2 THEN Passwort

END SUB

SUB Kirche

    position = 0
    3 CLS
    COLOR 3
    location = 3

    PRINT "Ort: ": LOCATE 1, 6: COLOR 10: PRINT "Kirche": COLOR 3
    LOCATE 1, 31: PRINT "Position: ": COLOR 10: LOCATE 1, 40: PRINT position: COLOR 3
    LOCATE 1, 45: PRINT "Item: ": LOCATE 1, 51: COLOR 10: PRINT item$: COLOR 3

    IF keingottesdienst = 0 THEN GOTO 30

    LOCATE 3, 1
    PRINT "Die Kirche sieht innen etwas veraltet und br�chig aus."
    PRINT "Es ist fast kein Mensch mehr da. Nur eine Frau sitzt auf einer"
    PRINT "Bank. In einer Ecke neben dem Eingang hockt ein Verr�ckter."
    PRINT "Am Altar steht kein Mensch."

    LOCATE 8, 1: COLOR 7
    PRINT "1. Umsehen"
    PRINT "2. Ansprechen"
    PRINT "3. Gegenstand benutzen"
    PRINT "4. zur Frau gehen (1)"
    PRINT "5. zum Verr�ckten gehen (2)"
    PRINT "6. zum Altar gehen (3)"
    PRINT "7. gehe raus (in die Stadt)"

    LOCATE 17, 1: COLOR 3: PRINT "Deine Aktion: "
    DO
        LOCATE 17, 15: COLOR 7: PRINT "           "
        LOCATE 17, 15: COLOR 7: INPUT "", action
    LOOP UNTIL action > 0 AND action < 8
    COLOR 3

    IF action = 7 THEN GOTO 333

    IF position = 0 THEN
        IF action < 4 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 3
        END IF
    END IF

    IF action = 1 THEN
        IF position = 3 THEN
            LOCATE 19, 1
            INPUT "Am Altar ist, kaum sichtbar, das Wort 'Akhkharu' eingeritzt.", asdf$
        ELSE INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 3
        END IF
    END IF

    IF action = 2 THEN
        IF position = 1 THEN
            CLS
            PRINT "Frau: Hallo."
            LOCATE 3, 1
            PRINT "Ist das nicht eine schlimme Zeit, in der wir leben? Alles geht zu Grunde."
            PRINT "Fr�her gab es eine Pflanze, Alvara. Aus ihr konnte man allerlei Sachen"
            PRINT "machen. Jedesmal, wenn sie bl�hte stand ein s�sser Geruch in der Luft."
            PRINT "Diese Pflanze wurde schon vor Jahren von der Sekte des Tultron ausgerottet."
            PRINT "Aber manchmal glaube ich immer noch ihren Geruch in der Luft wahrnehmen "
            PRINT "zu k�nnen."
            INPUT "Wie heute Morgen, vor dem Gottesdienst.", asdf$
            GOTO 3
        END IF
        IF position = 2 THEN
            CLS
            COLOR 7: PRINT "Als du ihn ansprichst, hebt er langsam den Kopf."
            COLOR 3: LOCATE 3, 1
            PRINT "Verr�ckter: Aaahh..."
            LOCATE 5, 1
            PRINT "Verschwinde... hau ab..."
            PRINT "Du bist einer von ihnen..."
            PRINT "Ich sehe das ganz genau..."
            PRINT "Aber meine Seele werdet ihr nicht kriegen..."
            PRINT "Meine nicht..."
            INPUT "Hier in der Kirche seid ihr machtlos, ihr k�nnt mir nichts tun...", asdf$
            GOTO 3
        END IF
        IF position = 3 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 3
        END IF
    END IF

    IF action = 3 THEN INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
    IF action = 4 THEN position = 1
    IF action = 5 THEN position = 2
    IF action = 6 THEN position = 3

    GOTO 3

    30 keingottesdienst = 1

    LOCATE 3, 1: COLOR 7
    PRINT "Als du reinkommst, hat der Gottesdienst schon angefangen."
    PRINT "Es sind h�chstens 15 Leute anwesend."
    PRINT "Aber heute predigt ein ganz anderer Priester, den hast du noch nie zuvor"
    PRINT "gesehen. Das k�nnte aber auch daran liegen, dass du nie in die Kirche gehst."
    LOCATE 8, 1: COLOR 3
    PRINT "Priester: ...erst gestern wieder passiert. Und ich frage euch, wie lange"
    PRINT "kann das noch so weiter gehen? "
    PRINT "Steht im heiligen Buch etwa nicht geschrieben, dass wir fair handeln"
    PRINT "sollen? Das wir gerecht sein sollen und das wir niemandem Schaden"
    PRINT "zuf�hren sollen?"
    PRINT "Gilt das nicht f�r alle Menschen? Als wenn ihr es nicht w�stet sage"
    PRINT "ich euch: Ja, das gilt f�r alle Menschen!"
    PRINT "Und steht da nicht auch, dass wir uns f�r die Rechte anderer einsetzen"
    PRINT "sollen? Wie lange wollen wir und wie lange will der K�nig es noch dulden,"
    INPUT "dass Tultron mit seinen dunklen Machenschaften... ", asdf$

    CLS
    COLOR 7
    PRINT "Kaum ist der Name Tultrons gefallen, st�rmen mehrere maskierte M�nner"
    PRINT "auf den Prediger zu und zerren ihn gewaltsam weg."
    PRINT
    PRINT "Die ganze Sache wird dir ungem�tlich, zumal du immer versuchst dich"
    PRINT "aus politischen Auseinandersetzungen rauszuhalten. "
    PRINT
    INPUT "Du, sowie die meisten anderen, verl�sst die Kirche", asdf$

    333 gehehin = 2

END SUB

SUB Kueste

    position = 0
    9 CLS
    COLOR 3
    location = 9

    PRINT "Ort: ": LOCATE 1, 6: COLOR 10: PRINT "K�ste": COLOR 3
    LOCATE 1, 31: PRINT "Position: ": COLOR 10: LOCATE 1, 40: PRINT position: COLOR 3
    LOCATE 1, 45: PRINT "Item: ": LOCATE 1, 51: COLOR 10: PRINT item$: COLOR 3

    LOCATE 3, 1
    PRINT "Vor dir siehst du das Meer. Im Nordosten am Horizont ist eine Inselgruppe zu"
    PRINT "erkennen. Links von dir befindet sich das Haus des Fischers und sein kleiner"
    PRINT "Garten. Rechts von dir m�ndet der Fluss ins Meer. Vom Meer her weht ein star-"
    PRINT "ker und frischer Wind."

    LOCATE 8, 1: COLOR 7
    PRINT "1. Umsehen"
    PRINT "2. Ansprechen"
    PRINT "3. Gegenstand benutzen"
    PRINT "4. zur M�ndung des Flusses gehen (1)"
    PRINT "5. in den Garten des Fischers gehen (2)"
    PRINT "6. gehe zum Haus des Fischers"
    PRINT "7. gehe raus (in die Steppe)"

    LOCATE 16, 1: COLOR 3: PRINT "Deine Aktion: "
    DO
        LOCATE 16, 15: COLOR 7: PRINT "           "
        LOCATE 16, 15: COLOR 7: INPUT "", action
    LOOP UNTIL action > 0 AND action < 8
    COLOR 3

    IF position = 0 THEN
        IF action < 4 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 9
        END IF
    END IF

    IF position = 1 THEN
        IF action = 1 THEN
            CLS
            INPUT "Du siehst die M�ndung des Flusses.", asdf$
            GOTO 9
        END IF
        IF action = 2 OR action = 3 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 9
        END IF
    END IF

    IF position = 2 THEN
        IF action = 1 THEN
            LOCATE 18, 1
            COLOR 7
            CLS
            INPUT "Auf der Erde siehst du W�rmer herumkriechen.", asdf$
            GOTO 9
        END IF
        IF action = 2 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 9
        END IF
        IF action = 3 THEN
            IF item$ = "Dose" THEN
                CLS
                COLOR 7
                INPUT "Mit Hilfe der Dose sammelst du ein paar W�rmer ein.", asdf$
                item$ = "Dose mit W�rmern"
                99 CLS
                PRINT "Das aktuelle Passwort lautet: 4407235 bzw. TomatorRulez"
                PRINT
                PRINT "weiter mit 4"
                INPUT "", asdf$
                IF asdf$ = "4" THEN GOTO 9 ELSE GOTO 99
            ELSE INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
                GOTO 9
            END IF
        END IF
    END IF

    IF action = 4 THEN
        position = 1
        GOTO 9
    END IF

    IF action = 5 THEN
        position = 2
        GOTO 9
    END IF

    IF action = 6 THEN gehehin = 14
    IF action = 7 THEN gehehin = 6

END SUB

SUB Limits

    'entwickelt vom 24.12.2001 bis ...
    '
    '
    'Die Variablen, die f�r das Cthulhu Symbol am Anfang notwendig sind,
    'sowie die Variablen der Sub-Start finden sich hier nicht.
    'Alle �brigen Variablen, die im Spiel verwendet werden sind hier aufgef�hrt:
    '
    '    "+" bedeutet, dass die Variable f�r Passw�rter wichtig ist
    '
    '       "name$" vom Spieler definierter Name zur Identifikation des Charakters
    '       "wahl" gibt in der Sub Intro die Wahl des Spielers an (z.B. 1 f�r Neues Spiel)
    '+       "keingottesdienst" gibt an, dass beim erneuten Betreten der Kirche,
    '               kein Gottesdienst stattfindet. Diese Variable wird beim ersten Betreten der Kirche
    '               und des Schlosses aktiviert
    '+       "stadttoroffen" da das Tor am Anfang des Spiels geschlossen ist, wird diese Variable
    '               beim Betreten des Schlosses aktiviert
    '+       "schondagewesen" beim ersten Betreten des Schlosses aktiviert, verhindert dass man zum
    '               zweiten Mal ins Schloss kommt
    '       "location" gibt an, in welcher Sub sich der Spieler befindet (home = 1; stadt = 2 usw.)
    '       "asdf" ist eine Variable f�r Input-Anweisungen (wahrscheinlich schon komplett durch asdf$ ersetzt)
    '       "asdf$" ist eine Variable f�r Input$-Anweisungen
    '+       "item$" gibt an, welchen Gegenstand der Spieler mit sich tr�gt

    item$ = "kein Gegenstand vorhanden"

    '       "action" gibt die Aktion innerhalb einer Sub (=Location) an (z.B Umsehen oder Ansprechen)
    '       "position" gibt die Position innerhalb einer Sub an (z.B. beim Tisch)
    '       "gehehin" gibt Sub-�bergreifend den Ort an, den der Spieler als n�chstes Betritt
    '       "automatisch" gibt innerhalb einer Sub an, dass etwas automatisch passiert, wenn man etwas macht
    '    (z.B. man wird automatisch angesprochen, wenn man zur Schlosswache geht)
    '+       "kannnichtindenwald" wird aktiviert, wenn die Wache den Weg in den Wald versperrt.
    '+       "durchganggewaehrt" gibt an, dass der Bewacher des Waldes weg ist, aktiviert beim Gespr�ch mit dem K�nig
    '       "now$" gibt an wie sp�t wir es jetzt haben. Die Variable kommt bei Warteschleifen zum Einsatz
    '       "warte" gibt an wie lange man warten muss, bis eine Zeitschleife vorbei ist
    '+       "kompassschonzurueck" gibt an, dass man den Kompass schon zur�ckgebracht hat
    '+       "lautegegeben" gibt an, dass man dem Traurigen die Laute gegeben hat
    '+       "nopassword" gibt an, dass noch kein einziges Passwort aktiviert ist.

    nopassword = 1

    '+       "brilleschongegeben" gibt an, dass man dem alten Mann die Brille schon gebracht hat.
    '       "kombination$" ist die Kombination, die der Spieler zum �ffnen der Truhe im Haus des alten Mannes eingibt
    '+       "angelwirdgeraderepariert" gibt an, das der Reisende gerade die Angel repariert
    '+       "angelwurderepariert" gibt an, dass die Angel schon repariert wurde.
    '+       "ilikefish" gibt an, dass man schon beim Magier gewesen ist, und jetzt gerne einen Fisch vom Fischer bekommen w�rde
    '+       "brauchepulver" gibt an, dass man vom Glask�nstler den Auftrag bekommen hat magisches Pulver zu besorgen.
    '+       "augeeingesetzt" gibt an, dass das Auge des Ruach sich an seinem Platz befindet
    '       "richtig" gibt an, dass man das Passwort in der H�hle richtig erraten hat
    '       "password$" vom Spieler eingegebenes Passwort
    '       "pass" vom Spiel umgewandeltes "password$" zur Identifikation
    '       "dead" gibt an, dass ob der Charakter tot ist oder nicht
    '       "blick" gibt an, wie oft man sich am Wasserfall umgesehen hat (max. 2, min. 1)
END SUB

SUB MagierGilde

    position = 0
    15 CLS
    COLOR 3
    location = 15

    PRINT "Ort: ": LOCATE 1, 6: COLOR 10: PRINT "Die Gilde der Magier": COLOR 3
    LOCATE 1, 31: PRINT "Position: ": COLOR 10: LOCATE 1, 40: PRINT position: COLOR 3
    LOCATE 1, 45: PRINT "Item: ": LOCATE 1, 51: COLOR 10: PRINT item$: COLOR 3

    LOCATE 3, 1
    PRINT "Die Eingangshalle ist sehr gro� und reichlich verziert. In der N�he des Eingangs"
    PRINT "ist ein kleiner Stand mit magischen Utensilien aufgebaut. Daneben steht ein"
    PRINT "Magier hohen Grades und unterh�lt sich mit dem Verk�ufer. Weiter hinten"
    PRINT "befinden sich mehrere stark bewachte T�ren."

    LOCATE 8, 1: COLOR 7
    PRINT "1. Umsehen"
    PRINT "2. Ansprechen"
    PRINT "3. Gegenstand benutzen"
    PRINT "4. zum Verk�ufer gehen (1)"
    PRINT "5. zum Magier gehen (2)"
    PRINT "6. zu den bewachten T�ren gehen (3)"
    PRINT "7. gehe raus (in die Steppe)"

    LOCATE 16, 1: COLOR 3: PRINT "Deine Aktion: "
    DO
        LOCATE 16, 15: COLOR 7: PRINT "           "
        LOCATE 16, 15: COLOR 7: INPUT "", action
    LOOP UNTIL action > 0 AND action < 8
    COLOR 3

    IF position = 0 THEN
        IF action < 4 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 15
        END IF
    END IF

    IF position = 1 THEN
        IF action = 1 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 15
        END IF
        IF action = 2 THEN
            IF brauchepulver = 0 THEN
                CLS
                PRINT "Verk�ufer: Sei mir gegr��t Reisender!"
                PRINT
                PRINT "Zur Zeit haben wir leider keine Produkte im Angebot, die"
                PRINT "du als Nicht-Magier erwerben d�rftest. Komm sp�ter wieder."
                INPUT "", asdf$
                GOTO 15
            END IF
            IF brauchepulver = 1 THEN
                DO
                    CLS
                    PRINT "Verk�ufer: Sei mir gegr��t Reisender!"
                    PRINT
                    INPUT "M�chtest du magisches Pulver erwerben? ", asdf$
                LOOP UNTIL asdf$ = "ja" OR asdf$ = "nein"
                IF asdf$ = "nein" THEN GOTO 15
                IF asdf$ = "ja" THEN
                    CLS
                    PRINT "Verk�ufer: Ausgezeichnet!"
                    PRINT
                    PRINT "Aber wie du dir sicher vorstellen kannst, ist Geld viel zu abstrakt,"
                    PRINT "als dass ich welches von dir verlangen k�nnte."
                    PRINT "Aber was du tun k�nntest, w�re f�r mich einen Fisch zu besorgen."
                    INPUT "Ich esse so gerne Fisch, aber der Fischer hat gerade Urlaub...", asdf$
                    IF ilikefish = 0 THEN ilikefish = 1
                    GOTO 15
                END IF
            END IF
            IF brauchepulver = 2 THEN
                CLS
                PRINT "Verk�ufer: Danke f�r den Fisch,"
                PRINT "sobald ich Feierabend habe, werde ich mir was Leckeres"
                INPUT "zubereiten.", asdf$
                GOTO 15
            END IF
        END IF
        IF action = 3 THEN
            IF brauchepulver = 1 AND item$ = "Fisch" THEN
                CLS
                PRINT "Verk�ufer: Ein Fisch!"
                INPUT "Danke, daf�r bekommst du magisches Pulver.", asdf$
                PRINT
                INPUT "Hier hast du es.", asdf$
                item$ = "magisches Pulver"
                brauchepulver = 2
                GOTO 15
            ELSE INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
                GOTO 15
            END IF
        END IF
    END IF

    IF position = 2 THEN
        IF action = 1 OR action = 3 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 15
        END IF
        IF action = 2 THEN
            CLS
            PRINT "Magier: Sei mir gegr��t, "; name$; "!"
            PRINT
            PRINT "Ich bin ein enger Vertrauter des K�nigs."
            PRINT "Er hat mir von deiner Mission erz�hlt."
            PRINT "Du bist unsere letzte Chance, "; name$; "."
            PRINT "Wenn du deine Mission nicht erfolgreich beenden kannst,"
            INPUT "ist alles verloren. M�ge der Sch�pfer dir beistehen.", asdf$
            GOTO 15
        END IF
    END IF
                
    IF action = 4 THEN
        position = 1
        GOTO 15
    END IF

    IF action = 5 THEN
        position = 2
        GOTO 15
    END IF

    IF action = 6 THEN
        CLS
        COLOR 7
        PRINT "Kaum machst du dich auf den Weg zu den bewachten T�ren,"
        PRINT "kommen dir Wachen entgegen und halten dich fast schon"
        INPUT "gewaltsam zur�ck.", asdf$
        position = 0
        GOTO 15
    END IF

    IF action = 7 THEN gehehin = 10

END SUB

SUB Passwort

    20 CLS
    COLOR 10
    LOCATE 3, 32: PRINT "Passwort Men�"
    LOCATE 4, 32: PRINT "-------------"

    COLOR 11
    LOCATE 30, 1: COLOR 7
    PRINT "keine Eingabe: zum Hauptmen� zur�ckkehren"

    pass = 0
    LOCATE 6, 10: COLOR 11
    INPUT "Bitte hier das Passwort eingeben: ", password$

    IF password$ = "" THEN
        Intro
        EXIT SUB
    END IF
    IF password$ = "BlackJack" OR password$ = "1704" THEN pass = 1
    IF password$ = "Klavkalasch" OR password$ = "25481" THEN pass = 2
    IF password$ = "BlitzRatte" OR password$ = "343590" THEN pass = 3
    IF password$ = "TomatorRulez" OR password$ = "4407235" THEN pass = 4
    IF password$ = "StairwayToHeaven" OR password$ = "5210478" THEN pass = 5
    IF password$ = "SkidooNow" OR password$ = "6935107" THEN pass = 6
    IF password$ = "wisitla" THEN
        DO
            LOCATE 6, 55
            PRINT "                   "
            LOCATE 6, 10
            INPUT "Welches Passwort soll aktiviert werden? Passwort Nr.", pass
            IF pass = 7 THEN
                gehehin = 19
                EXIT SUB
            END IF
        LOOP UNTIL pass > 0 AND pass < 7
    END IF
    IF pass > 0 THEN GOTO 25

    LOCATE 8, 10: COLOR 4
    SOUND 3000, 2
    SOUND 32767, 1
    SOUND 3000, 2
    INPUT "UNG�LTIGES PASSWORT", asdf$
    GOTO 20

    25
    LOCATE 8, 10: COLOR 10
    PRINT "Passwort Nr."; pass; "erfolgreich aktiviert!"
    DO
        LOCATE 10, 61: PRINT "             "
        LOCATE 10, 10: INPUT "M�chten Sie das Spiel an dieser Stelle fortsetzen? ", asdf$
    LOOP UNTIL asdf$ = "nein" OR asdf$ = "ja"

    IF asdf$ = "nein" THEN GOTO 20

    IF pass = 1 THEN
        gehehin = 5
        item$ = "kein Gegenstand vorhanden"
        keingottesdienst = 1
        stadttoroffen = 1
        schondagewesen = 1
        nopassword = 0
        lautegegeben = 0
        kompassschonzurueck = 0
        durchganggewaehrt = 0
        kannnichtindenwald = 0
        brilleschongegeben = 0
        angelwurderepariert = 0
        ilikefish = 0
        brauchepulver = 0
    END IF
        
    IF pass = 2 THEN
        gehehin = 12
        item$ = "Brille"
        keingottesdienst = 1
        stadttoroffen = 1
        schondagewesen = 1
        nopassword = 0
        lautegegeben = 0
        kompassschonzurueck = 1
        durchganggewaehrt = 1
        kannnichtindenwald = 1
        brilleschongegeben = 0
        angelwurderepariert = 0
        ilikefish = 0
        brauchepulver = 0
    END IF

    IF pass = 3 THEN
        gehehin = 7
        item$ = "Alvara Wurzel"
        keingottesdienst = 1
        stadttoroffen = 1
        schondagewesen = 1
        nopassword = 0
        lautegegeben = 1
        kompassschonzurueck = 1
        durchganggewaehrt = 1
        kannnichtindenwald = 1
        brilleschongegeben = 1
        angelwurderepariert = 0
        ilikefish = 0
        brauchepulver = 0
    END IF

    IF pass = 4 THEN
        gehehin = 9
        item$ = "Dose mit W�rmern"
        keingottesdienst = 1
        stadttoroffen = 1
        schondagewesen = 1
        nopassword = 0
        lautegegeben = 1
        kompassschonzurueck = 1
        durchganggewaehrt = 1
        kannnichtindenwald = 1
        brilleschongegeben = 1
        angelwurderepariert = 0
        ilikefish = 2
        brauchepulver = 1
    END IF

    IF pass = 5 THEN
        gehehin = 5
        item$ = "Auge des Ruach"
        keingottesdienst = 1
        stadttoroffen = 1
        schondagewesen = 1
        nopassword = 0
        lautegegeben = 1
        kompassschonzurueck = 1
        durchganggewaehrt = 1
        kannnichtindenwald = 1
        brilleschongegeben = 1
        angelwurderepariert = 1
        ilikefish = 4
        brauchepulver = 2
    END IF

    IF pass = 6 THEN gehehin = 17

    LOCATE 13, 10: COLOR 3
    PRINT "Geben Sie hier den Namen ein, mit dem Sie w�hrend des Spiels"
    LOCATE 14, 10
    INPUT "angesprochen werden m�chten: ", name$
    IF name$ = "" THEN name$ = "Callas"

END SUB

SUB Schloss

    automatisch = 0
    position = 0
    4 CLS
    COLOR 3
    location = 4

    PRINT "Ort: ": LOCATE 1, 6: COLOR 10: PRINT "Schloss": COLOR 3
    LOCATE 1, 31: PRINT "Position: ": COLOR 10: LOCATE 1, 40: PRINT position: COLOR 3
    LOCATE 1, 45: PRINT "Item: ": LOCATE 1, 51: COLOR 10: PRINT item$: COLOR 3

    LOCATE 3, 1
    PRINT "Vor dem Haupttor steht eine Wache"

    LOCATE 8, 1: COLOR 7
    PRINT "1. gehe zur�ck in die Stadt"
    PRINT "2. gehe zur Wache (1)"

    IF automatisch = 1 THEN GOTO 40

    LOCATE 15, 1: COLOR 3: PRINT "Deine Aktion: "

    DO
        LOCATE 15, 15: COLOR 7: PRINT "           "
        LOCATE 15, 15: COLOR 7: INPUT "", action
    LOOP UNTIL action > 0 AND action < 3

    IF action = 1 THEN
        gehehin = 2
        EXIT SUB
    END IF

    IF action = 2 THEN
        position = 1
        automatisch = 1
        GOTO 4
    END IF

    40
    IF kannnichtindenwald = 0 THEN
        IF schondagewesen = 0 THEN
            LOCATE 13, 1: COLOR 3: PRINT "Halt, wer bist du?"
            COLOR 7: LOCATE 15, 5: INPUT "Ich bin der ", asdf$
            COLOR 3
            IF asdf$ = "Weltenretter" OR asdf$ = "wisitla" THEN
                LOCATE 17, 1: INPUT "Du darfst passieren", asdf$
                GOTO 44
            ELSE LOCATE 17, 1: INPUT "Sch�n f�r dich. Hau jetzt ab, ich habe Besseres zu tun.", asdf$
                automatisch = 0: position = 0: GOTO 4
            END IF
        ELSE COLOR 3: LOCATE 13, 1
            PRINT "Du siehst aus wie der Weltenretter. Aber er ist noch nicht wieder rausgekommen. "
            LOCATE 15, 1: PRINT "Du bist ein Schwindler!"
            LOCATE 17, 1: COLOR 7: INPUT "Die Wache schmei�t dich raus.", asdf$
            gehehin = 2: EXIT SUB
        END IF
    ELSE durchganggewaehrt = 1
        LOCATE 13, 1: COLOR 3: PRINT "Schon wieder ein Eindringling! Wir m�ssen mehr Wachen hierhin verlegen!"
        LOCATE 15, 1: COLOR 7: INPUT "Die Wache schmei�t dich raus.", asdf$: gehehin = 2: EXIT SUB
    END IF

    44 CLS
    stadttoroffen = 1
    schondagewesen = 1
    keingottesdienst = 1

    COLOR 7
    PRINT "Im Schloss"
    LOCATE 3, 1: COLOR 3: PRINT "K�nig: Willkommen tapferer Krieger."
    LOCATE 5, 1: PRINT "Wir haben hier nicht die Zeit ausf�hrlich �ber"
    PRINT "alles zu reden. Daf�r naht das B�se viel zu schnell."
    PRINT "Deswegen hier das Wichtigste:"
    PRINT "Die Prophezeihung scheint sich zu erf�llen. Meine Boten"
    PRINT "und Wachen melden �berall aus dem Land merkw�rdige Schreie"
    PRINT "und Echos, die fast schon jede Nacht zu h�ren sind."
    PRINT "Aber sie alle kennen die Prophezeihung nicht. Denn diese"
    PRINT "Schreie stammen alle von Cthulhu, der tief unter der Erde"
    PRINT "schl�ft. Cthulhu ist der dunkelste aller b�sartigen G�tter."
    PRINT "Aber auch er hat unter uns Menschen seine Diener. Ich spreche"
    PRINT "von der Sekte des Tultron. Ihre Wahrnehmung wurde von Cthulhu"
    PRINT "vernebelt. Und nun versuchen sie ihn aufzuwecken. Wenn ihnen"
    PRINT "das gelingt, ist das Ende der Welt gekommen. Cthulhu kennt"
    INPUT "keine Gnade.", asdf$

    CLS
    COLOR 7: PRINT "Im Schloss": COLOR 3
    LOCATE 3, 1
    PRINT "K�nig: Aber es gibt noch Hoffnung. Genauer gesagt,"
    PRINT "bist du unsere letzte Hoffnung. Denn nur einer der"
    PRINT "keinem Adelsgeschlecht angeh�rt kann die Apocalypse"
    PRINT "abwenden. Und au�er dir kann ich keinem vertrauen."
    PRINT "Tief in den Bergen, im Osten des Landes, ist Yog Sothoth"
    PRINT "gefangen. Er ist ein guter Gott und er alleine kann"
    PRINT "Cthulhu aufhalten."
    PRINT "Dein Auftrag, "; name$; ", lautet: Begib dich in die Berge"
    PRINT "und befreie Yog Sothoth. Doch vorsicht, in die Berge"
    PRINT "kommt man nicht so einfach. Und �berall lauern Spione des"
    PRINT "Tultron. Du darfst also keinem vertrauen. Jeder k�nnte"
    INPUT "ein Feind sein.", asdf$

    CLS
    COLOR 7: PRINT "Im Schloss": COLOR 3
    LOCATE 3, 1
    PRINT "K�nig: Ich schlage dich jetzt zum Ritter. Das ist"
    PRINT "ein Amt der h�chsten Ehre und mit viel Verantwortung"
    PRINT "verbunden. Und doch ist es in diesem Fall kein adeliges"
    PRINT "Amt, denn ich werde dich den Adelsschwur nicht schw�ren"
    INPUT "lassen, damit du diese Mission ausf�hren kannst.", asdf$

    LOCATE 9, 1: COLOR 7: PRINT "Der K�nig f�hrt die Zeremonie durch"

    DO
        LOCATE 12, 5
        PRINT TIME$
        IF TIME$ > now$ THEN warte = warte + 1
        now$ = TIME$
    LOOP UNTIL warte = 10

    LOCATE 12, 1: COLOR 3: PRINT "K�nig: Du bist jetzt ein Ritter. Denke an deine"
    INPUT "Mission. Wir haben nicht mehr viel Zeit.", asdf$

    CLS
    COLOR 7: PRINT "Im Schloss": COLOR 3
    LOCATE 3, 1
    PRINT "K�nig: Du bist unsere letzte Hoffnug, "; name$; "."
    INPUT "Viel Erfolg.", asdf$

    LOCATE 6, 1: COLOR 7
    PRINT "Der K�nig f�hrt dich �ber einen Hinterausgang"
    INPUT "hinaus in die Stadt.", asdf$

    gehehin = 2

END SUB

SUB Stadt

    position = 0
    2 CLS
    COLOR 3
    location = 2
    IF keingottesdienst = 1 THEN GOTO 200

    PRINT "Ort: ": LOCATE 1, 6: COLOR 10: PRINT "Stadt": COLOR 3
    LOCATE 1, 31: PRINT "Position: ": COLOR 10: LOCATE 1, 40: PRINT position: COLOR 3
    LOCATE 1, 45: PRINT "Item: ": LOCATE 1, 51: COLOR 10: PRINT item$: COLOR 3

    LOCATE 3, 1
    PRINT "Im Osten, hinter der Kirche, siehst du die Sonne aufgehen. Die Glocken der"
    PRINT "Kirche l�uten und rufen zum Gottesdienst."
    PRINT "In der Luft liegt ein s�sslicher Geruch. Es weht ein schwacher Westwind."

    LOCATE 8, 1: COLOR 7

    PRINT "1. Umsehen"
    PRINT "2. Ansprechen"
    PRINT "3. Gegenstand benutzen"
    PRINT "4. gehe aus der Stadt raus (in die Steppe)"
    PRINT "5. gehe in die Kirche"
    PRINT "6. gehe in das Schloss"
    PRINT "7. gehe zum Haus des H�ndlers"
    PRINT "8. gehe nach Hause"

    LOCATE 19, 1: COLOR 3: PRINT "Deine Aktion: "
    DO
        LOCATE 19, 15: COLOR 7: PRINT "           "
        LOCATE 19, 15: COLOR 7: INPUT "", action
    LOOP UNTIL action > 0 AND action < 9
    COLOR 3

    IF action = 1 OR action = 2 OR action = 3 THEN
        IF position = 0 THEN INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
        GOTO 2
    END IF

    GOTO 222

    200
    PRINT "Ort: ": LOCATE 1, 6: COLOR 10: PRINT "Stadt": COLOR 3
    LOCATE 1, 31: PRINT "Position: ": COLOR 10: LOCATE 1, 40: PRINT position: COLOR 3
    LOCATE 1, 45: PRINT "Item: ": LOCATE 1, 51: COLOR 10: PRINT item$: COLOR 3

    LOCATE 3, 1
    PRINT "Die Stadt ist heute ungew�hnlich ruhig. Einige Menschen sind drau�en."
    PRINT "Die meisten von ihnen stehen am Brunnen und reden miteinander."
    IF lautegegeben = 0 THEN
        PRINT "Etwas abseits von Allen sitzt eine traurige Gestalt."
    ELSE PRINT "Auf dem Rand des Brunnens sitzt einer und spielt Laute."
    END IF
    IF schondagewesen = 1 THEN PRINT "Neben der Kirche steht ein kleiner Junge."

    LOCATE 8, 1: COLOR 7

    PRINT "1. Umsehen"
    PRINT "2. Ansprechen"
    PRINT "3. Gegenstand benutzen"
    PRINT "4. gehe aus der Stadt raus (in die Steppe)"
    PRINT "5. gehe in die Kirche"
    PRINT "6. gehe in das Schloss"
    PRINT "7. gehe zum Haus des H�ndlers"
    PRINT "8. gehe nach Hause"
    PRINT "9. zur Menschenmenge gehen (1)"
    IF lautegegeben = 0 THEN
        PRINT "10. zum Traurigen gehen (2)"
    ELSE PRINT "10. zum Lautespieler gehen (2)"
    END IF
    IF schondagewesen = 1 THEN PRINT "11. zum kleinen Jungen gehen (3)"

    LOCATE 20, 1: COLOR 3: PRINT "Deine Aktion: "

    IF schondagewesen = 1 THEN
        DO
            LOCATE 20, 15: COLOR 7: PRINT "           "
            LOCATE 20, 15: COLOR 7: INPUT "", action
        LOOP UNTIL action > 0 AND action < 12
    ELSE
        DO
            LOCATE 20, 15: COLOR 7: PRINT "           "
            LOCATE 20, 15: COLOR 7: INPUT "", action
        LOOP UNTIL action > 0 AND action < 11
    END IF
    COLOR 3

    IF position = 0 THEN
        IF action < 4 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 2
        END IF
    END IF

    IF position = 1 THEN
        IF action = 1 OR action = 3 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 2
        END IF
        IF action = 2 THEN
            CLS
            COLOR 7
            PRINT "Obwohl du die Menschen angesprochen hast, ignorieren sie dich."
            PRINT "Sie erz�hlen einfach ihre Ger�chte weiter. Bei genauerem"
            INPUT "Hinh�ren stellst du fest, dass sie jeden Tag das Gleiche erz�hlen.", asdf$
            LOCATE 5, 1: COLOR 3
            PRINT "Person 1: ... ja, da gab es doch mal das magische Auge des Ruach."
            PRINT "Es l�sst sich von nichts t�uschen und sieht �berall die Wahrheit!"
            PRINT "Person 2: Ich glaube der Glask�nstler, der seine Magierausbildung"
            PRINT "abgebrochen hat kann es herstellen..."
            PRINT "Person 3: Habt ihr schon das Ger�cht geh�rt, dass es wahrscheinlich"
            PRINT "immer noch die Alvara Pflanze gibt? Aber es hei�t nur noch ihre Wurzeln"
            INPUT "haben �berlebt...", asdf$
            GOTO 2
        END IF
    END IF

    IF position = 2 THEN
        IF action = 1 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 2
        END IF
        IF action = 2 THEN
            IF lautegegeben = 0 THEN
                CLS
                PRINT "Der Traurige: Heul..."
                LOCATE 3, 1
                PRINT "Ich bin so traurig. Wenn mir blo� jemand einen Witz erz�hlen, oder"
                INPUT "irgendetwas anderes machen w�rde um mich aufzumuntern...", asdf$
                GOTO 2
            ELSE
                CLS
                PRINT "Der Lautespieler: Vielen Dank f�r die Laute, "; name$; "!"
                LOCATE 3, 1
                PRINT "Jetzt geht es mir schon viel besser. Wenn ich irgendwas f�r dich tun kann,"
                INPUT "sag es mir ruhig.", asdf$
                GOTO 2
            END IF
        END IF
        IF action = 3 THEN
            IF item$ <> "Laute" THEN
                INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
                GOTO 2
            ELSE
                CLS
                lautegegeben = 1
                PRINT "Der Traurige: Das ist ja eine Laute!"
                PRINT "Ich habe schon seit Jahre keine Laute mehr gesehen!"
                PRINT "Bitte schenk sie mir, dann bekommst du auch einen Gutschein!"
                LOCATE 5, 1: COLOR 7
                PRINT "Da du mit der Laute sowieso nichts anfangen kannst,"
                PRINT "gibst du sie dem Traurigen."
                INPUT "Er gibt dir daf�r einen Werkzeuggutschein.", asdf$
                item$ = "Gutschein"
                GOTO 2
            END IF
        END IF
    END IF

    IF position = 3 THEN
        IF action = 1 OR action = 3 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 2
        END IF
        IF action = 2 THEN
            CLS
            PRINT "kleiner Junge: Du bist "; name$; " stimmt's?"
            PRINT
            PRINT "Ich habe dich und den K�nig belauscht. Aber sag das bitte keinem"
            INPUT "weiter...", asdf$
            PRINT
            PRINT "Ich habe geh�rt, was er gesagt hat."
            PRINT "Viele Menschen in der Stadt denken der K�nig sei b�se, weil er"
            PRINT "nichts gegen Tultron und seine Sekte unternimmt. Die Menschen"
            PRINT "denken, dass der K�nig mit Tultron zusammenarbeitet."
            INPUT "Einige wollten sogar das Schloss st�rmen und den K�nig t�ten.", asdf$
            PRINT
            PRINT "Aber ich wei� jetzt die Wahrheit... der K�nig ist gut und er"
            PRINT "macht sich Sorgen um sein Volk."
            PRINT "Ich muss das so schnell wie m�glich meinem Vater erz�hlen, bevor"
            PRINT "noch irgendetwas passiert. Aber ich wei� nicht, wo er hingegangen"
            INPUT "ist... ", asdf$
            GOTO 2
        END IF
    END IF

    IF action = 9 THEN
        position = 1
        GOTO 2
    END IF

    IF action = 10 THEN
        position = 2
        GOTO 2
    END IF

    IF action = 11 THEN
        position = 3
        GOTO 2
    END IF

    IF action = 4 THEN
        gehehin = 5
        IF nopassword = 1 THEN
            IF stadttoroffen = 1 THEN
                nopassword = 0
                22 CLS
                COLOR 7
                PRINT "Das aktuelle Passwort lautet: 1704 bzw. BlackJack"
                PRINT
                PRINT "weiter mit 1"
                INPUT "", asdf$
                IF asdf$ <> "1" THEN GOTO 22
            END IF
        END IF
    END IF

    IF action = 7 THEN gehehin = 12


    222
    IF stadttoroffen = 0 THEN
        IF action = 4 THEN
            LOCATE 21, 1
            PRINT "Es ist noch fr�h am Morgen, deswegen ist das Stadttor"
            INPUT "noch geschlossen. Komm sp�ter wieder.", asdf$
            GOTO 2
        END IF
        IF action = 7 THEN
            LOCATE 21, 1
            PRINT "Um diese Uhrzeit schl�ft der H�ndler wahrscheinlich noch."
            INPUT "Seine T�r l�sst sich nicht �ffnen.", asdf$
            GOTO 2
        END IF
    END IF

    IF action = 5 THEN gehehin = 3
    IF action = 6 THEN gehehin = 4
    IF action = 8 THEN gehehin = 1
      
END SUB

SUB Start

    'Im Folgenden wird das Datum abgefragt und in den F�llen '23. Mai' oder '6. Juli'
    'das Spiel beendet

    month$ = MID$(DATE$, 1, 2) 'aktueller Monat als $-Variable
    day$ = MID$(DATE$, 4, 2) 'aktueller Tag    "  "    "
    year$ = MID$(DATE$, 7, 4) 'aktuelles Jahr   "  "    "

    zahl1$ = MID$(year$, 1, 1) 'hier wird die 4-stellige
    zahl2$ = MID$(year$, 2, 1) 'Jahresvariable in 4 separate
    zahl3$ = MID$(year$, 3, 1) 'Variablen getrennt
    zahl4$ = MID$(year$, 4, 1) 'die Zahlen werden noch als Text interpretiert

    zahl1 = ASC(zahl1$) - 48 'hier werden die 4 "Text-Zahlen"
    zahl2 = ASC(zahl2$) - 48 'in "Zahlen-Zahlen" umgewandelt
    zahl3 = ASC(zahl3$) - 48 'Text-Zahlen = es wird eine Text-Variable ausgegeben, die Zahlen enth�lt
    zahl4 = ASC(zahl4$) - 48 'Zahlen-Zahlen = die Zahlen werden jetzt mit Hilfe einer Zahlenvariable ausgegeben

    year = (zahl1 * 1000) + (zahl2 * 100) + (zahl3 * 10) + zahl4 'das Jahr als Zahl


    'Unterbrechung Nr.1
    '------------------

    IF month$ = "05" THEN
        IF day$ = "23" THEN
            PRINT "Heute ist der 23. Mai"; year
            INPUT "Insider wissen, dass dieser Tag der 'Illuminaten-Tag' ist.", asdf$
            IF asdf$ = "wisitla" THEN GOTO 9888
            PRINT
            PRINT "An diesem Tag passieren lauter merkw�rdige Dinge und zwar"
            PRINT "ganz zuf�llig."
            PRINT "Daher kann ich nicht garantieren, dass das Spiel heute"
            PRINT "funktionieren wird."
            PRINT
            INPUT "Deswegen wird es beendet.", asdf$
            IF asdf$ = "wisitla" THEN GOTO 9888
            END
        END IF
    END IF


    'Unterbrechung Nr.2
    '------------------

    IF month$ = "07" THEN
        IF day$ = "06" THEN
            PRINT "Heute ist der 6. Juli"; year
            INPUT "", asdf$
            IF asdf$ = "wisitla" THEN GOTO 9888
            PRINT "Weil der Programmierer ganz gerne Leute verarscht, kann man dieses"
            INPUT "Spiel heute nicht spielen.", asdf$
            IF asdf$ = "wisitla" THEN GOTO 9888
            END
        END IF
    END IF

    9888

    COLOR , 9

    LOCATE 14, 24: PRINT "                           "
    LOCATE 15, 24: PRINT "                           "
    LOCATE 16, 24: PRINT "                           "

    COLOR 6, 15

    zeile$ = "Ejso Simcha presents..."
    spalte = 1 'gibt die Spalte an, in die der n�chste
    'Buchstabe geschrieben wird aber auch den
    'Buchstaben, der als n�chstes aus der Variable
    'zeile$ ausgelesen wird

    LOCATE 15, 25
    PRINT "                         "

    DO
        FOR i = 1 TO 30000
        NEXT i
        LOCATE 15, spalte + 25
        schreibe$ = MID$(zeile$, spalte, 1)
        PRINT schreibe$
        spalte = spalte + 1
    LOOP UNTIL spalte = 24

    FOR i = 1 TO 150000
    NEXT i

END SUB

SUB SteppeN

    position = 0
    6 CLS
    COLOR 3
    location = 6

    PRINT "Ort: ": LOCATE 1, 6: COLOR 10: PRINT "n�rdliche Steppe": COLOR 3
    LOCATE 1, 31: PRINT "Position: ": COLOR 10: LOCATE 1, 40: PRINT position: COLOR 3
    LOCATE 1, 45: PRINT "Item: ": LOCATE 1, 51: COLOR 10: PRINT item$: COLOR 3

    LOCATE 3, 1
    PRINT "Im Norden ist das Meer zu sehen. Hier ist auch schon der K�stenwind zu"
    PRINT "sp�ren, der den frische Geruch des Meeres �ber die ganze n�rdliche Steppe"
    PRINT "verbreitet. Auf einer Wiese neben dem Fluss ist ein Zelt eines Reisenden"
    PRINT "aufgeschlagen. Er liegt daneben und entspannt sich."

    LOCATE 8, 1: COLOR 7
    PRINT "1. Umsehen"
    PRINT "2. Ansprechen"
    PRINT "3. Gegenstand benutzen"
    PRINT "4. zum Reisenden gehen (1)"
    PRINT "5. gehe zur K�ste"
    PRINT "6. gehe nach S�den (Richtung Stadt)"
    PRINT "7. gehe nach Osten (Richtung Berge)"
    PRINT "8. gehe nach Westen (Richtung Wald)"

    LOCATE 17, 1: COLOR 3: PRINT "Deine Aktion: "
    DO
        LOCATE 17, 15: COLOR 7: PRINT "           "
        LOCATE 17, 15: COLOR 7: INPUT "", action
    LOOP UNTIL action > 0 AND action < 9
    COLOR 3

    IF position = 0 THEN
        IF action < 4 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 6
        END IF
    END IF

    IF position = 1 THEN
        IF action = 1 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 6
        END IF
        IF action = 2 THEN
            IF angelwirdgeraderepariert = 1 THEN
                CLS
                PRINT "Arnaw: Ich bin mit der Reparatur schon fast fertig."
                INPUT "Hast du die Pilze schon gefunden?", asdf$
                GOTO 6
            END IF
            IF angelwurderepariert = 1 THEN
                CLS
                PRINT "Arnaw: Danke f�r die Pilze."
                INPUT "Die werden ein leckeres Abendessen abgeben.", asdf$
                GOTO 6
            ELSE CLS
                PRINT "Reisender: Hallo, mein Name ist Arnaw."
                PRINT
                PRINT "Ich bin hier auf der Durchreise. Ich komme aus dem Westen, aus dem"
                PRINT "Land Lawan-�sh. Ich brauche halt ein bisschen Urlaub von meiner"
                PRINT "Werkstatt."
                PRINT "Die Natur hier bei euch ist ja echt atemberaubend. Alles bl�ht nur"
                INPUT "so vor sich hin.", asdf$
                GOTO 6
            END IF
        END IF
        IF action = 3 THEN
            IF item$ = "kaputte Angel" THEN
                CLS
                PRINT "Arnaw: Was willst du mir mit diesem kaputten Stab, der dazu dient"
                PRINT "Fische aus dem Wasser an Land zu ziehen, sagen?"
                INPUT "", asdf$
                PRINT "Ahh, ich soll den reparieren!"
                PRINT "Aber du wei�t doch, dass ich Urlaub mache."
                PRINT "Deswegen verlange ich eine kleine Entsch�digung daf�r."
                INPUT "", asdf$
                PRINT "Lass mich mal nachdenken..."
                PRINT "Vielleicht gehst du mal solange Pilze sammeln und wenn du zur�ck"
                PRINT "bist gebe ich dir die reparierte Angel und du gibst mir die Pilze."
                INPUT "", asdf$
                COLOR 7
                PRINT
                PRINT "Du erkl�rst dich einverstanden und gibst ihm die kaputte Angel."
                INPUT "", asdf$
                ilikefish = 3
                angelwirdgeraderepariert = 1
                item$ = "kein Gegenstand vorhanden"
                GOTO 6
            END IF
            IF item$ = "Korb mit Pilzen" THEN
                CLS
                PRINT "Arnaw: Hey cool, ein ganzer Korb voll!!!"
                PRINT "Danke!"
                PRINT "Hier hast du die Angel."
                PRINT "War sch�n mit dir Gesch�fte zu machen, aber verpiss dich jetzt,"
                INPUT "ich habe Hunger.", asdf$
                PRINT "War nur ein kleiner Scherz, nat�rlich kannst du bleiben solange"
                PRINT "du willst."
                PRINT "Aber lass deine Dreckspfoten von den Pilzen..."
                INPUT "", asdf$
                PRINT "Hahaha, war wieder nur ein Scherz nimm's mir nicht �bel."
                PRINT "Wenn du willst kannst du ein paar von den Pilzen haben,"
                INPUT "komm einfach zu Abendessen vorbei.", asdf$
                angelwirdgeraderepariert = 0
                angelwurderepariert = 1
                item$ = "Angel"
                GOTO 6
            ELSE
                INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
                GOTO 6
            END IF
        END IF
    END IF

    IF action = 4 THEN
        position = 1
        GOTO 6
    END IF

    IF action = 5 THEN gehehin = 9
    IF action = 6 THEN gehehin = 5
    IF action = 7 THEN gehehin = 10
    IF action = 8 THEN gehehin = 7

END SUB

SUB SteppeO

    blick = 1
    position = 0

    10 CLS
    COLOR 3
    location = 10

    PRINT "Ort: ": LOCATE 1, 6: COLOR 10: PRINT "�stliche Steppe": COLOR 3
    LOCATE 1, 31: PRINT "Position: ": COLOR 10: LOCATE 1, 40: PRINT position: COLOR 3
    LOCATE 1, 45: PRINT "Item: ": LOCATE 1, 51: COLOR 10: PRINT item$: COLOR 3

    LOCATE 3, 1
    PRINT "Im Osten befinden sich die Berge. Irgendwo in den Bergen enstspringt ein"
    PRINT "Fluss, der �ber einen Wasserfall in die Steppe abf�llt und im Norden ins Meer"
    PRINT "m�ndet. Weiter im Nordosten, neben dem Weg, der unter anderem in die W�ste"
    PRINT "f�hrt, befindet sich eine bewachte H�hle, neben ihr der Weg in die Berge."

    LOCATE 8, 1: COLOR 7
    PRINT "1. Umsehen"
    PRINT "2. Ansprechen"
    PRINT "3. Gegenstand benutzen"
    PRINT "4. zur bewachten H�hle gehen (1)"
    PRINT "5. zum Wasserfall gehen (2)"
    PRINT "6. gehe in die Berge"
    PRINT "7. gehe nach Norden (Richtung K�ste)"
    PRINT "8. gehe nach S�den (Richtung Stadt)"

    LOCATE 17, 1: COLOR 3: PRINT "Deine Aktion: "
    DO
        LOCATE 17, 15: COLOR 7: PRINT "           "
        LOCATE 17, 15: COLOR 7: INPUT "", action
    LOOP UNTIL action > 0 AND action < 9
    COLOR 3

    IF position = 0 THEN
        IF action < 4 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 10
        END IF
    END IF

    IF position = 1 THEN
        IF action = 1 OR action = 3 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 10
        END IF
        IF action = 2 THEN action = 4
    END IF

    IF position = 2 THEN
        IF action = 1 THEN
            IF blick = 1 THEN
                CLS
                COLOR 7
                PRINT "Auf den ersten Blick siehst du einen Wasserfall."
                INPUT "", asdf$
                blick = 2
                GOTO 10
            END IF
            IF blick = 2 THEN
                COLOR 7
                DO
                    CLS
                    PRINT "Bei genauem Hinsehen erkennst du, dass sich hinter dem"
                    PRINT "Wasserfall eine H�hle verbirgt."
                    PRINT
                    INPUT "M�chtest du die H�hle betreten? ", asdf$
                LOOP UNTIL asdf$ = "ja" OR asdf$ = "nein"
                IF asdf$ = "nein" THEN GOTO 10
                gehehin = 16
                GOTO 10000
            END IF
        END IF
        IF action = 2 OR action = 3 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 10
        END IF
    END IF

    IF action = 4 THEN
        CLS
        PRINT "Wache 1: Halt!"
        INPUT "Nur wer das Passwort kennt, darf die Gilde der Magier betreten!", asdf$
        PRINT
        PRINT "Wache 2: Wie lautet das Passwort?"
        PRINT
        COLOR 7
        INPUT "     Das Passwort lautet ", asdf$
        COLOR 3
        IF asdf$ <> "Akhkharu" AND asdf$ <> "wisitla" THEN
            PRINT
            INPUT "Wache 2: Das war falsch, verzieh dich du Idiot.", asdf$
            position = 1
            GOTO 10
        END IF
        PRINT
        INPUT "Wache 2: Du darfst hinein.", asdf$
        GOTO 1000
    END IF

    IF action = 5 THEN
        position = 2
        GOTO 10
    END IF

    1000 gehehin = 15

    IF action = 6 THEN gehehin = 11
    IF action = 7 THEN gehehin = 6
    IF action = 8 THEN gehehin = 5

    10000
END SUB

SUB SteppeS

    position = 0
    5 CLS
    COLOR 3
    location = 5

    PRINT "Ort: ": LOCATE 1, 6: COLOR 10: PRINT "s�dliche Steppe": COLOR 3
    LOCATE 1, 31: PRINT "Position: ": COLOR 10: LOCATE 1, 40: PRINT position: COLOR 3
    LOCATE 1, 45: PRINT "Item: ": LOCATE 1, 51: COLOR 10: PRINT item$: COLOR 3

    LOCATE 3, 1
    PRINT "Im S�den der Steppe befindet sich die Stadt. Etwas abseits der Stadt"
    PRINT "befindet sich das Haus des Glask�nstlers, der auf einer Bank vor seinem"
    PRINT "Haus sitzt. Im Osten sind Berge zu erkennen, im Norden das Meer."

    LOCATE 8, 1: COLOR 7
    PRINT "1. Umsehen"
    PRINT "2. Ansprechen"
    PRINT "3. Gegenstand benutzen"
    PRINT "4. zum Glask�nstler gehen (1)"
    PRINT "5. gehe in die Stadt"
    PRINT "6. gehe nach Osten (Richtung Berge)"
    PRINT "7. gehe nach Westen (Richtung Wald)"
    PRINT "8. gehe nach Norden (Richtung K�ste)"

    LOCATE 17, 1: COLOR 3: PRINT "Deine Aktion: "
    DO
        LOCATE 17, 15: COLOR 7: PRINT "           "
        LOCATE 17, 15: COLOR 7: INPUT "", action
    LOOP UNTIL action > 0 AND action < 9
    COLOR 3

    IF position = 0 THEN
        IF action < 4 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 5
        END IF
    END IF

    IF position = 1 THEN
        IF action = 1 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 5
        END IF
        IF action = 2 THEN
            IF brauchepulver = 0 THEN
                DO
                    CLS
                    PRINT "Glask�nstler: Hallo, mein Name ist Ruach."
                    PRINT
                    PRINT "Stimmt es, dass einige Magier in der Kirche predigen d�rfen?"
                    PRINT "Wenn ja, dann m�sste ich demn�chst mal einen Gottesdienst besuchen,"
                    PRINT "um zu sehen, wer da predigt und was er so labert."
                    PRINT "Ich habe n�mlich meine Lehre bei den Magiern abgebrochen... Wir hatten"
                    PRINT "halt ein paar Meinungsverschiedenheiten und seit dem sind die nicht"
                    PRINT "mehr gut auf mich zu sprechen."
                    PRINT
                    PRINT "Aber ich konnte mein wichtigstes Projekt auch ohne die Magier beenden."
                    PRINT "Es ist das Auge des Ruach, nach mir benannt. Auf wundersame Weise kannst"
                    PRINT "du mit seiner Hilfe die Wahrheit sehen."
                    PRINT
                    INPUT "Soll ich dir so ein Auge herstellen? ", asdf$
                LOOP UNTIL asdf$ = "ja" OR asdf$ = "nein"
                IF asdf$ = "nein" THEN GOTO 5
                CLS
                PRINT "Ruach: Ok, mache ich gern, aber davor musst du was f�r mich tun."
                PRINT "Wie du wei�t, wurde die Alvara Pflanze von Tultron ausgerottet,"
                PRINT "aber ab und zu kann ich immer noch ihren s�ssen Geruch wahrnehmen."
                PRINT "Wenn du ein paar Bl�tter oder Wurzeln finden kannst, w�re ich dir"
                INPUT "sehr dankbar.", asdf$
                GOTO 5
            END IF
            IF brauchepulver = 1 THEN
                CLS
                PRINT "Ruach: Hast du das magische Pulver schon?"
                PRINT "Ich brauche es unbedingt, um das Auge herzustellen."
                INPUT "Wenn du es hast, komm sofort vorbei.", asdf$
                GOTO 5
            ELSE
                CLS
                PRINT "Ruach: Nochmals danke f�r die Alvara Wurzeln,"
                INPUT "ich werde mir heute Abend einen leckeren Tee kochen.", asdf$
                GOTO 5
            END IF
        END IF
        IF action = 3 THEN
            IF item$ = "Alvara Wurzel" THEN
                CLS
                PRINT "Ruach: Ich kann meinen Augen kaum glauben..."
                PRINT "Eine Alvara Wurzel!"
                PRINT "Danke dir!"
                INPUT "", asdf$
                PRINT
                PRINT "Jetzt muss du nur noch magisches Pulver besorgen, dann kann"
                PRINT "ich das Auge f�r dich herstellen."
                PRINT "Ich w�rde ja selber zur Gilde der Magier gehen und das Pulver"
                INPUT "holen, aber die Magier sind nicht gut auf mich zu sprechen.", asdf$
                brauchepulver = 1
                item$ = "kein Gegenstand vorhanden"
                GOTO 5
            END IF
            IF item$ = "magisches Pulver" THEN
                CLS
                PRINT "Ruach: Ahh, da ist ja das Pulver."
                PRINT
                PRINT "Ich gehe kurz rein und mache das Auge fertig."
                INPUT "Warte hier.", asdf$
                COLOR 7
                PRINT
                PRINT "Ruach geht ins Haus um das Auge fertigzustellen."
                PRINT
                       
                DO
                    LOCATE 9, 5
                    PRINT TIME$
                    IF TIME$ > now$ THEN warte = warte + 1
                    now$ = TIME$
                LOOP UNTIL warte = 13

                PRINT
                LOCATE 9
                INPUT "Ruach kommt raus und gibt dir das Auge.", adsf
                item$ = "Auge des Ruach"
                500 CLS
                PRINT "Das aktuelle Passwort lautet: 5210478 bzw. StairwayToHeaven"
                PRINT
                PRINT "weiter mit 5"
                INPUT "", asdf$
                IF asdf$ <> "5" THEN GOTO 500
                GOTO 5
            ELSE INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
                GOTO 5
            END IF
        END IF
    END IF

    IF action = 4 THEN
        position = 1
        GOTO 5
    END IF

    IF action = 5 THEN gehehin = 2
    IF action = 6 THEN gehehin = 10
    IF action = 7 THEN gehehin = 7
    IF action = 8 THEN gehehin = 6

END SUB

SUB SteppeW

    position = 0
    7 CLS
    COLOR 3
    location = 7

    PRINT "Ort: ": LOCATE 1, 6: COLOR 10: PRINT "westliche Steppe": COLOR 3
    LOCATE 1, 31: PRINT "Position: ": COLOR 10: LOCATE 1, 40: PRINT position: COLOR 3
    LOCATE 1, 45: PRINT "Item: ": LOCATE 1, 51: COLOR 10: PRINT item$: COLOR 3

    LOCATE 3, 1
    PRINT "Weiter im Westen der Steppe befindet sich ein Wald. Ungef�hr in der Mitte"
    PRINT "ist eine kleine Erh�hung. Au�erdem gibt es noch ein paar Stra�en, die zu"
    PRINT "anderen Teilen des Landes f�hren."

    LOCATE 8, 1: COLOR 7
    PRINT "1. Umsehen"
    PRINT "2. Ansprechen"
    PRINT "3. Gegenstand benutzen"
    PRINT "4. zur Erh�hung gehen (1)"
    PRINT "5. gehe in den Wald"
    PRINT "6. gehe nach Norden (Richtung K�ste)"
    PRINT "7. gehe nach S�den (Richtung Stadt)"

    LOCATE 16, 1: COLOR 3: PRINT "Deine Aktion: "
    DO
        LOCATE 16, 15: COLOR 7: PRINT "           "
        LOCATE 16, 15: COLOR 7: INPUT "", action
    LOOP UNTIL action > 0 AND action < 8
    COLOR 3

    IF position = 0 THEN
        IF action < 4 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 7
        END IF
    END IF

    IF position = 1 THEN
        IF action = 1 THEN
            CLS
            COLOR 7
            PRINT "Von der Erh�hung aus hast du eine gute �bersicht �ber fast die gesamte"
            PRINT "Steppe. Leider ist hier der Boden etwas aufgew�hlt, sodass deine Schuhe"
            INPUT "dreckig werden.", asdf$
            GOTO 7
        END IF
        IF action = 2 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 7
        END IF
        IF action = 3 THEN
            IF item$ = "Schaufel" THEN
                CLS
                COLOR 7
                PRINT "Du stichst mit der Schaufel ein paar Mal in die Erde und findest"
                PRINT "eine Alvara Wurzel. Als du versuchst noch mehr Wurzeln freizulegen,"
                INPUT "geht die Schaufel kaputt.", asdf$
                700 CLS
                PRINT "Das aktuelle Passwort lautet: 343590 bzw. BlitzRatte"
                PRINT
                PRINT "weiter mit 3 "
                INPUT "", asdf$
                IF asdf$ <> "3" THEN GOTO 700
                item$ = "Alvara Wurzel"
                GOTO 7
            ELSE INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
                GOTO 7
            END IF
        END IF
    END IF

    IF action = 4 THEN
        position = 1
        GOTO 7
    END IF

    IF action = 5 THEN gehehin = 8
    IF action = 6 THEN gehehin = 6
    IF action = 7 THEN gehehin = 5

END SUB

SUB Wald

    position = 0
    8 CLS
    COLOR 3
    location = 8

    PRINT "Ort: ": LOCATE 1, 6: COLOR 10: PRINT "Wald": COLOR 3
    LOCATE 1, 31: PRINT "Position: ": COLOR 10: LOCATE 1, 40: PRINT position: COLOR 3
    LOCATE 1, 45: PRINT "Item: ": LOCATE 1, 51: COLOR 10: PRINT item$: COLOR 3

    IF durchganggewaehrt = 0 THEN GOTO 800

    LOCATE 3, 1
    PRINT "Der Wald ist sehr sch�n anzusehen. Hier und da sieht man ab und zu irgendein"
    PRINT "Tierchen. Unweit des Hauses vom alten Mann ist eine Lichtung. Dahinter liegt"
    PRINT "ein alter Baumstumpf."

    LOCATE 8, 1: COLOR 7
    PRINT "1. Umsehen"
    PRINT "2. Ansprechen"
    PRINT "3. Gegenstand benutzen"
    PRINT "4. zur Lichtung gehen (1)"
    PRINT "5. zum Baumstumpf gehen (2)"
    PRINT "6. gehe zum Haus des alten Mannes"
    PRINT "7. gehe raus (in die Steppe)"

    LOCATE 17, 1: COLOR 3: PRINT "Deine Aktion: "
    DO
        LOCATE 17, 15: COLOR 7: PRINT "           "
        LOCATE 17, 15: COLOR 7: INPUT "", action
    LOOP UNTIL action > 0 AND action < 8
    COLOR 3

    IF position = 0 THEN
        IF action < 4 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 8
        END IF
    END IF

    IF position = 1 THEN
        IF action = 2 OR action = 3 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 8
        END IF
        IF action = 1 THEN
            IF item$ = "Kompass" THEN
                INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
                GOTO 8
            END IF
            IF kompassschonzurueck = 0 THEN
                CLS
                item$ = "Kompass"
                COLOR 7
                PRINT "Als du dich umschaust, siehst du auf dem Boden einen Kompass"
                INPUT "liegen. Du hebst ihn auf.", asdf$
                GOTO 8
            ELSE INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
                GOTO 8
            END IF
        END IF
    END IF
               
    IF position = 2 THEN
        IF action = 1 THEN
            CLS
            INPUT "Du siehst einen Baumstumpf.", asdf$
            GOTO 8
        END IF
        IF action < 4 THEN
            INPUT "Diese Aktion zeigt keine Wirkung.", asdf$
            GOTO 8
        END IF
    END IF

    IF action = 4 THEN
        position = 1
        GOTO 8
    END IF

    IF action = 5 THEN
        position = 2
        GOTO 8
    END IF

    IF action = 6 THEN gehehin = 13
    IF action = 7 THEN gehehin = 7

    GOTO 8000

    800 COLOR 7
    LOCATE 3, 1
    PRINT "Kaum bist du in den Wald gekommen, wirst du von einem"
    PRINT "bewaffneten Soldaten angesprochen."
    LOCATE 6, 1: COLOR 3
    PRINT "Soldat: Halt!"
    PRINT "Der K�nig befiehlt niemanden alleine in den Wald zu"
    PRINT "lassen, wenn dieser keinen Kompass dabei hat."
    PRINT "Wenn du mir einen Kompass oder zumindest eine Sondererlaubnis "
    PRINT "vom K�nig vorzeigen kannst, kannst du passieren."
    INPUT "Sonst musst du umkehren.", asdf$
    COLOR 7
    PRINT
    INPUT "Der Soldat dr�ngt dich aus dem Wald raus.", asdf$
    gehehin = 7
    kannnichtindenwald = 1

    8000

END SUB

