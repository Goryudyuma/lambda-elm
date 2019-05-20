module Main exposing
    ( Church
    , Model
    , Msg(..)
    , and
    , c0
    , c1
    , c2
    , fls
    , fst
    , init
    , iszro
    , main
    , or
    , pair
    , plus
    , power
    , scc
    , scc2
    , show
    , snd
    , times
    , times2
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


type alias Bool a b c =
    a -> b -> c


type alias Bool1 a =
    Bool a a a


tst : Bool a b c -> Bool a b c
tst x =
    x


and :
    Bool (Bool1 c) (False a b) (Bool1 result) -- typeOfB
    -> Bool1 c
    -> Bool1 result
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


c0 : Church a
c0 _ z =
    z


c1 : Church a
c1 s z =
    s z


c2 : Church a
c2 s z =
    s (s z)


scc : Church a -> Church a
scc n s z =
    s (n s z)


scc2 : Church a -> Church a
scc2 n s z =
    n s (s z)


show : Church number -> number
show cx =
    cx ((+) 1) 0


plus : Church a -> Church a -> Church a
plus m n s z =
    m s (n s z)


times : Church (Church a) -> Church a -> Church a
times m n =
    m (plus n) c0


times2 : Church a -> Church a -> Church a
times2 m n s =
    m (n s)


power : Church a -> Church (a -> a) -> Church a
power m n =
    n m


iszro : Church (Bool1 a) -> Bool1 a
iszro m =
    m (\_ -> fls) tru
