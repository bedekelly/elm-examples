module Main exposing (..)

import Html exposing (beginnerProgram, fieldset, label, text, input, Html)
import Html.Attributes exposing (style, type_)
import Html.Events exposing (onClick)


main : Program Never Model Msg
main =
    beginnerProgram { model = model, update = update, view = view }


type alias Model =
    { notifications : Bool
    , autoplay : Bool
    , location : Bool
    }


model : Model
model =
    Model False False False


type Msg
    = ToggleNotifications
    | ToggleAutoplay
    | ToggleLocation


update : Msg -> Model -> Model
update msg model =
    case msg of
        ToggleNotifications ->
            { model | notifications = (not model.notifications) }

        ToggleAutoplay ->
            { model | autoplay = (not model.autoplay) }

        ToggleLocation ->
            { model | location = (not model.location) }


view : Model -> Html Msg
view model =
    fieldset []
        [ checkbox ToggleNotifications "Email Notifications"
        , checkbox ToggleAutoplay "Video Autoplay"
        , checkbox ToggleLocation "Use Location"
        ]


checkbox : Msg -> String -> Html Msg
checkbox msg name =
    label
        [ style [ ( "padding", "20px" ) ] ]
        [ input [ type_ "checkbox", onClick msg ] []
        , text name
        ]
