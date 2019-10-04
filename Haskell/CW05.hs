module CW05 where

-- Retreiving the last element from a list
lastList :: [t] -> t
lastList [] = error "Empty list"
lastList [x] = x
lastList (_:y) = lastList y

-- Dividing a list in halves
divideList :: [t] -> ([t], [t])
divideList [] = ([], [])
divideList [t] = ([t], [])
divideList x = (take (length x `div` 2) x, drop (length x `div` 2) x) 

-- User-defined types: Student
data Student = Student Int [Char] Int deriving Show

sumGrades :: [Student] -> Int
sumGrades [] = 0
sumGrades ((Student _ _ grade) : y) = grade + sumGrades y 

-- User-defined types: Coordinates
data Coord = Coord Double Double deriving Show

sumCoordInt :: Coord -> Integer -> Coord
sunCoordInt c 0 = Coord c
sumCoordInt (Coord x y) n = Coord (x + (fromIntegral n)) (y + (fromIntegral n))