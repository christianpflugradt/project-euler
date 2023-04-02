fibSequence :: [Integer]
fibSequence = 1 : 1 : zipWith (+) fibSequence (tail fibSequence)

indexedList :: [Integer] -> [(Integer, Integer)]
indexedList l = zip [1..] l

strLen1000 :: (Integer, Integer) -> Bool
strLen1000 (_, n) = length (show n) >= 1000

main :: IO ()
main = do print (fst (head (filter strLen1000 (indexedList fibSequence))))
