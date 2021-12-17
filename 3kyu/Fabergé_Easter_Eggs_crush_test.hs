module Faberge where

heigth :: Integer -> Integer -> Integer 
heigth n m = a n 1 0
   where a 0 t h = h
         a i t h = a (i - 1) nt (h + nt) 
           where nt = div (t * (m - n + i)) (n + 1 - i)