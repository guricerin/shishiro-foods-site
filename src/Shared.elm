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
    = ToggleMenu
    | ResetMenu


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ToggleMenu ->
            ( { model | isMenuActive = not model.isMenuActive }, Cmd.none )

        ResetMenu ->
            ( { model | isMenuActive = False }, Cmd.none )


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
            , section [ class "sf-site-content section" ]
                [ div [ class "container" ]
                    [ div [ class "hero" ] page.body
                    ]
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
    nav [ class "navbar is-dark" ]
        [ div [ class "container" ]
            [ div [ class "navbar-brand" ]
                [ a
                    [ class "navbar-item brand-text"
                    , href "/"
                    , onClick <| toMsg ResetMenu
                    ]
                    [ img [ src "/assets/logo.svg", width 64, height 64 ] []
                    , h1 [] [ text "Shishiro Foods Corp." ]
                    ]
                , div
                    [ class "navbar-burger burger"
                    , attribute "data-target" "navMenu"
                    , renderModel model
                    , onClick <| toMsg ToggleMenu
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
                    [ viewNavbarItem Route.About "About" toMsg
                    , viewNavbarItem Route.Service "Service" toMsg
                    , viewNavbarItem Route.News__Top "News" toMsg
                    , viewNavbarItem Route.Caution "Caution" toMsg
                    ]
                ]
            ]
        ]


viewNavbarItem : Route.Route -> String -> (Msg -> msg) -> Html msg
viewNavbarItem route itemName toMsg =
    a
        [ class "navbar-item"
        , href (Route.toString route)
        , onClick <| toMsg ResetMenu
        ]
        [ text itemName ]


viewFooter : Html msg
viewFooter =
    footer [ class "footer has-text-centered" ]
        [ a [ class "link", href "https://twitter.com/shishirobotan" ] [ text "Twitter" ]
        , a [ class "link", href "https://www.youtube.com/channel/UCUKD-uaobj9jiqB-VXt71mA" ] [ text "Youtube" ]
        ]
