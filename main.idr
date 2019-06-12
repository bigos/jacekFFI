module Main

%include C "mylib.h"
%link C "mylib.o"

myCallback : ()
myCallback = ()

myMult     : Int -> Int -> IO Int
myMult x y = foreign FFI_C "myMult"
                     (Int -> Int -> CFnPtr () -> IO Int)
                     x y (MkCFnPtr myCallback)

main : IO ()
main = do
  r <- myMult 5 4
  putStrLn ("doubled " ++ (show r))
