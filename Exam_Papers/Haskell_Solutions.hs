-- 2018 January
tear :: (Ord a) => (a -> Bool) -> [a] -> [[a]]
tear p l1 = (filter p l1) : [(filter (not.p) l1)]
-- Example => tear (>5) [1,10,2,12,3,13] => [[10,12,13],[1,2,3]]


-- 2018 Autumn
mapSkip :: (Ord a) => (a -> a) -> [a] -> [a]
mapSkip p l1
    | (null l1) = []
    | (null (tail l1)) = map p l1
    | otherwise = (p (head l1)) : (head (tail l1)) : mapSkip p (tail (tail l1)) 
-- Example => mapSkip (+1000) [1..6] => [1001,2,1003,4,1005,6]


-- 2017 January
weaveHunks :: Int -> [a] -> [a] -> [a]
weaveHunks n l1 l2
    | (null l1) = l2
    | (null l2) = l1
    | otherwise = (take n l1) ++ (weaveHunks n l2 (drop n l1))
-- Example => weaveHunks 2 [1..10] [11..20] => [1,2,11,12,3,4,13,14,5,6,15,16,7,8,17,18,9,10,19,20]


-- 2017 Autumn
foo :: [a] -> [a] -> [a]
foo l1 l2 = _foo l1 l2 1

_foo :: [a] -> [a] -> Int -> [a]
_foo l1 l2 n
    | (null l1) = l2
    | (null l2) = l1
    | otherwise = (take n l1) ++ (_foo l2 (drop n l1) (n + 1))
-- Example => foo [1,2,3,4,5,6,7,8] [11,12,13,14,15,16,17,18]=> [1,11,12,2,3,4,13,14,15,16,5,6,7,8,17,18]


-- 2016 January
revCount :: [a] -> [Int] -> [a]
revCount l1 l2
    | (null l1) = []
    | otherwise = (take (last l2) (repeat (last l1))) ++ revCount (init l1) (init l2)
-- Example => revCount ['a','b','c'] [1,2,3] => "cccbba"


-- 2016 Autumn
tr :: [[a]] -> [[a]]
tr l1 
    | (null (head l1)) = []
    | otherwise = (map head l1) : (tr (map tail l1))
-- Example => tr ["foxes","socks","rocks"]=>   ["fsr","ooo","xcc","ekk","sss"]

-- 2015 January
afterFilter :: (Ord a) => (a -> Bool) -> [a] -> [a]
afterFilter p l1 
    | (null l1) = []
    | (null (tail l1)) = []
    | (p (head l1)) = (head (tail l1)) : afterFilter p (tail l1)
    | otherwise = afterFilter p (tail l1)
-- Example => afterFilter (<0) [-4,7,-4,-8,3,-3,-6,0,-9,-1] => [7,-8,3,-6,0,-1]

-- 2015 Autumn
_revCount :: [a] -> [Int] -> [a]
_revCount l1 l2
    | (null l1) = []
    | otherwise = (take (last l2) (repeat (last l1))) ++ _revCount (init l1) (init l2)
-- Example => _revCount ['a','b','c'] [1,2,3] => "cccbba"