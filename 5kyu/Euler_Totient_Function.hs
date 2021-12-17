module EulerTotient (totient) where
import Data.List (nub)
import Data.Ratio

totient :: (Integral a) => a -> a
totient 1 = 1
totient n = numerator ratio `div` denominator ratio
    where ratio = foldl (\acc x -> acc * (1 - (1 % x)))
                    (n % 1) $ nub (primeFactors n)
            where primeFactors n = primeFactors' n 2
                     where 
                       primeFactors' n f 
                         | f*f > n = [n]
                         | n `mod` f == 0 = f : primeFactors' (n `div` f) f
                         | otherwise = primeFactors' n (f+1)