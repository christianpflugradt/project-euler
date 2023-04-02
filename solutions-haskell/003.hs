sqrt' :: Int -> Float
sqrt' n = sqrt (fromIntegral n)

isPrime :: Int -> Bool
isPrime 2 = True
isPrime n
    | n < 2 = False
    |  (length [x | x <- [2 .. ceiling (sqrt' n)], mod n x == 0 ]) > 0 = False
    | otherwise = True

main :: IO ()
main = do
    let a = 600851475143 
    let asqrt = ceiling (sqrt' a)
    print (head ([ x | x <- [ asqrt, asqrt-1 .. 1], mod a x == 0, isPrime x]))
