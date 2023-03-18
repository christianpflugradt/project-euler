sqrt' :: Int -> Float
sqrt' n = sqrt( fromIntegral n )

sqrtBonus :: Int -> Int
sqrtBonus n
    | ( floor( sqrt'( n ) ) * floor( sqrt'( n ) ) == n ) = 3
    | otherwise = 2

getDivisors :: Int -> Int
getDivisors 1 = 1
getDivisors n
    | n < 1 = 0
    | otherwise = length [ x | x <- [ 2 .. ceiling( sqrt' n ) ], mod n x == 0 ] * 2 + sqrtBonus n

moreThan500Divisors :: Int -> Bool
moreThan500Divisors n = getDivisors( n ) > 500

main :: IO()
main = do print( head( filter ( moreThan500Divisors ) [ ceiling( x * ( x + 1 ) / 2 ) | x <- [ 1 .. ] ] ) )
