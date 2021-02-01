module Shared exposing
    ( Flags
    , Model
    , Msg
    , init
    , subscriptions
    , update
    , view
    )

import Browser.Navigation exposing (Key)
import Html exposing (..)
import Html.Attributes exposing (..)
import Spa.Document exposing (Document)
import Spa.Generated.Route as Route
import Url exposing (Url)



-- INIT


type alias Flags =
    ()


type alias Model =
    { url : Url
    , key : Key
    }


init : Flags -> Url -> Key -> ( Model, Cmd Msg )
init flags url key =
    ( Model url key
    , Cmd.none
    )



-- UPDATE


type Msg
    = ReplaceMe


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ReplaceMe ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view :
    { page : Document msg, toMsg : Msg -> msg }
    -> Model
    -> Document msg
view { page, toMsg } model =
    { title = page.title
    , body =
        [ div [ class "layout" ]
            [ viewHeader
            , div [ class "page" ] page.body
            , viewFooter
            ]
        ]
    }


viewHeader : Html msg
viewHeader =
    header [ class "navbar" ]
        [ a [ class "link", href (Route.toString Route.Top) ] [ text "Home" ]
        , a [ class "link", href (Route.toString Route.About) ] [ text "About" ]
        , a [ class "link", href (Route.toString Route.Service) ] [ text "Service" ]
        , a [ class "link", href (Route.toString Route.News__Top) ] [ text "News" ]
        , a [ class "link", href (Route.toString Route.Caution) ] [ text "Caution" ]
        ]


viewFooter : Html msg
viewFooter =
    footer [ id "footer" ]
        [ a [ class "link", href "https://twitter.com/shishirobotan" ] [ text "Twitter" ]
        , a [ class "link", href "https://www.youtube.com/channel/UCUKD-uaobj9jiqB-VXt71mA" ] [ text "Youtube" ]
        ]
