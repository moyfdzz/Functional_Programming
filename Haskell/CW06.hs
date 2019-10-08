module CW06 where

enigmaA :: Int -> Int -> [Int]
enigmaA 0 _ = []
enigmaA _ 0 = []
enigmaA n m = take (m - n) [n..]

-- enigmaA 0 10
-- enigmaA 5 10

enigmaB :: (Int, Int, [Int]) -> [Int]
enigmaB (x, 0, (y:z)) = [x, 0, y]
enigmaB (x, y, []) = [y, x]
enigmaB (x, y, z) = filter (> x * y) z

-- enigmaB (1,3,[6,-2,5])
-- enigmaB (9,0,[2,3,1])

enigmaC :: [t] -> t
enigmaC [] = error "Empty list."
enigmaC (x:y:z) = y

-- enigmaC [1,2]
-- enigmaC [3,2,1]

enigmaD :: [Int] -> [Int] -> [Int]
enigmaD _ [] = []
enigmaD [] _ = []
enigmaD a b = [xs * ys | (x, xs) <- z, (y, ys) <- z] where
    z = zip (reverse a) b

-- enigmaD [1,2] [3,4]
-- enigmaD [0,3] [2,1]

enigmaE :: [Int] -> Int -> [[Int]]
enigmaE [] z = [z:[]]
enigmaE (x:y) z = [x * 2] : enigmaE y (z + 1)

-- (\x -> enigmaE x (length x)) [3,2,1]
-- (\y -> enigmaE y 2) [2,-2]