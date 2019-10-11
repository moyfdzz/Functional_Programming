module ME3 where

-- Midterm Exam 03
    
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

-- Problemas

-- 2 - Lambda functions

myLambda = (\x y -> if x > y then x - y else x + y)

-- 3 - Recursion
{-
getMin :: Int -> [Int] -> Int
getMin n [] = n
getMin n (x:y)
    | n > x = getMin x y
    | otherwise = getMin n y

getMax :: Int -> [Int] -> Int
getMax n [] = n
getMax n (x:y)
    | n < x = getMax x y
    | otherwise = getMax n y

recursion :: [Int] -> (Int, Int)
recursion [] = (0,0)
recursion (x:y) = 
    (minN, maxN)
    where
    minN = getMin x y
    maxN = getMax x y
-}

getMinMax :: Int -> Int -> [Int] -> (Int, Int)
getMinMax minN maxN [] = (minN, maxN)
getMinMax minN maxN lst
    | minN > (head lst) = getMinMax (head lst) maxN lst
    | maxN < (head lst) = getMinMax minN (head lst) lst
    | otherwise = getMinMax minN maxN (tail lst)

recursion :: [Int] -> (Int, Int)
recursion [] = (0,0)
recursion (x:y) = getMinMax x x y

-- 4 - The RGB color mode
data RGB = RGB (Int, Int, Int) deriving Show

getR :: RGB -> Int
getR (RGB (red, green, blue)) = red

getG :: RGB -> Int
getG (RGB (red, green, blue)) = green

getB :: RGB -> Int
getB (RGB (red, green, blue)) = blue

getMaxComponent :: RGB -> ([Char], Int)
getMaxComponent (RGB (red, green, blue)) = if red > green
    then if red > blue
        then ("Red", red)
        else ("Blue", blue)
    else if green > blue
        then ("Green", green)
        else ("Blue", blue)

combine :: RGB -> RGB -> RGB
combine (RGB (red1, green1, blue1)) (RGB (red2, green2, blue2)) = RGB (((red1 + red2) `div` 2), ((green1 + green2) `div` 2),((blue1 + blue2) `div` 2))