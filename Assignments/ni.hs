import Data.List
import System.IO

plus :: Integer -> [Integer] -> [Integer] -> [Integer]
plus b p q = add b p q 0

add :: Integer -> [Integer] -> [Integer] -> Integer -> [Integer]
add b p q n
    | emptyP /= True && emptyQ /= True = modulus : (add b (tail p) (tail q) carry)
    | emptyP /= True && emptyQ == True = modulus : (add b (tail p) [0] carry)
    | emptyP == True && emptyQ /= True = modulus : (add b [0] (tail q) carry)
    | carry /= 0 = modulus : carry : []
    | otherwise = modulus : []
    where carry = ((head p) + (head q) + n) `div` b
          modulus = ((head p) + (head q) + n) `mod` b
          emptyP = null (tail p)
          emptyQ = null (tail q)


times :: Integer -> [Integer] -> [Integer] -> [Integer]
times b p q = multiply b p q 0

multiply :: Integer -> [Integer] -> [Integer] -> Integer -> [Integer]
multiply b p q n
    | emptyP /= True && emptyQ /= True = modulus : (multiply b (tail p) (tail q) carry)
    | emptyP /= True && emptyQ == True = modulus : (multiply b (tail p) q carry)
    | emptyP == True && emptyQ /= True = modulus : (multiply b p (tail q) carry)
    | carry /= 0 = modulus : carry : []
    | otherwise = modulus : []
    where carry = (((head p) * (head q)) + n) `div` b
          modulus = (((head p) * (head q)) + n) `mod` b
          emptyP = null (tail p)
          emptyQ = null (tail q)
