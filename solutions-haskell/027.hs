import Data.Function
import Data.List

sqrt' :: Int -> Float
sqrt' n = sqrt (fromIntegral n)

isPrime :: Int -> Bool
isPrime 2 = True
isPrime n
    | n < 2 = False
    |  (length [x | x <- [2 .. ceiling (sqrt' n)], mod n x == 0 ]) > 0 = False
    | otherwise = True

productChainLength :: (Int, Int) -> (Int, Int)
productChainLength (a, b) = ((length (takeWhile isPrime [n^2+a*n+b | n <- [1..]])), a*b)

main :: IO ()
main = do print (snd (maximumBy (on compare fst) (map productChainLength [(a, b) | a <- [-999..999], b <- [-999..999]])))
