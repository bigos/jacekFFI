module Main

%include C "mylib.h"
%link C "mylib.o"

myMult     : Int -> Int -> IO Int
myMult x y = foreign FFI_C "myMult"
                     (Int -> Int -> IO Int)
                     x y

main : IO ()
main = do
  r <- myMult 5 4
  putStrLn ("doubled " ++ (show r))
