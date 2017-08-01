module Main exposing (..)

import Html exposing (text)


isNotSpace : Char -> Bool
isNotSpace char =
    char /= ' '


weirdReversal : String -> String
weirdReversal =
    String.reverse >> String.toUpper >> String.filter isNotSpace


main : Html.Html msg
main =
    text (weirdReversal "s t r e s s e d ")
