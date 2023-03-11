sqrt' :: Int -> Float
sqrt' n = sqrt( fromIntegral n )

isPrime :: Int -> Bool
isPrime 2 = True
isPrime n
    | n < 2 = False
    | ( length [ x | x <- [ 2 .. ceiling( sqrt' n ) ], mod n x == 0 ] ) > 0 = False
    | otherwise = True

main :: IO()
main = do print( [ x | x <- [ 1, 3 .. ], isPrime x ]!!(10001-2) )
