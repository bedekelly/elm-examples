module Main exposing (..)

import Html exposing (text)


add : number -> number -> number
add x y =
    x + y


factorial : Int -> Int
factorial n =
    List.product (List.range 1 n)


main : Html.Html msg
main =
    factorial 4 |> add 1 |> toString |> text
