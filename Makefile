CFLAGS = -g -Wall
GTKFLAGS1 = `pkg-config --cflags gtk+-3.0`
GTKFLAGS2 = `pkg-config --libs gtk+-3.0`

DEFAULT: mylib.o main.idr
	idris main.idr -o jacekFFI

clean:
	rm -f jacekFFI mylib.o main.ibc a.out
hmm:
	gcc $(CFLAGS) $(GTKFLAGS1) mylib.c -c -o mylib.o $(GTKFLAGS2)
