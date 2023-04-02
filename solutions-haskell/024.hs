import Data.List

main :: IO ()
main = do print (concat (map show (sort (permutations [0,1,2,3,4,5,6,7,8,9])!!(1000000-1))))
