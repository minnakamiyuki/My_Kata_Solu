module Foldmap where

import Data.Foldable (foldMap, Foldable)
import Data.Monoid

myToList :: Foldable t => t a -> [a]
myToList = myFoldr (:) []

myMinimum :: (Ord a, Foldable t) => t a -> Maybe a
myMinimum x = case myToList x of
    [] -> Nothing
    as -> Just $ minimum as

myFoldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
myFoldr f x y = appEndo (foldMap (Endo . f) y) x