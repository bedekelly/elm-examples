module Main exposing (..)

import Html exposing (div, h1, button, text)
import Html.Events exposing (onClick)
import Random


type alias Model =
    { dieFace : Int }


type Msg
    = Roll
    | NewFace Int


view : Model -> Html.Html Msg
view model =
    div []
        [ h1 [] [ text (toString model.dieFace) ]
        , button [ onClick Roll ] [ text "Roll" ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Roll ->
            ( model, Random.generate NewFace (Random.int 1 6) )

        NewFace newFace ->
            ( Model newFace, Cmd.none )


init : ( Model, Cmd msg )
init =
    ( Model 1, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
