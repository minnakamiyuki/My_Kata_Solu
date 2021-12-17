module LeastCommonMultiple where
import Prelude hiding (lcm)

lcm :: Integral a => [a] -> a
lcm = foldl1 lcm'

lcm' x y = let z = gcd x y in if z == 0 then 0 else x*y `div` z