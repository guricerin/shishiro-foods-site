module Pages.News.News20210129 exposing (Model, Msg, Params, page)

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
    { title = "2021-01-29 | " ++ T.title
    , body =
        [ div
            [ class "title"
            ]
            [ h2 [] [ text "2021年01月29日" ]
            ]
        , div []
            [ p [] [ text "ししろフーズは兎田建設（CEO：兎田ぺこら）との間で業務提携を結びました。" ]
            , p [] [ text "これを機に、弊社ブランド「麺屋ぼたん」のチェーン展開をホロ鯖内にてより一層推進して参ります。" ]
            , br [] []
            ]
        , div []
            [ img [ src "/assets/images/news/2021-01-29/1.jpg" ] []
            , img [ src "/assets/images/news/2021-01-29/2.jpg" ] []
            , img [ src "/assets/images/news/2021-01-29/3.jpg" ] []
            ]
        , br [] []
        , div [ class "video" ]
            [ YT.toHtml "egTpXCr0p9E" ]
        ]
    }
