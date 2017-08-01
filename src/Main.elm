module Main exposing (..)

import Html exposing (li, ol, text)


main : Html.Html msg
main =
    viewStrings
        [ "Hello"
        , "ho" ++ "la"
        , String.reverse "stressed"
        , String.right 4 "foxglove"
        , String.left 20 multilineString
        ]


multilineString : String
multilineString =
    """
All happy families are alike; each unhappy family is unhappy in its own way.

All was confusion in the Oblonskys' house...
"""


viewStrings : List String -> Html.Html msg
viewStrings strings =
    ol [] (List.map viewString strings)


viewString : String -> Html.Html msg
viewString string =
    li [] [ text string ]
