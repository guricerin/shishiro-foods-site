module Pages.News.Top exposing (Model, Msg, Params, page)

import Html exposing (..)
import Html.Attributes exposing (..)
import Spa.Document exposing (Document)
import Spa.Generated.Route as Route exposing (Route)
import Spa.Page as Page exposing (Page)
import Spa.Url as Url exposing (Url)
import Util.Date exposing (Date, toJap)
import Util.Title as T


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
    { title = "NEWS | " ++ T.title
    , body =
        [ div [] [ h2 [] [ text "ニュース一覧" ] ]
        , ul []
            [ viewNews { y = 2021, m = 1, d = 29 } Route.News__News20210129 "兎田建設と業務提携を結びました"
            , viewNews { y = 2021, m = 1, d = 20 } Route.News__News20210120 "麺屋ぼたんクレイジー店をオープンしました"
            , viewNews { y = 2020, m = 12, d = 1 } Route.News__News20201201 "スナイパーぼたんくすを建設しました"
            , viewNews { y = 2020, m = 11, d = 7 } Route.News__News20201107 "麺屋ぼたん2号店をオープンしました"
            , viewNews { y = 2020, m = 10, d = 29 } Route.News__News20201029 "麺屋ぼたん本店をオープンしました"
            ]
        ]
    }


viewNews : Date -> Route -> String -> Html Msg
viewNews date route caption =
    li []
        [ span [] [ text <| toJap date ]
        , a [ href <| Route.toString route ] [ text caption ]
        ]
