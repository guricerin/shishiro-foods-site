module Pages.News.News20201029 exposing (Model, Msg, Params, page)

import Html exposing (..)
import Html.Attributes exposing (..)
import Shared
import Spa.Document exposing (Document)
import Spa.Page as Page exposing (Page)
import Spa.Url as Url exposing (Url)
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
    { title = "2020-10-29 | " ++ T.title
    , body =
        [ div [] []
        , div []
            [ p [] [ text "ホロ鯖5期生ビルディング4F（弊社代表の自宅）にて「麺屋ぼたん」をオープンしました。" ]
            , p [] [ text "皆様のご来店を心よりお待ちしております。" ]
            ]
        , div []
            [ img [ src "/assets/images/news/2020-10-29/1.jpg" ] [] ]
        , div []
            [ YT.toHtml "XjQhvAn4y-k" ]
        ]
    }
