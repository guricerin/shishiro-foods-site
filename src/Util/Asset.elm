module Util.Asset exposing (toPath)

import Html exposing (..)
import Html.Attributes exposing (..)


src imgFilename =
    Html.Attributes.src <| toPath imgFilename


toPath : String -> String
toPath imgFilename =
    "./assets/images/" ++ imgFilename
