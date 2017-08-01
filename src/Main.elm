module Main exposing (..)

import Html exposing (text)


four : Float
four =
    sqrt 16


eleven : Float
eleven =
    max 2 11


twenty : Float
twenty =
    max (sqrt 100) (4 * 5)


main : Html.Html msg
main =
    text (toString [ four, eleven, twenty ])
