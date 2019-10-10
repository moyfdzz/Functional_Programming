module HW09 where
import Data.List
import Data.Ord

-- 1 - Matrix multiplication
transposeMatrix :: [[Int]] -> [[Int]]
transposeMatrix ([] : _)  = []
transposeMatrix m = (map head m) : (transposeMatrix (map tail m))

matMult :: [[Int]] -> [[Int]] -> [[Int]]
matMult [] _ = []
matMult _ [] = []
matMult m1 m2 = 
    [ [ sum $ zipWith (*) normalM1 transposeM2 | transposeM2 <- (transposeMatrix m2) ] | normalM1 <- m1 ]

-- 2 - Table summarization
averageHeights :: [([Char],Int)] -> [([Char],Int)]
averageHeights tbl = 
    [("Male", sum mHeights `div` length mHeights), ("Female", sum fHeights `div` length fHeights)]
    where
    mHeights = map (\(g, h) -> h) $ filter (\(g, h) -> g == "Male") tbl
    fHeights = map (\(g, h) -> h) $ filter (\(g, h) -> g == "Female") tbl

-- 3 - List comprehension
heightsThreshold :: [([Char],Int)] -> Int -> [([Char],Int)]
heightsThreshold [] _ = []
heightsThreshold tbl t = (filter (\(g, h) -> h < t) tbl)

-- 4 - Operations on graphs
data Graph = Graph [(Int, Int)] deriving Show

mostRepeatedNode :: [Int] -> Int
mostRepeatedNode n = head (maximumBy (comparing length) (group n))

nodeLargestDegreeAux :: [(Int,Int)] -> Int
nodeLargestDegreeAux g = mostRepeatedNode (map (\(n1 , n2) -> n1) g)

nodeLargestDegree :: Graph -> Int
nodeLargestDegree (Graph g) = nodeLargestDegreeAux g

-- 5 - Finding a path in a graph
findPathInGraph :: Int -> Int -> [(Int,Int)] -> [[Int]]
findPathInGraph n1 n2 edges 
    | n1 == n2 = [[n2]]
    | otherwise = [
    n1:path 
        | edge<-edges, (fst edge) == n1,
        path <- (findPathInGraph (snd edge) n2 [e | e <- edges, e /= edge] )];

pathExistsAux :: [[Int]] -> Bool
pathExistsAux [] = False
pathExistsAux ([] : _) = False
pathExistsAux m
    | length (head m) == 0 = False
    | otherwise = True

pathExists :: Int -> Int -> Graph-> Bool
pathExists n1 n2 (Graph g) = pathExistsAux $ findPathInGraph n1 n2 g