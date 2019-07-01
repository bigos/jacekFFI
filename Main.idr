module Main

%flag C "-lgtk-3 -lgdk-3 -lpangocairo-1.0 -lpango-1.0 -latk-1.0 -lcairo-gobject -lcairo -lgdk_pixbuf-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0"
%include C "mylib.h"
%link C "mylib.o"

myCallback : Int -> Int
myCallback a = a * 5

myMult     : Int -> Int -> IO Int
myMult x y = foreign FFI_C "myMult"
           (Int -> Int -> CFnPtr (Int -> Int) -> IO Int)
           x y (MkCFnPtr myCallback)

-- looks like Idris does not have support for proper interaction with gtk
-- libraries due to sensitivity of the compilation arguments order and
-- my bad make file

zzz : IO Int
zzz = foreign FFI_C "zzz"
         (IO Int)


main : IO ()
main = do
  r <- myMult 5 4
  putStrLn ("doubled " ++ (show r))
  zzz
  putStrLn "koniec"
