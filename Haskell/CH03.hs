module CH03 where
import Data.List
import Data.Ord

-- Transpose of a matrix
data Matrix = Matrix [[Int]] deriving Show

transposeMatrixAux :: [[Int]] -> [[Int]]
transposeMatrixAux ([] : _) = []
transposeMatrixAux m = (map head m) : transposeMatrixAux (map tail m)

transposeMatrix :: Matrix -> Matrix
transposeMatrix (Matrix m) = Matrix (transposeMatrixAux m)

{-
    en una función recibir un elemento y una lista, contar cuántas veces está ahí y regresarlo en una tupla
    map a esa función para guardar las tuplas en una lista

-}

-- Mode
{-
findOcurrence :: [(Int, Int)] -> Int -> Int
findOcurrence ([] : _) x = []
findOcurrence ((n ocurrences) : y) x
    | ocurrences > x == findOcurrence y ocurrences
    | otherwise = findOcurrence y x

countOcurrences :: [Int] -> Int -> (Int, Int)
countOcurrences [] _ = 0
countOcurrences (x:y) n
    | x == n = 1 + (countOcurrences y n)
    | otherwise = countOcurrences y n

mode :: [Int] -> [Int]
mode [] = error "The mode for an empty list is not defined"
mode (x:y) = findOcurrence (map (countOcurrences (x:y) x) (x:y)) 0
-}

modeAux :: [Int] -> [Int]
modeAux x = (maximumBy (comparing length) (group (mergeSort x)))

mode :: [Int] -> Int
mode [] = error "The mode for an empty list is not defined"
mode x = head (modeAux x)

{-
    Sets
-}

-- Data type for representing sets of integers
data Set = Set [Int] deriving Show

-- Insert an element in the set
insertSetAux :: [Int] -> Int -> [Int]
insertSetAux [] n = [n]
insertSetAux s n 
    | elem n s = s
    | otherwise = s ++ [n]

insertSet :: Set -> Int -> Set
insertSet (Set s) n = Set (insertSetAux s n)

-- Remove an element from an exisiting set
removeSetAux :: [Int] -> Int -> [Int]
removeSetAux [] _ = []
removeSetAux (x:y) n
    | x == n = removeSetAux y n
    | otherwise = x : removeSetAux y n

removeSet :: Set -> Int -> Set
removeSet (Set s) n = Set (removeSetAux s n)

-- Union of two sets
unionSetAux :: [Int] -> [Int] -> [Int]
unionSetAux [] [] = []
unionSetAux s1 [] = s1
unionSetAux [] s2 = s2
unionSetAux (x:y) s2 = insertSetAux (unionSetAux s2 y) x

unionSet :: Set -> Set -> Set
unionSet (Set s1) (Set s2) = Set (unionSetAux s1 s2)

-- Intersection of two sets
intersectionSetAux :: [Int] -> [Int] -> [Int]
intersectionSetAux [] [] = []
intersectionSetAux _ [] = [] 
intersectionSetAux [] _ = []
intersectionSetAux (x:y) s2
    | elem x s2 = x : intersectionSetAux y s2
    | otherwise = intersectionSetAux y s2

intersectionSet :: Set -> Set -> Set
intersectionSet (Set s1) (Set s2) = Set (intersectionSetAux s1 s2)

-- Merge sort
mergeSortAux :: [Int] -> [Int] ->[Int]
mergeSortAux x [] = x
mergeSortAux [] y = y
mergeSortAux (x:xs) (y:ys)
    | x < y = x : (mergeSortAux xs (y:ys))
    | otherwise = y : (mergeSortAux (x:xs) ys)

mergeSort :: [Int] -> [Int]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort m = mergeSortAux (mergeSort (take (length m `div` 2) m )) (mergeSort (drop (length m `div` 2) m))