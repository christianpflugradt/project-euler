nextCollatz :: Int -> Int
nextCollatz n
    | even n = fromIntegral( div n 2 )
    | otherwise = n * 3 + 1

collatzLength :: Int -> Int -> Int
collatzLength n l
    | n == 1 = l
    | n > 1 = collatzLength ( nextCollatz( n ) ) ( l + 1 )

collatzLength' :: Int -> Int
collatzLength' n = collatzLength n 1

main :: IO()
main = do print( snd( maximum [ (collatzLength' x, x) | x <- [ 2 .. 999999 ] ] ) )
