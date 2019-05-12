module Tests exposing (all)

import Expect
import Main exposing (..)
import Test exposing (..)



-- Check out http://package.elm-lang.org/packages/elm-community/elm-test/latest to learn more about testing in Elm!


all : Test
all =
    describe "lambda"
        [ describe "tru"
            [ test "IntとInt" <|
                let
                    expected =
                        tru 1 2
                in
                \_ -> Expect.equal 1 expected
            , test "IntとString" <|
                let
                    expected =
                        tru 1 "abc"
                in
                \_ -> Expect.equal 1 expected
            , test "StringとInt" <|
                let
                    expected =
                        tru "abc" 1
                in
                \_ -> Expect.equal "abc" expected
            ]
        , describe "fls"
            [ test "IntとInt" <|
                let
                    expected =
                        fls 1 2
                in
                \_ -> Expect.equal 2 expected
            , test "IntとString" <|
                let
                    expected =
                        fls 1 "abc"
                in
                \_ -> Expect.equal "abc" expected
            , test "StringとInt" <|
                let
                    expected =
                        fls "abc" 1
                in
                \_ -> Expect.equal 1 expected
            ]
        ]
