CFLAGS = -g -Wall
GTKFLAGS1 = `pkg-config --cflags gtk+-3.0 glib-2.0`

# output of the following needed in %flag C in Main.idr
# GTKFLAGS2 = `pkg-config --libs gtk+-3.0`

mylib.o: mylib.c mylib.h
	gcc $(CFLAGS) $(GTKFLAGS1) mylib.c -c -o mylib.o

clean:
	rm -f jacekFFI mylib.o main.ibc a.out *.ibc gui.c gui.h gui.o gui

hmm: mylib.o

valarun:
	vala --pkg gtk+-3.0 ./gui.vala

# compile vala file renaming main to avoid conflict with Idris
valac: gui.vala
	valac --main=vala_main --pkg gtk+-3.0 --pkg glib-2.0 --header=gui.h --save-temps gui.vala
	sed -i 's/main (/renamed_main (/g' gui.c

gui.c: valac

gui.o: gui.c gui.h valac
	gcc $(CFLAGS) $(GTKFLAGS1) gui.c -c -o gui.o

# create Idris executable
app: gui.o
	idris --build ./jacekFFI.ipkg
