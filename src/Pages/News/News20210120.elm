module Pages.News.News20210120 exposing (Model, Msg, Params, page)

import Html exposing (..)
import Html.Attributes exposing (..)
import Spa.Document exposing (Document)
import Spa.Page as Page exposing (Page)
import Spa.Url as Url exposing (Url)
import Util.Date exposing (Date)
import Util.Title as T
import Util.Youtube as YT


page : Page Params Model Msg
page =
    Page.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- INIT


type alias Params =
    ()


type alias Model =
    {}


init : Url Params -> ( Model, Cmd Msg )
init { params } =
    ( {}, Cmd.none )



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


view : Model -> Document Msg
view model =
    { title = "2021-01-20 | " ++ T.title
    , body =
        [ div
            [ class "title"
            ]
            [ h2 [] [ text "2021年01月20日" ]
            ]
        , div []
            [ p [] [ text "ホロライブID2期生 Kureiji Ollie 氏の自宅周辺を改造し、「麺屋ぼたん」クレイジー店をオープンしました。" ]
            , p [] [ text "当店舗限定のゾンビ肉などの素材を活かしたラーメンを提供いたします。" ]
            , br [] []
            ]
        , div []
            [ img [ src "/assets/images/news/2021-01-20/1.jpg" ] []
            , img [ src "/assets/images/news/2021-01-20/2.jpg" ] []
            , img [ src "/assets/images/news/2021-01-20/3.jpg" ] []
            , img [ src "/assets/images/news/2021-01-20/4.jpg" ] []
            ]
        , div []
            [ YT.toHtml "BKGQBHrgvgI" ]
        ]
    }
