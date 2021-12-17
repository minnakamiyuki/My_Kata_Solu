module Fibonacci where
import Data.List
import Data.Bits

fib' :: Int -> Integer
fib' n = snd . foldl' fib'' (1, 0) . dropWhile not $  testedBits
   where 
      testedBits = [testBit n k | k <- let s = bitSize n in [s-1, s-2..0]]
      fib'' (f, g) p
          | p = (f * (f + 2 * g), ss)
          | otherwise = (ss, g * (2 * f - g))
          where ss = f * f + g * g
          
fib :: Integer -> Integer
fib n 
   | n < 0 = - (-1)^(-n) * fib (-n)
   | otherwise = fib' $ fromIntegral n