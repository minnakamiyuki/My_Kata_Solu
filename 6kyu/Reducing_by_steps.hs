module Codewars.G964.Operarray where

gcdi :: Integer -> Integer -> Integer
gcdi = gcd
lcmu :: Integer -> Integer -> Integer
lcmu = lcm
som :: Integer -> Integer -> Integer
som = (+)
maxi :: Integer -> Integer -> Integer
maxi = max
mini :: Integer -> Integer -> Integer
mini = min

operArray :: (Integer -> Integer -> Integer) -> [Integer] -> Integer -> [Integer]
operArray _ [] _ = []
operArray fxt (x:xs) init = next : operArray fxt xs next 
  where
       next = fxt x init