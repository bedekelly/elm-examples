module Main exposing (..)

import Html exposing (Html, div, input, text)
import Html.Attributes exposing (type_, placeholder, style)
import Html.Events exposing (onInput)


main =
    Html.beginnerProgram { model = model, view = view, update = update }


type alias Model =
    { name : String
    , password : String
    , passwordAgain : String
    , hasTyped : Bool
    }


model : Model
model =
    Model "" "" "" False


type Msg
    = Name String
    | Password String
    | PasswordAgain String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Name name ->
            { model | name = name, hasTyped = True }

        Password password ->
            { model | password = password, hasTyped = True }

        PasswordAgain passwordAgain ->
            { model | passwordAgain = passwordAgain, hasTyped = True }


view : Model -> Html Msg
view model =
    div []
        [ input [ type_ "text", placeholder "Name", onInput Name ] []
        , input [ type_ "password", placeholder "Password", onInput Password ] []
        , input [ type_ "password", placeholder "Password (Again)", onInput PasswordAgain ] []
        , viewValidation model
        ]


viewValidation : Model -> Html msg
viewValidation model =
    let
        ( color, message ) =
            if (not model.hasTyped) then
                ( "green", "OK" )
            else if (model.password == model.passwordAgain) && (model.password /= "") then
                ( "green", "OK" )
            else if model.password == "" then
                ( "red", "Password cannot be empty!" )
            else
                ( "red", "Passwords do not match!" )
    in
        div [ style [ ( "color", color ) ] ] [ text message ]
