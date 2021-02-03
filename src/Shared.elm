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
import Html.Events exposing (onClick)
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
    = Toggle


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Toggle ->
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
        [ div [ class "sf-site-all" ]
            [ viewHeader toMsg
            , div [ class "sf-site-content container" ] page.body
            , viewFooter
            ]
        ]
    }


viewHeader : (Msg -> msg) -> Html msg
viewHeader toMsg =
    nav [ class "navbar is-black" ]
        [ div [ class "container" ]
            [ div [ class "navbar-brand" ]
                [ a [ class "navbar-item brand-text", href "/" ] [ img [ src "/assets/icons/favicon.png" ] [] ]
                , div
                    [ class "navbar-burger burger"
                    , class "is-active"
                    , attribute "data-target" "navMenu"

                    -- Shared.viewの呼び出し元で型を合わせてくれる
                    , onClick <| toMsg Toggle
                    ]
                    [ span [] []
                    , span [] []
                    , span [] []
                    , span [] []
                    , span [] []
                    ]
                ]
            , div [ class "navbar-menu", class "is-active", id "navMenu" ]
                -- 画面右側にメニュー配置
                [ div [ class "navbar-end" ]
                    [ a [ class "link", href (Route.toString Route.Top) ] [ text "Home" ]
                    , a [ class "link", href (Route.toString Route.About) ] [ text "About" ]
                    , a [ class "link", href (Route.toString Route.Service) ] [ text "Service" ]
                    , a [ class "link", href (Route.toString Route.News__Top) ] [ text "News" ]
                    , a [ class "link", href (Route.toString Route.Caution) ] [ text "Caution" ]
                    ]
                ]
            ]
        ]


viewFooter : Html msg
viewFooter =
    footer [ class "footer has-text-centered" ]
        [ a [ class "link", href "https://twitter.com/shishirobotan" ] [ text "Twitter" ]
        , a [ class "link", href "https://www.youtube.com/channel/UCUKD-uaobj9jiqB-VXt71mA" ] [ text "Youtube" ]
        ]
