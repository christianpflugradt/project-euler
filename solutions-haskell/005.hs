import Data.List
import Data.Maybe

isDivisibleBy1To20 :: Integer -> Bool
isDivisibleBy1To20 n = sum ([mod n x | x <- [
                2 * 2 * 5, -- 20
                19, 2 * 3 * 3, -- 18
                17, 2 * 2 * 2 * 2, -- 16
                13, 11,  7 ]]) == 0

main :: IO ()
main = do print (fromJust (find isDivisibleBy1To20 [x * 20 | x <- [fromIntegral (div 2520 20)..]]))
