module Main exposing (..)

import Html exposing (text)


primitiveCount : Int -> String
primitiveCount number =
    case number of
        1 ->
            "one"

        2 ->
            "two"

        3 ->
            "three"

        4 ->
            "four"

        _ ->
            "many"


main : Html.Html msg
main =
    text
        (String.join ", " primitiveNumbers)


primitiveNumbers : List String
primitiveNumbers =
    List.map primitiveCount [ 1, 2, 3, 4, 5, 6, 7 ]
