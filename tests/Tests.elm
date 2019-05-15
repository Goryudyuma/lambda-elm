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
                    actual =
                        tru 1 2
                in
                \_ -> Expect.equal 1 actual
            , test "IntとString" <|
                let
                    actual =
                        tru 1 "abc"
                in
                \_ -> Expect.equal 1 actual
            , test "StringとInt" <|
                let
                    actual =
                        tru "abc" 1
                in
                \_ -> Expect.equal "abc" actual
            ]
        , describe "fls"
            [ test "IntとInt" <|
                let
                    actual =
                        fls 1 2
                in
                \_ -> Expect.equal 2 actual
            , test "IntとString" <|
                let
                    actual =
                        fls 1 "abc"
                in
                \_ -> Expect.equal "abc" actual
            , test "StringとInt" <|
                let
                    actual =
                        fls "abc" 1
                in
                \_ -> Expect.equal 1 actual
            ]
        , describe "test"
            [ describe "tru"
                [ test "IntとInt" <|
                    let
                        actual =
                            tst tru 1 2
                    in
                    \_ -> Expect.equal 1 actual
                , test "IntとString" <|
                    let
                        actual =
                            tst tru 1 "abc"
                    in
                    \_ -> Expect.equal 1 actual
                , test "StringとInt" <|
                    let
                        actual =
                            tst tru "abc" 1
                    in
                    \_ -> Expect.equal "abc" actual
                ]
            , describe "fls"
                [ test "IntとInt" <|
                    let
                        actual =
                            tst fls 1 2
                    in
                    \_ -> Expect.equal 2 actual
                , test "IntとString" <|
                    let
                        actual =
                            tst fls 1 "abc"
                    in
                    \_ -> Expect.equal "abc" actual
                , test "StringとInt" <|
                    let
                        actual =
                            tst fls "abc" 1
                    in
                    \_ -> Expect.equal 1 actual
                ]
            ]
        , describe "tru fls"
            [ test "tru tru tru" <|
                \_ -> Expect.equal tru (tru tru tru)
            , test "tru tru fls" <|
                \_ -> Expect.equal tru (tru tru fls)
            , test "tru fls fls" <|
                \_ -> Expect.equal fls (tru fls fls)
            ]
        , describe "and"
            [ test "tru and tru = tru" <|
                \_ -> Expect.equal tru (and tru tru)
            , test "tru and fls = fls" <|
                \_ -> Expect.equal fls (and tru fls)
            , test "fls and tru = fls" <|
                \_ -> Expect.equal fls (and fls tru)
            , test "fls and fls = fls" <|
                \_ -> Expect.equal fls (and fls fls)
            ]
        , describe "or"
            [ test "tru or tru = tru" <|
                \_ -> Expect.equal tru (or tru tru)
            , test "tru or fls = tru" <|
                \_ -> Expect.equal tru (or tru fls)
            , test "fls or tru = tru" <|
                \_ -> Expect.equal tru (or fls tru)
            , test "fls or fls = fls" <|
                \_ -> Expect.equal fls (or fls fls)
            ]
        , describe "pair"
            [ describe "fst"
                [ test "fst (pair 1 2) = 1 int" <|
                    \_ ->
                        let
                            actual =
                                fst (pair 1 2)
                        in
                        Expect.equal 1 actual
                , test "fst (pair 1 2) = 1 string" <|
                    \_ ->
                        let
                            actual =
                                fst (pair "1" "2")
                        in
                        Expect.equal "1" actual
                , test "fst (pair 1 2) = 1 mix" <|
                    \_ ->
                        let
                            actual =
                                fst (pair "1" 2)
                        in
                        Expect.equal "1" actual
                ]
            , describe "snd"
                [ test "snd (pair 1 2) = 2 int" <|
                    \_ ->
                        let
                            actual =
                                snd (pair 1 2)
                        in
                        Expect.equal 2 actual
                , test "snd (pair 1 2) = 1 string" <|
                    \_ ->
                        let
                            actual =
                                snd (pair "1" "2")
                        in
                        Expect.equal "2" actual
                , test "snd (pair 1 2) = 1 mix" <|
                    \_ ->
                        let
                            actual =
                                snd (pair "1" 2)
                        in
                        Expect.equal 2 actual
                ]
            ]
        , describe "Church"
            [ test "show c0 = 0" <|
                \_ -> Expect.equal 0 (show <| c0)
            , test "show c1 = 1" <|
                \_ -> Expect.equal 1 (show <| c1)
            , test "show c2 = 2" <|
                \_ -> Expect.equal 2 (show <| c2)
            , describe "succ"
                [ test "show c1 = 1" <|
                    \_ -> Expect.equal 1 (show <| succ <| c0)
                , test "show c2 = 2" <|
                    \_ ->
                        Expect.equal 2
                            (show <| succ <| succ <| c0)
                , test "show c4 = 4" <|
                    \_ ->
                        Expect.equal 4
                            (show <| succ <| succ <| succ <| succ <| c0)
                ]
            ]
        ]
