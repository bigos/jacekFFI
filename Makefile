CFLAGS = -g -Wall

DEFAULT: mylib.o main.idr
	idris main.idr -o jacekFFI

clean:
	rm -f jacekFFI mylib.o main.ibc a.out
