module Pages.News.News20210129 exposing (Model, Msg, Params, page)

import Html exposing (..)
import Html.Attributes exposing (..)
import Shared
import Spa.Document exposing (Document)
import Spa.Page as Page exposing (Page)
import Spa.Url as Url exposing (Url)
import Util.Date exposing (Date)
import Util.Title as T
import Util.Youtube as YT


page : Page Params Model Msg
page =
    Page.application
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        , save = save
        , load = load
        }



-- INIT


type alias Params =
    ()


type alias Model =
    {}


init : Shared.Model -> Url Params -> ( Model, Cmd Msg )
init shared { params } =
    ( {}, Cmd.none )



-- UPDATE


type Msg
    = ReplaceMe


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ReplaceMe ->
            ( model, Cmd.none )


save : Model -> Shared.Model -> Shared.Model
save model shared =
    shared


load : Shared.Model -> Model -> ( Model, Cmd Msg )
load shared model =
    ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Document Msg
view model =
    { title = "2021-01-29 | " ++ T.title
    , body =
        [ div [] []
        , div []
            [ p [] [ text "ししろフーズは兎田建設（CEO：兎田ぺこら）との間で業務提携を結びました。" ]
            , p [] [ text "これを機に、弊社ブランド「麺屋ぼたん」のチェーン展開をホロ鯖内にて推進していきます。" ]
            ]
        , div []
            [ YT.toHtml "egTpXCr0p9E" ]
        ]
    }
