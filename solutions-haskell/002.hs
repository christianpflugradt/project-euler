fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib(n - 1) + fib(n - 2)

main :: IO()
main = do print( sum( takeWhile ( < 4000000 ) [ fib x  | x <- [ 1 .. ], even x ] ) )
