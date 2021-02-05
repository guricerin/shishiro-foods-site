module Pages.NotFound exposing (Model, Msg, Params, page)

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


type alias Params =
    ()


type alias Model =
    { selected : Maybe String }


selectRandom : Cmd Msg
selectRandom =
    Random.weighted ( 90, "/assets/images/404.jpg" ) [ ( 10, "/assets/images/gangimari.png" ) ]
        |> Random.generate RandomImgPath


type Msg
    = RandomImgPath String


init : Url Params -> ( Model, Cmd Msg )
init { params } =
    ( { selected = Nothing }, selectRandom )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        RandomImgPath path ->
            ( { model | selected = Just path }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Document Msg
view model =
    { title = "404 | " ++ T.title
    , body =
        [ p [ class "subtitle" ] [ text "404 : Page Not found" ]
        , renderModel model
        ]
    }


renderModel : Model -> Html msg
renderModel model =
    case model.selected of
        Just path ->
            img [ src path ] []

        Nothing ->
            div [] []
