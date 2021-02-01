module Util.Youtube exposing (toHtml)

import Embed.Youtube as YT
import Embed.Youtube.Attributes as YTAttr
import Html


toHtml : String -> Html.Html msg
toHtml youtubeId =
    let
        youtube =
            YT.fromString youtubeId
    in
    YT.toHtml <|
        YT.attributes
            [ YTAttr.width 640
            , YTAttr.height 360
            , YTAttr.language "ja"
            , YTAttr.playsInline
            ]
            youtube
