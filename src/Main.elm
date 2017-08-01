module Main exposing (..)

import Html exposing (text)


four : Int
four =
    2 + 2


sixteen : Int
sixteen =
    8 * 2


eleven : Int
eleven =
    4 * 3 - 1


thirteen : Int
thirteen =
    (4 * 3) + 1


isTeenage : Int -> Bool
isTeenage age =
    age > 12 && age < 20


main : Html.Html msg
main =
    text
        (toString
            [ isTeenage four
            , isTeenage sixteen
            , isTeenage eleven
            , isTeenage thirteen
            ]
        )
