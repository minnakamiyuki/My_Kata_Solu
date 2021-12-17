module Codewars.Kata.SumByFactors where
import Data.List
import Debug.Trace
import Data.Set (fromList, toList)

sumOfDivided :: [Integer] -> [(Integer, Integer)]
sumOfDivided xs = sod' xs $ toList . fromList $ pfo xs
sod' xs = map (\y -> (y, sum $ filter (\x -> mod x y == 0) xs))
pfo = concatMap $ pf . abs
pf :: Integer -> [Integer]
pf n = case factors of
    [] -> [n]
    _ -> factors ++ pf (div n (head factors))
  where factors = take 1 $ filter (\x -> mod n x == 0) [2..round $ sqrt $ fromIntegral n]