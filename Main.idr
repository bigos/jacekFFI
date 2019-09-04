module Main

import Data.Vect

-- same as " `pkg-config --cflags --libs gtk+-3.0 glib-2.0`
%flag C "-pthread -I/usr/include/gtk-3.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/gtk-3.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libpng16 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -lgtk-3 -lgdk-3 -lpangocairo-1.0 -lpango-1.0 -latk-1.0 -lcairo-gobject -lcairo -lgdk_pixbuf-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0"

-- Vala
%include C "gui.h"
%link C "gui.o"

idrisGreeting : String
idrisGreeting = "Greetings from Idris"

myCallback : Int -> Int
myCallback a = a * 5

myMult     : Int -> Int -> IO Int
myMult x y = foreign FFI_C "myMult"
           (Int -> Int -> CFnPtr (Int -> Int) -> IO Int)
           x y (MkCFnPtr myCallback)

zzz : IO Int
zzz = foreign FFI_C "zzz"
    (IO Int)

append : Vect n a -> Vect m a -> Vect (n + m) a
append [] ys = ys
append (x :: xs) ys = x :: append xs ys

gui_args : String
gui_args = "any"

run_gui : IO Int
run_gui = foreign FFI_C "vala_main" (String -> Int -> IO Int)
        "" 0                    -- do not change it or it will crash

comFn : String -> String
comFn a = "result: " ++ a

-- this shows that we would need c code generation at runtime to make it work
-- https://github.com/idris-lang/Idris-dev/issues/4391

set_afni : IO ()
set_afni = foreign FFI_C "set_afni"
         (CFnPtr (String -> String) -> IO ())
         (MkCFnPtr comFn)


main : IO ()
main = do
  r <- myMult 5 4
  putStrLn ("doubled " ++ (show r))
  s <- zzz
  putStrLn ("Now you should see GUI and some result" ++ (show s))
  set_afni
  result <- run_gui
  putStrLn ("final result " ++ (show result))
