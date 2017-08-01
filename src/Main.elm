module Main exposing (..)

import Html exposing (Html, Attribute, beginnerProgram, text, div, input)
import Html.Attributes exposing (placeholder, style)
import Html.Events exposing (onInput)


main : Program Never String Msg
main =
    beginnerProgram { model = "", view = view, update = update }


type Msg
    = NewContent String


update : Msg -> a -> String
update (NewContent content) oldContent =
    content


view : String -> Html Msg
view content =
    div []
        [ input [ placeholder "Text to reverse", onInput NewContent, myStyle ] []
        , div [ myStyle ] [ text (String.reverse content) ]
        ]


myStyle : Attribute msg
myStyle =
    style
        [ ( "width", "100%" )
        , ( "height", "40px" )
        , ( "padding", "10px 0" )
        , ( "font-size", "2em" )
        , ( "text-align", "center" )
        ]
