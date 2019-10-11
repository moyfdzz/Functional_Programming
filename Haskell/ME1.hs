module ME1 where

-- Midterm Exam 01
    
-- Enigmas
    
-- 1 - Analyze the code
enigmaA :: [Int] -> [Int] 
enigmaA x = (\x y -> map y x) x (\x -> x + 1)
    
enigmaB :: [Double] -> Double -> [(Bool , Bool)] 
enigmaB x y = zip (map (> y) x) (map (< y) x)

enigmaC :: [Int] -> Int -> Int 
enigmaC [] x = x 
enigmaC (x:xs) y = x * (enigmaC xs y)

enigmaD :: Char -> [(Char , Char)] -> [Char] 
enigmaD x [] = [x] 
enigmaD x ((a, b):c) = a:b:(enigmaD b c)
    
-- Problems
    
-- 2 - Summing the elements in a tree
data Tree = Tree Int Tree Tree | E deriving Show
    
sumElementsTree :: Tree -> Int
sumElementsTree E = 0
sumElementsTree (Tree node nodeLeft nodeRight) = node + (sumElementsTree nodeLeft) + (sumElementsTree nodeRight)
    
-- 3 - Sorting a table
insert:: ([Char],Int) -> [([Char],Int)] -> [([Char],Int)]
insert x [] = [x]
insert y (x:xs)
    | snd y < snd x = y:(x:xs)
    | otherwise = x: insert y xs

sortTable :: [([Char],Int)] -> [([Char],Int)]
sortTable [] = []
sortTable (x:xs) = insert x sortedRest
    where sortedRest = sortTable xs
    
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

-- 5 - Playing cards with data types
data Color = Red | Black deriving Show
data Suit = Clubs | Diamonds | Hearts | Spades deriving Show
data Rank = Jack | Queen | King | Ace deriving Show
data Card = Card (Rank, Suit) deriving Show

getValue :: Card -> Int
getValue (Card (Jack,_)) = 11
getValue (Card (Queen,_)) = 12
getValue (Card (King,_)) = 13
getValue (Card (Ace,_)) = 1

getColor :: Card -> Color
getColor (Card (_,Hearts)) = Red
getColor (Card (_,Diamonds)) = Red
getColor (Card (_,Spades)) = Black
getColor (Card (_,Clubs)) = Black