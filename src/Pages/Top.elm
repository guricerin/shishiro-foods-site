module Pages.Top exposing (Model, Msg, Params, page)

import Array exposing (Array)
import Html exposing (..)
import Html.Attributes exposing (..)
import Random
import Spa.Document exposing (Document)
import Spa.Page as Page exposing (Page)
import Spa.Url exposing (Url)
import Util.Title as T


page : Page Params Model Msg
page =
    Page.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- INIT


type alias Params =
    ()


type alias Model =
    { selected : Maybe String }


words : Array String
words =
    [ "ららーいおん"
    , "ぱおん"
    , "がう"
    , "がうがう"
    , "ららーめん"
    , "オレサマ\u{3000}オマエ\u{3000}マルカジリ"
    , "じんぎすかーん"
    , "おはようから おやすみまで 暮らしを 見つめているぞ"
    ]
        |> Array.fromList


selectRandom : Cmd Msg
selectRandom =
    Random.int 0 (Array.length words - 1) |> Random.generate RandomNumber


init : Url Params -> ( Model, Cmd Msg )
init { params } =
    ( { selected = Nothing }, selectRandom )



-- UPDATE


type Msg
    = RandomNumber Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        RandomNumber n ->
            ( { model | selected = words |> Array.get n }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Document Msg
view model =
    { title = T.title
    , body =
        [ div [] [ h2 [] [ text "Shishiro Foods Corp." ] ]
        , div [] [ h3 [] [ renderText model.selected ] ]
        ]
    }


renderText : Maybe String -> Html msg
renderText selected =
    case selected of
        Just s ->
            text s

        Nothing ->
            text "<nothing>"
