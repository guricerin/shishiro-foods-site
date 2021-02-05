module Pages.Caution exposing (Model, Msg, Params, page)

import Html exposing (..)
import Html.Attributes exposing (..)
import Spa.Document exposing (Document)
import Spa.Page as Page exposing (Page)
import Spa.Url as Url exposing (Url)
import Util.Title as T


page : Page Params Model Msg
page =
    Page.static
        { view = view
        }


type alias Model =
    Url Params


type alias Msg =
    Never



-- VIEW


type alias Params =
    ()


view : Url Params -> Document Msg
view { params } =
    { title = "CAUTION | " ++ T.title
    , body =
        [ div [ class "title" ] [ h2 [] [ text "注意事項" ] ]
        , div [ class "content" ]
            [ ul []
                [ li [] [ text "当サイトは非公式・非公認のジョークサイトです。" ]
                , li []
                    [ text "問題等ありましたら、"
                    , a
                        [ href "https://twitter.com/guricerin"
                        , target "_blank"
                        , rel "noopener noreferrer"
                        ]
                        [ text "制作者のTwitter" ]
                    , text "にお知らせ頂くか"
                    , a
                        [ href "https://github.com/guricerin/shishiro-foods-site"
                        , target "_blank"
                        , rel "noopener noreferrer"
                        ]
                        [ text "GitHubリポジトリ" ]
                    , text "にてIssueの発行をお願い致します。"
                    ]
                , li [] [ text "当サイトは予告なく削除する場合があります。" ]
                ]
            ]
        ]
    }
