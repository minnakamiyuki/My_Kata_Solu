{-# LANGUAGE RankNTypes #-}

module Haskell.Codewars.Church where

import Prelude hiding (succ)

newtype Number = Nr (forall a. (a -> a) -> a -> a)

zero :: Number
zero = Nr (\ _ z -> z)

succ :: Number -> Number
succ (Nr a) = Nr (\ s z -> s (a s z))

one :: Number
one = succ zero

add :: Number -> Number -> Number
add (Nr a) = a succ

mult :: Number -> Number -> Number
mult (Nr a) b = a (add b) zero

pow :: Number -> Number -> Number
pow a b = iterate (mult a) one !! fromIntegral (eval b) 
  where 
  eval :: Number -> Integer
  eval (Nr a) = a (+1) 0
