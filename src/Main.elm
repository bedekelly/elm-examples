module Main exposing (..)

import Html exposing (text, Html)


isNear : Int -> Int -> Bool
isNear x y =
    abs (x - y) < 10


increment : Int -> Int
increment x =
    x + 1


main : Html msg
main =
    text (toString (isNear 72 (increment 75)))
