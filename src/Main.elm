module Main exposing (..)

import Html exposing (text)


isOver9000 : Int -> String
isOver9000 powerLevel =
    if powerLevel > 9000 then
        "It's over 9000!"
    else
        "meh, nothing special."


assessments : List String
assessments =
    List.map isOver9000 [ 5, 1234, 6789, 9999 ]


main : Html.Html msg
main =
    toString assessments |> text
