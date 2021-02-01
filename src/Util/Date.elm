module Util.Date exposing (..)


type alias Date =
    { y : Int
    , m : Int
    , d : Int
    }


toJap : Date -> String
toJap date =
    let
        y =
            date.y

        m =
            date.m

        d =
            date.d
    in
    String.fromInt y ++ "年" ++ String.fromInt m ++ "月" ++ String.fromInt d ++ "日"
