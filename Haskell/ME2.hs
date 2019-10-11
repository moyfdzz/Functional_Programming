module ME2 where

-- Midterm Exam 02

-- Enigmas

-- 1 - Analyze the code
enigmaA :: [t] -> Int -> [(t, Int)] 
enigmaA [] x = [] 
enigmaA (x:xs) y = if even (length (xs)) 
    then (x, length (x:xs) * y) : enigmaA (xs) y 
    else enigmaA xs y

enigmaB :: [Int] -> Int 
enigmaB [] = 0 
enigmaB (x:y) = x * 2

enigmaC :: [Int] -> [Int] -> Int 
enigmaC v w = sum (filter (>0) (map (\(x, y) -> x + y) (zip v w)))

-- Problemas

-- 2 - Removing the last n elements in a list
myTake :: Int -> [t] -> [t]
myTake _ [] = []
myTake 0 _ = []
myTake n lst = (head lst) : myTake (n - 1) (tail lst)

removeNElements :: Int -> [t] -> [t]
removeNElements _ [] = []
removeNElements n lst = myTake ((length lst) - n) lst

-- 3 - QuickSort
quickSort :: [Int] -> [Int]
quickSort [] = []
quickSort (x:y) = quickSort (filter (< x) y) ++ [x] ++ quickSort (filter (> x) y)

-- 4 - Complex numbers
data ComplexNumber = ComplexNumber Int Int deriving Show

add :: ComplexNumber -> ComplexNumber -> ComplexNumber
add (ComplexNumber r1 i1) (ComplexNumber r2 i2) = ComplexNumber (r1 + r2) (i1 + i2)

multiplication :: ComplexNumber -> ComplexNumber -> ComplexNumber
multiplication (ComplexNumber r1 i1) (ComplexNumber r2 i2) = ComplexNumber (r1 * r2) (i1 * i2)

getReal :: ComplexNumber -> Int
getReal (ComplexNumber r i) = r

getImaginary :: ComplexNumber -> Int
getImaginary (ComplexNumber r i) = i