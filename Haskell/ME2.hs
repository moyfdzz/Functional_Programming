module ME2 where

-- Midterm Exam 02

-- Enigmas

-- 1 - Analyze the code
enigmaA :: [Int] -> [Int]
enigmaA n = error "Not implemented yet."

enigmaB :: [Double] -> Double -> [(Bool, Bool)]
enigmaB n x = error "Not implemented yet."

enigmaC :: [Int] -> Int -> Int
enigmaC n x = error "Not implemented yet."

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