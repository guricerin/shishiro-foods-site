module Pages.About exposing (Model, Msg, Params, page)

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
    { title = "ABOUT | " ++ T.title
    , body =
        [ div [ class "title" ] [ h2 [] [ text "会社概要" ] ]
        , section []
            [ table [ class "table" ]
                [ tbody []
                    [ tableItem "社名" "ししろフーズ"
                    , tableItem "資本金" "0円"
                    , tableItem "所在地" "ホロ鯖 5期生ビルディング 4F"
                    , tr []
                        [ th [ class "has-text-left" ] [ text "事業内容" ]
                        , td []
                            [ ul []
                                [ li [ class "has-text-left" ] [ text "ラーメン店の経営" ]
                                , li [ class "has-text-left" ] [ text "ホロ鯖内施設の設計・施工" ]
                                ]
                            ]
                        ]
                    , tableItem "代表" "CEO 獅白ぼたん"
                    , tableItem "加盟団体・組織" "Hololive Production"
                    , tableItem "企業理念" "「自由」"
                    ]
                ]
            ]
        ]
    }


tableItem : String -> String -> Html Msg
tableItem thstr tdstr =
    tr [] [ th [ class "has-text-left" ] [ text thstr ], td [ class "has-text-left" ] [ text tdstr ] ]
