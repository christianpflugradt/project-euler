import Data.List
import Data.Maybe

main :: IO ()
main = do print (head ([a*b*c | a <- [1..998], b <- [1..998], c <- [1..998], a+b+c == 1000, a^2+b^2 == c^2]))
