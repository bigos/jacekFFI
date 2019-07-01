CFLAGS = -g -Wall
GTKFLAGS1 = `pkg-config --cflags gtk+-3.0`
GTKFLAGS2 = `pkg-config --libs gtk+-3.0`

mylib.o: mylib.c mylib.h
gcc $(CFLAGS) $(GTKFLAGS1) mylib.c -c -o mylib.o $(GTKFLAGS2)

clean:
	rm -f jacekFFI mylib.o main.ibc a.out *.ibc

hmm: mylib.o
