module Main exposing
    ( Model
    , Msg(..)
    , and
    , c0
    , c1
    , c2
    , fls
    , fst
    , init
    , main
    , or
    , pair
    , plus
    , scc
    , scc2
    , show
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


type alias True a b =
    a -> b -> a


tru : True a b
tru a _ =
    a


type alias False a b =
    a -> b -> b


fls : False a b
fls _ b =
    b


tst : (a -> b -> c) -> a -> b -> c
tst x =
    x


and :
    (typeOfC -> False a b -> typeOfResult) -- typeOfB
    -> typeOfC
    -> typeOfResult
and b c =
    b c fls


or :
    (True a b -> typeOfC -> typeOfResult) -- typeOfB
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


fst : (True a b -> x) -> x
fst p =
    p tru


snd : (False a b -> x) -> x
snd p =
    p fls


type alias Church number =
    (number -> number) -> number -> number


c0 : Church number
c0 _ z =
    z


c1 : Church number
c1 s z =
    s z


c2 : Church number
c2 s z =
    s (s z)


scc : Church number -> Church number
scc n s z =
    s (n s z)


scc2 : Church number -> Church number
scc2 n s z =
    n s (s z)


show : Church number -> number
show cx =
    cx ((+) 1) 0


plus :
    Church number
    -> Church number
    -> Church number
plus m n s z =
    m s (n s z)
