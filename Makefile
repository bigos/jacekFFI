CFLAGS = -g -Wall
GTKFLAGS1 = `pkg-config --cflags gtk+-3.0`

# output of the following needed in %flag C in Main.idr
# GTKFLAGS2 = `pkg-config --libs gtk+-3.0`

mylib.o: mylib.c mylib.h
	gcc $(CFLAGS) $(GTKFLAGS1) mylib.c -c -o mylib.o

clean:
	rm -f jacekFFI mylib.o main.ibc a.out *.ibc


hmm: mylib.o

val:
	vala --pkg gtk+-3.0 ./gui.vala
