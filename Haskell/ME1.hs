module ME1 where

-- Midterm Exam 01
    
-- Enigmas
    
-- 1 - Analyze the code
enigmaA :: [Int] -> [Int]
enigmaA n = error "Not implemented yet."
    
enigmaB :: [Double] -> Double -> [(Bool, Bool)]
enigmaB n x = error "Not implemented yet."
    
enigmaC :: [Int] -> Int -> Int
enigmaC n x = error "Not implemented yet."
    
enigmaD :: Char -> [(Char, Char)] -> [Char]
enigmaD n x = error "Not implemented yet."
    
-- Problems
    
-- 2 - Summing the elements in a tree
data Tree = Tree Int Tree Tree | E deriving Show
    
sumElementsTree :: Tree -> Int
sumElementsTree E = 0
sumElementsTree (Tree node nodeLeft nodeRight) = node + (sumElementsTree nodeLeft) + (sumElementsTree nodeRight)
    
-- 3 - Sorting a table
sortTable :: [([Char], Int)] -> [([Char],Int)]
sortTable [] = []
sortTable tbl = error "Not implemented yet."
    
-- 4 - Crossover in genetic algorithms
myTake :: [Char] -> Int -> [Char]
myTake [] _ = []
myTake (_) 0 = []
myTake lst n = (head lst) : myTake (tail lst) (n - 1)
    
myDrop :: [Char] -> Int -> [Char]
myDrop [] _ = []
myDrop lst 0 = lst
myDrop lst n = myDrop (tail lst) (n - 1)
    
crossover :: [Char] -> [Char] -> Int -> ([Char], [Char])
crossover p1 p2 k = 
    (offspring1, offspring2)
    where
    offspring1 = (myTake p1 k) ++ (myDrop p2 k)
    offspring2 = (myTake p2 k) ++ (myDrop p1 k)