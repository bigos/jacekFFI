CFLAGS = -g -Wall `pkg-config --cflags gtk+-3.0` `pkg-config --libs gtk+-3.0`

DEFAULT: mylib.o main.idr
	idris main.idr -o jacekFFI

clean:
	rm -f jacekFFI mylib.o main.ibc a.out
