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
import Spa.Generated.Route as Route exposing (Route)
import Url exposing (Url)



-- INIT


type alias Flags =
    ()


type alias Model =
    { url : Url
    , key : Key
    , isMenuActive : Bool
    }


init : Flags -> Url -> Key -> ( Model, Cmd Msg )
init flags url key =
    ( Model url key False
    , Cmd.none
    )



-- UPDATE


type Msg
    = Toggle


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Toggle ->
            ( { model | isMenuActive = not model.isMenuActive }, Cmd.none )


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
            [ viewHeader toMsg model
            , section [ class "sf-site-content container" ]
                [ div [ class "" ] page.body
                ]
            , viewFooter
            ]
        ]
    }


renderModel : Model -> Attribute msg
renderModel model =
    class
        (if model.isMenuActive then
            "is-active"

         else
            "burger"
        )


viewHeader : (Msg -> msg) -> Model -> Html msg
viewHeader toMsg model =
    nav [ class "navbar is-black" ]
        [ div [ class "container" ]
            [ div [ class "navbar-brand" ]
                [ a [ class "navbar-item brand-text", href "/" ]
                    [ img [ src "/assets/logo.svg", width 64, height 64 ] []
                    , h1 [] [ text "Shishiro Foods Corp." ]
                    ]
                , div
                    [ class "navbar-burger burger"
                    , attribute "data-target" "navMenu"
                    , renderModel model

                    -- Shared.viewの呼び出し元で型を合わせてくれる
                    , onClick <| toMsg Toggle
                    ]
                    [ span [] []
                    , span [] []
                    , span [] []
                    ]
                ]
            , div
                [ class "navbar-menu"
                , id "navMenu"
                , renderModel model
                ]
                -- 画面右側にメニュー配置
                [ div [ class "navbar-end" ]
                    [ viewNavbarItem Route.About "About"
                    , viewNavbarItem Route.Service "Service"
                    , viewNavbarItem Route.News__Top "News"
                    , viewNavbarItem Route.Caution "Caution"
                    ]
                ]
            ]
        ]


viewNavbarItem : Route.Route -> String -> Html msg
viewNavbarItem route txt =
    a
        [ class "navbar-item"
        , href (Route.toString route)
        ]
        [ text txt ]


viewFooter : Html msg
viewFooter =
    footer [ class "footer has-text-centered" ]
        [ a [ class "link", href "https://twitter.com/shishirobotan" ] [ text "Twitter" ]
        , a [ class "link", href "https://www.youtube.com/channel/UCUKD-uaobj9jiqB-VXt71mA" ] [ text "Youtube" ]
        ]
