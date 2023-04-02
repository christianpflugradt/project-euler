import Data.Char

fac :: Integer -> Integer
fac 1 = 1
fac n = n * (fac (n-1))

main :: IO()
main = do print (sum (map digitToInt (show (fac 100))))
