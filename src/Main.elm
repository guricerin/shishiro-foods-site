module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Route exposing (Route(..))
import Url



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- MODEL


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    ( Model key url, Cmd.none )



-- UPDATE


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                -- 同一ドメイン
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                -- 外部ドメイン
                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            ( { model | url = url }
            , Cmd.none
            )



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "ししろフーズ"
    , body =
        [ div []
            [ viewHeader
            , img [ src "%PUBLIC_URL%/assets/images/logo.svg" ] []
            , div [ id "container" ] [ viewPage model ]
            , viewFooter
            ]
        ]
    }


viewHeader : Html Msg
viewHeader =
    header [ id "header" ]
        [ div [ class "menu_wrapper" ]
            [ div [ class "menu" ]
                [ ul []
                    [ li [] [ a [ Route.href Route.Home ] [ text "Home" ] ]
                    , li [] [ a [ Route.href Route.News ] [ text "News" ] ]
                    , li [] [ a [ Route.href Route.Works ] [ text "Works" ] ]
                    , li [] [ a [ Route.href Route.Overview ] [ text "Overview" ] ]
                    , li [] [ a [ Route.href Route.Caution ] [ text "Caution" ] ]
                    ]
                ]
            ]
        ]


viewFooter : Html Msg
viewFooter =
    footer [ id "sitemap" ] [ h2 [] [ text "サイトマップ" ] ]


viewPage : Model -> Html Msg
viewPage model =
    case Route.fromUrl model.url of
        Nothing ->
            viewNotFound

        Just Home ->
            viewHome

        Just News ->
            viewNews

        Just Overview ->
            viewOverview

        Just Works ->
            viewWorks

        Just Caution ->
            viewCaution


viewNotFound : Html Msg
viewNotFound =
    div []
        [ div [] [ h2 [] [ text "404" ] ]
        ]


viewHome : Html Msg
viewHome =
    div []
        [ div [] [ h2 [] [ text "ららーいおん" ] ]
        ]


viewNews : Html Msg
viewNews =
    div []
        [ div [] [ h2 [] [ text "ニュース一覧" ] ]
        ]


viewOverview : Html Msg
viewOverview =
    div []
        [ div [] [ h2 [] [ text "会社概要" ] ]
        , section []
            [ table []
                [ tbody []
                    [ tableItem "社名" "ししろフーズ"
                    , tableItem "資本金" "0円"
                    , tableItem "所在地" "ホロ鯖 5期生ハウス4F"
                    , tr []
                        [ th [] [ text "事業内容" ]
                        , td [] [ ol [] [ li [] [ text "ラーメン店の経営" ], li [] [ text "ホロ鯖内施設の設計・施工" ] ] ]
                        ]
                    , tableItem "代表取締役" "獅白ぼたん"
                    , tableItem "企業理念" "「自由」"
                    ]
                ]
            ]
        ]


tableItem : String -> String -> Html Msg
tableItem thstr tdstr =
    tr [] [ th [] [ text thstr ], td [] [ text tdstr ] ]


viewWorks : Html Msg
viewWorks =
    div []
        [ div []
            [ h2 [] [ text "実績" ]
            , section []
                [ ul []
                    [ viewWork "" "2020/11/07" "麺屋ぼたん2号店"
                    , viewWork "" "2020/10/29" "麺屋ぼたん本店"
                    ]
                ]
            ]
        ]


viewWork : String -> String -> String -> Html Msg
viewWork imgPath date workName =
    li []
        [ a [ class "" ]
            [ img [ src imgPath ] []
            , h3 []
                [ text date
                , br [] []
                , text workName
                ]
            ]
        ]


viewCaution : Html Msg
viewCaution =
    div []
        [ div [] [ h2 [] [ text "注意事項" ] ]
        , ul []
            [ li [] [ text "当サイトは非公式・非公認のネタサイトです。" ]
            , li []
                [ text "問題等ありましたら、"
                , a [ href "https://twitter.com/guricerin" ] [ text "作者のTwitter" ]
                , text "にお知らせ頂くか"
                , a [ href "https://github.com/guricerin/test" ] [ text "GitHubリポジトリ" ]
                , text "にてIssueの発行をお願い致します。"
                ]
            , li [] [ text "当サイトは予告なく削除する場合があります。" ]
            ]
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }
