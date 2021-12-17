module Perfect (findNextSquare) where

findNextSquare :: Integer -> Integer
findNextSquare x | x == y =z
                 | otherwise = -1
                 where (y:z:_) = dropWhile (<x) $ (^2) <$> [0..]