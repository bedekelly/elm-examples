module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Decode


main : Program Never Model Msg
main =
    Html.program
        { init = init "cats"
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { topic : String
    , gifUrl : String
    , errorMsg : Maybe Http.Error
    }


init : String -> ( Model, Cmd Msg )
init topic =
    ( Model topic "waiting.gif" Nothing
    , getRandomGif topic
    )


type Msg
    = MorePlease
    | NewGif (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MorePlease ->
            ( model, getRandomGif model.topic )

        NewGif (Ok newUrl) ->
            ( Model model.topic newUrl Nothing, Cmd.none )

        NewGif (Err httpError) ->
            ( Model model.topic model.gifUrl (Just httpError), Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ h2 [] [ text model.topic ]
        , button [ onClick MorePlease ] [ text "More Please!" ]
        , br [] []
        , img [ src model.gifUrl ] []
        , br [] []
        , errorMsg model
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


getRandomGif : String -> Cmd Msg
getRandomGif topic =
    let
        url =
            "https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag="
                ++ topic
    in
        Http.send NewGif (Http.get url decodeGifUrl)


errorMsg : Model -> Html msg
errorMsg model =
    case model.errorMsg of
        Just msg ->
            text <| httpErrorToString msg

        Nothing ->
            text ""


decodeGifUrl : Decode.Decoder String
decodeGifUrl =
    Decode.at [ "data", "image_url" ] Decode.string


httpErrorToString : Http.Error -> String
httpErrorToString httpError =
    case httpError of
        Http.BadUrl url ->
            "Invalid URL: " ++ url

        Http.Timeout ->
            "Timeout!"

        Http.NetworkError ->
            "Network Error!"

        Http.BadPayload string response ->
            "Bad Payload: " ++ string

        Http.BadStatus response ->
            case response.status.code of
                400 ->
                    "Bad Request: " ++ response.body

                _ ->
                    "Bad Status: " ++ response.body
