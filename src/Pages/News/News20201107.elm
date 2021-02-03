module Pages.News.News20201107 exposing (Model, Msg, Params, page)

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
    { title = "2020-10-29 | " ++ T.title
    , body =
        [ div [] []
        , div []
            [ p [] [ text "ホロ鯖秋の大運動会場前にて「麺屋ぼたん」2号店をオープンしました。" ]
            ]
        , div []
            [ img [ src "/assets/images/news/2020-11-07/1.jpg" ] [] ]
        , div []
            [ p [] [ h3 [] [ text "追記：" ] ]
            , p [] [ text "開店してすぐ、ホロライブ所属のときのそら様にご来店頂きました。" ]
            , p [] [ text "心より御礼申し上げます。" ]
            ]
        , div []
            [ img [ src "/assets/images/news/2020-11-07/2.jpg" ] [] ]
        , div []
            [ YT.toHtml "6jIev25HdPU" ]
        ]
    }