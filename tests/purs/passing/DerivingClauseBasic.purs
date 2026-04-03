module Main where

import Prelude
import Effect.Console (log)
import Test.Assert (assert)

newtype Wrapped a = Wrapped a

instance Show a => Show (Wrapped a) where
  show (Wrapped x) = show x

type WrappedString = Wrapped String

-- Attached derive via with parens
newtype MyInt = MyInt Int
  derive (Show) via (Wrapped Int)

-- Attached derive via with type synonym
newtype Name = Name String
  derive (Show) via WrappedString

-- Attached derive mixed with standalone derive
data Color = Red | Green | Blue
  derive (Eq)

derive instance Ord Color

-- via still works as identifier and record label
via :: Int
via = 42

viaRecord :: { via :: Int }
viaRecord = { via: 1 }

main = do
  assert $ show (MyInt 42) == "42"
  assert $ show (Name "hello") == "\"hello\""
  assert $ Red == Red
  assert $ Red < Green
  assert $ via == 42
  assert $ viaRecord.via == 1
  log "Done"
