module Pages.Recruit exposing (Model, Msg, Params, page)

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
    { title = "RECRUIT | " ++ T.title
    , body =
        [ div
            [ class "title"
            ]
            [ h2 [] [ text "採用情報" ]
            ]
        , div []
            [ p [] [ text "ししろフーズは共に働く人材を募集しています。" ]
            , br [] []
            ]
        , div []
            [ table [ class "table" ]
                [ tbody []
                    [ viewTableItem "職種" "「麺屋ぼたん」スタッフ"
                    , viewTableItem "雇用形態" "正社員 or アルバイト"
                    , viewTableItem "職務内容" "調理、接客"
                    , viewTableItem "勤務地" "ホロ鯖"
                    , viewTableItem "勤務時間" "不定"
                    , viewTableItem "給与" "ダイヤモンドのレギンス、羊肉など"
                    , viewTableItem "経歴" "不問"
                    ]
                ]
            ]
        , br [] []
        , div []
            [ img [ src "/assets/images/recruit/1.jpg" ] []
            , img [ src "/assets/images/recruit/2.jpg" ] []
            ]
        ]
    }


viewTableItem : String -> String -> Html msg
viewTableItem left right =
    tr []
        [ th [] [ text left ]
        , td [] [ text right ]
        ]
