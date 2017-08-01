module Main exposing (..)

import Html exposing (text, li, ul)
import Html.Attributes exposing (class)


main : Html.Html msg
main =
    ul [ class "shopping-list" ]
        [ li [] [ text "Pamplemoose" ]
        , li [] [ text "Ananas" ]
        , li [] [ text "Jus d'Orange" ]
        , li [] [ text "Boeuf" ]
        , li [] [ text "Soup du Jour" ]
        , li [] [ text "Camembert" ]
        , li [] [ text "Jacques Cousteau" ]
        , li [] [ text "Baguette" ]
        ]
