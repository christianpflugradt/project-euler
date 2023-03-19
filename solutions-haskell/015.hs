main :: IO()
main = do print( floor( product [ 2 .. 40 ] / product [ 2 .. 20 ] / product [ 2 .. 20 ] ) )
