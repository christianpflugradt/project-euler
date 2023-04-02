value1_9 :: Int -> Int
value1_9 1 = length("one")
value1_9 2 = length("two")
value1_9 3 = length("three")
value1_9 4 = length("four")
value1_9 5 = length("five")
value1_9 6 = length("six")
value1_9 7 = length("seven")
value1_9 8 = length("eight")
value1_9 9 = length("nine")
value1_9 n = 0

value11_19 :: Int -> Int
value11_19 1 = length("eleven")
value11_19 2 = length("twelve")
value11_19 3 = length("thirteen")
value11_19 4 = length("fourteen")
value11_19 5 = length("fifteen")
value11_19 6 = length("sixteen")
value11_19 7 = length("seventeen")
value11_19 8 = length("eighteen")
value11_19 9 = length("nineteen")
value11_19 n = 0

value10_90 :: Int -> Int
value10_90 1 = length("ten")
value10_90 2 = length("twenty")
value10_90 3 = length("thirty")
value10_90 4 = length("forty")
value10_90 5 = length("fifty")
value10_90 6 = length("sixty")
value10_90 7 = length("seventy")
value10_90 8 = length("eighty")
value10_90 9 = length("ninety")
value10_90 n = 0

valueTeenIfTeen :: Int -> Int
valueTeenIfTeen n
    | (tenPlace n) == 1 && (onePlace n) /= 0 = value11_19 (onePlace n)
    | otherwise = 0

valueNoneTeenIfNotTeen :: Int -> Int
valueNoneTeenIfNotTeen n
    | (tenPlace n) /= 1 || (onePlace n) == 0 = value10_90 (tenPlace n) + value1_9 (onePlace n)
    | otherwise = 0

valueAndIfAbove100 :: Int -> Int
valueAndIfAbove100 n
    | n > 100  = length("and")
    | otherwise = 0

value100IfAbove99 :: Int -> Int
value100IfAbove99 n
    | n  > 99 = length("hundred")
    | otherwise = 0

value1000IfAbove999 :: Int -> Int
value1000IfAbove999 n
    | n > 999 = length("thousand")
    | otherwise = 0

hundredPlace :: Int -> Int
hundredPlace n = div (mod n 1000 - mod n 100) 100

tenPlace :: Int -> Int
tenPlace n = div (mod n 100 - mod n 10) 10

onePlace :: Int -> Int
onePlace n = mod n 10

value :: Int -> Int
value n
    | n < 10 = value1_9 n
    | n == 1000 = (value1_9 1) + value1000IfAbove999 n
    | mod n 100 == 0 = (value1_9 (div n 100)) + value100IfAbove99 n
    | otherwise = value1_9 (hundredPlace n) + value100IfAbove99 n + valueTeenIfTeen n + valueNoneTeenIfNotTeen n + valueAndIfAbove100 n

main :: IO ()
main = do print (sum (map value [1..1000]))
