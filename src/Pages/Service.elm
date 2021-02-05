module Pages.Service exposing (Model, Msg, Params, page)

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
    { title = "SERVICE | " ++ T.title
    , body =
        [ div [ class "title" ] [ h2 [] [ text "事業概要" ] ]
        , div []
            [ table [ class "table" ]
                [ thead []
                    [ tr []
                        [ th []
                            [ text "麺屋ぼたん"
                            ]
                        ]
                    ]
                , tbody []
                    [ tr []
                        [ td []
                            [ div [] [ text "当社ラーメン店ブランド「麺屋ぼたん」の店舗経営。" ]
                            , br [] []
                            , img [ src "/assets/images/menya-botan-logo.png" ] []
                            , div []
                                [ text "ロゴ制作："
                                , a
                                    [ href "https://twitter.com/leptocephalus_1"
                                    , target "_blank"
                                    , rel "noopener noreferrer"
                                    ]
                                    [ text "@leptocephalus_1" ]
                                , text " 氏"
                                ]
                            ]
                        ]
                    ]
                ]
            , table [ class "table" ]
                [ thead []
                    [ tr []
                        [ th []
                            [ text "建設事業"
                            ]
                        ]
                    ]
                , tbody []
                    [ tr []
                        [ td []
                            [ text "ホロ村開発・その他建設に関する事業"
                            ]
                        ]
                    ]
                ]
            ]
        ]
    }
