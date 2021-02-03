module Pages.NotFound exposing (Model, Msg, Params, page)

import Html exposing (..)
import Html.Attributes exposing (..)
import Spa.Document exposing (Document)
import Spa.Page as Page exposing (Page)
import Spa.Url exposing (Url)
import Util.Title as T


type alias Params =
    ()


type alias Model =
    Url Params


type alias Msg =
    Never


page : Page Params Model Msg
page =
    Page.static
        { view = view
        }



-- VIEW


view : Url Params -> Document Msg
view { params } =
    { title = "404 | " ++ T.title
    , body =
        [ p [] [ text "404 : Page Not found" ]
        , img [ src "/assets/images/404.jpg" ] []
        ]
    }
