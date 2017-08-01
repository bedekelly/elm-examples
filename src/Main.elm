module Main exposing (..)

import String
import Html exposing (text)


capitalize : String -> String
capitalize word =
    let
        firstLetter =
            String.left 1 word

        otherLetters =
            String.dropLeft 1 word
    in
        String.toUpper firstLetter ++ otherLetters


main : Html.Html msg
main =
    "who ate all the pie?" |> capitalize |> text
