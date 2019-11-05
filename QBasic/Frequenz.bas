10 cls

print "Dieses Programm gibt eine Sekunde lang die von"
print "Ihnen eingegebene Frequenz wieder."
print
input "Bitte geben sie die Frequenz an: ", f
sound f, 17
print

DO
input "nochmal (j/n)? ", f$
if f$ = "j" then goto 10
LOOP until f$ = "n"

print "By Viktor Seib, 22. Februar 2003"
input "", a

