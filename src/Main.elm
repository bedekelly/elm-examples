module Main exposing (..)

import Markdown
import Html exposing (Html, fieldset, div, label, text, input)
import Html.Attributes exposing (style, type_, name)
import Html.Events exposing (onClick)


main =
    Html.beginnerProgram { model = chapter1, update = update, view = view }


type alias Model =
    { fontSize : FontSize
    , content : String
    }


type FontSize
    = Small
    | Medium
    | Large


chapter1 : Model
chapter1 =
    Model Medium intro


intro : String
intro =
    """
# Anna Karenina

## Chapter 1

Happy families are all alike; every unhappy family is unhappy in its own way.

Everything was in confusion in the Oblonskys' house. The wife had discovered
that the husband was carrying on an intrigue with a French girl, who had been
a governess in their family, and she had announced to her husband that she
could not go on living in the same house with him...
"""


type Msg
    = SwitchTo FontSize


update : Msg -> Model -> Model
update msg model =
    case msg of
        SwitchTo newFontSize ->
            { model | fontSize = newFontSize }


view : Model -> Html Msg
view model =
    div []
        [ fieldset []
            [ radio "Small" (SwitchTo Small)
            , radio "Medium" (SwitchTo Medium)
            , radio "Large" (SwitchTo Large)
            ]
        , Markdown.toHtml [ sizeToStyle model.fontSize ] model.content
        ]


radio : String -> msg -> Html msg
radio title msg =
    label
        [ style [ ( "padding", "20px" ) ]
        ]
        [ input [ type_ "radio", name "font-size", onClick msg ] []
        , text title
        ]


sizeToStyle : FontSize -> Html.Attribute msg
sizeToStyle size =
    let
        fontSize =
            case size of
                Small ->
                    "0.8em"

                Medium ->
                    "1em"

                Large ->
                    "1.2em"
    in
        style [ ( "font-size", fontSize ) ]
