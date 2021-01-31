module Route exposing (..)

import Browser.Navigation as Nav
import Html exposing (Attribute)
import Html.Attributes as Attr
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser, oneOf, s, string)



-- ROUTING


type Route
    = Home
    | News
      -- 会社概要
    | Overview
      -- 実績
    | Works
      -- 注意
    | Caution


parser : Parser (Route -> a) a
parser =
    oneOf
        [ Parser.map Home Parser.top
        , Parser.map News (s "news")
        , Parser.map Overview (s "overview")
        , Parser.map Works (s "works")
        , Parser.map Caution (s "caution")
        ]



-- PUBLIC


href : Route -> Attribute msg
href targetRoute =
    Attr.href (routeToString targetRoute)


replaceUrl : Nav.Key -> Route -> Cmd msg
replaceUrl key route =
    Nav.replaceUrl key (routeToString route)


fromUrl : Url -> Maybe Route
fromUrl url =
    { url | path = url.path, fragment = Nothing }
        |> Parser.parse parser



-- INTERNAL


routeToString : Route -> String
routeToString page =
    "/" ++ String.join "/" (routeToPieces page)


routeToPieces : Route -> List String
routeToPieces page =
    case page of
        Home ->
            []

        News ->
            [ "news" ]

        Overview ->
            [ "overview" ]

        Works ->
            [ "works" ]

        Caution ->
            [ "caution" ]
