module Hello where

import Goodbye

foo :: Int -> String
foo x = "5"

bar :: Int -> String
bar y = foo y

foobar :: (Int -> Int) -> Int -> Int
foobar map input = map input

main :: Int
main = foobar (\x -> x) 7

baz :: Int
baz = goodbye "world"
