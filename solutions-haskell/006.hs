main :: IO()
main = do print( abs( sum( [ x * x | x <- [ 1 .. 100 ] ] ) - sum( [ 1 .. 100 ] ) ^ 2 ) )
