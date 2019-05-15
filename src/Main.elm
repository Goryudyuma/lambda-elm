module Main exposing
    ( Model
    , Msg(..)
    , and
    , fls
    , fst
    , init
    , main
    , or
    , pair
    , snd
    , tru
    , tst
    , update
    , view
    )

import Browser
import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (src)



---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view _ =
    div []
        [ img [ src "/logo.svg" ] []
        , h1 [] [ text "Your Elm App is working!" ]
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }



---- LAMBDA ----


tru : a -> b -> a
tru a _ =
    a


fls : a -> b -> b
fls _ b =
    b


tst : (a -> b -> c) -> a -> b -> c
tst x =
    x


and :
    (typeOfC -> (x -> y -> y) -> typeOfResult) -- typeOfB
    -> typeOfC
    -> typeOfResult
and b c =
    b c fls


or :
    ((x -> y -> x) -> typeOfC -> typeOfResult) -- typeOfB
    -> typeOfC
    -> typeOfResult
or b c =
    b tru c


pair :
    f
    -> s
    -> (f -> s -> x) -- b
    -> x
pair f s b =
    b f s


fst : ((a -> b -> a) -> x) -> x
fst p =
    p tru


snd : ((a -> b -> b) -> x) -> x
snd p =
    p fls
