import Data.Char

sqrt' :: Int -> Float
sqrt' n = sqrt (fromIntegral n)

divisorSum :: Int -> Int
divisorSum n = sum [x+(div n x) | x <- [2..ceiling(sqrt' n)], mod n x == 0] + 1

main :: IO()
main = do print (sum [x+y | x <- [1..9998], y <- [(x+1)..9999], x /= y, (divisorSum x) == y, (divisorSum y) == x])
