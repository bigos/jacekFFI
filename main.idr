module Main

%include C "mylib.h"
%link C "mylib.o"

myMult     : Int -> Int -> IO ()
myMult x y = foreign FFI_C "myMult" (Int -> Int -> IO ()) x y

main : IO ()
main = do
  myMult 5 4
