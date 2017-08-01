module Main exposing (..)

import Html exposing (text)


increment : Int -> Int
increment n =
    n + 1


add1 : Int -> Int
add1 =
    \n -> n + 1


main : Html.Html msg
main =
    add1 40 |> increment |> toString |> text
