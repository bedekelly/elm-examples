module Main exposing (..)

import Html exposing (text)


four : number
four =
    2 + 2


sixteen : number
sixteen =
    8 * 2


eleven : number
eleven =
    4 * 3 - 1


thirteen : number
thirteen =
    (4 * 3) + 1


isTeenage : comparable -> Bool
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
