import Data.List
import Data.Maybe

isDivisibleBy1To20 :: Integer -> Bool
isDivisibleBy1To20 n = ( mod n 19 == 0 &&
                        mod n 18 == 0 &&
                        mod n 17 == 0 &&
                        mod n 16 == 0 &&
                        mod n 13 == 0 &&
                        mod n 11 == 0 &&
                        mod n 7 == 0 )

main :: IO()
main = do print( fromJust ( find( isDivisibleBy1To20 ) [ x * 20 | x <- [ fromIntegral( div 2520 20 ) .. ] ] ) )
