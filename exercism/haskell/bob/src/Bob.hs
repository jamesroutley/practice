module Bob (responseFor) where

import Text.Regex.PCRE

responseFor :: String -> String
responseFor xs
    | xs =~ "?\s*$"
