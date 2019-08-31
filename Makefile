CFLAGS = -g -Wall
GTKFLAGS1 = `pkg-config --cflags gtk+-3.0`

# output of the following needed in %flag C in Main.idr
# GTKFLAGS2 = `pkg-config --libs gtk+-3.0`

mylib.o: mylib.c mylib.h
	gcc $(CFLAGS) $(GTKFLAGS1) mylib.c -c -o mylib.o

clean:
	rm -f jacekFFI mylib.o main.ibc a.out *.ibc gui.c gui.h gio.o gui


hmm: mylib.o

valarun:
	vala --pkg gtk+-3.0 ./gui.vala

valac:
	valac --pkg gtk+-3.0 --pkg glib-2.0 --header=gui.h --save-temps gui.vala

gui.o: gui.c gui.h
	gcc $(CFLAGS) $(GTKFLAGS1) gui.c -c -o gui.o
error: glib-2.0 not found
