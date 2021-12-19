module Codewars.Kata.DigPow where
import Data.Char

digpow :: Integer -> Integer -> Integer
digpow n p 
   | sum' `mod` n == 0 = sum' `div` n
   | otherwise = -1
   where sum' = fromIntegral $ sum $ zipWith (^) (map digitToInt $ show n) [p..]