module Pages.News.News20201201 exposing (Model, Msg, Params, page)

import Html exposing (..)
import Html.Attributes exposing (..)
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
    { title = "2020-12-01 | " ++ T.title
    , body =
        [ div [] []
        , div []
            [ p [] [ text "ホロ鯖5期生ハウス前にて、弊社代表の傭兵時代を模したスフィンクス「スナイパーぼたんくす」を建築しました。" ]
            , p [] [ text "ししろフーズはホロ鯖内の秩序維持に努めて参ります。" ]
            ]
        , div []
            [ YT.toHtml "bvn319UGUNY" ]
        ]
    }
