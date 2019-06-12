module Main

%include C "mylib.h"
%link C "mylib.o"

myCallback : Int -> Int
myCallback a = a * 5

myMult     : Int -> Int -> IO Int
myMult x y = foreign FFI_C "myMult"
           (Int -> Int -> CFnPtr (Int -> Int) -> IO Int)
           x y (MkCFnPtr myCallback)

zzz : Int -> List String -> IO Int
zzz c s = foreign FFI_C "zzz"
         (Int -> List String -> IO Int)
         c s

main : IO ()
main = do
  r <- myMult 5 4
  putStrLn ("doubled " ++ (show r))
  zzz 2 ["a","b"]
  putStrLn "koniec"
