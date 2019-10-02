module HW08 where

-- Complete the following functions and submit your file to Canvas.

-- ========= IMPORTANT ==========
-- Change the name of the file so that it contains your student ID or name.
-- Do not change the names of the functions. The system will specifically look for the names used in this file. Changing the name of a function will automatically make you lose the points for that function.
-- Do not change the number of arguments in the functions. Changing the number of arguments of a function will automatically make you lose the points for that function.
-- Make sure that nothing additional is printed as the result of running this file. Avoid printing names, student IDs, or any other messages. If you print anything else, the system will wrongly grade your solutions.
-- If your file cannot be loaded by the Haskell compiler, your grade will be zero. Then, submit only code that works.

-- Inverts a list
invert :: [t] -> [t]
invert [] = []
invert (h:t) = invert t ++ [h]

-- Evaluation of polynomials
evaluate :: [Double] -> Double -> Double
evaluate [] x = 0
evaluate (h:t) x = evaluate t x + h * x ^ length t

-- Cleans a string. Given a string, return recursively a "cleaned" string where adjacent chars that are the same have been reduced to a single char. So "yyzzza" yields "yza".
cleanString :: [Char] -> [Char]
cleanString [] = []
cleanString [x] = [x]
cleanString (x:y) = if x == head y
                    then cleanString y
                    else [x] ++ cleanString y

-- Multiples
multiples :: [Int] -> Int -> [Int]
multiples [] _ = []
multiples (x:y) n = if x `mod` n == 0
                  then x : multiples y n
                  else multiples y n

-- Returns a string with the binary representation of an integer value
toBinaryString :: Int -> [Char]
toBinaryString 0 = "0"
toBinaryString 1 = "1"
toBinaryString x = if x `mod` 2 == 1
                    then toBinaryString (div x 2) ++ "1"
                    else toBinaryString (div x 2) ++ "0"


-- Insertion sort
insertionSortAux :: Int -> [Int] -> [Int]
insertionSortAux y [] = [y]
insertionSortAux y (x:xs) = if x > y 
                            then y:x:xs
                            else x:insertionSortAux y xs

insertionSort :: [Int] -> [Int]
insertionSort [] = []
insertionSort [x] = [x]
insertionSort (x:y) = insertionSortAux x (insertionSort y)