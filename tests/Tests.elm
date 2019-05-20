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
            , test "fls and fls and fls = fls" <|
                \_ -> Expect.equal fls <| and (and fls fls) fls
            , test "tru and tru and tru = tru" <|
                \_ -> Expect.equal tru <| and (and tru tru) tru
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
            , describe "scc"
                [ test "show c1 = 1" <|
                    \_ -> Expect.equal 1 (show <| scc <| c0)
                , test "show c2 = 2" <|
                    \_ ->
                        Expect.equal 2
                            (show <| scc <| scc <| c0)
                , test "show c4 = 4" <|
                    \_ ->
                        Expect.equal 4
                            (show <| scc <| scc <| scc <| scc <| c0)
                ]
            , describe "scc2"
                [ test "show c1 = 1" <|
                    \_ -> Expect.equal 1 (show <| scc2 <| c0)
                , test "show c2 = 2" <|
                    \_ ->
                        Expect.equal 2
                            (show <| scc2 <| scc2 <| c0)
                , test "show c4 = 4" <|
                    \_ ->
                        Expect.equal 4
                            (show <| scc2 <| scc2 <| scc2 <| scc2 <| c0)
                ]
            ]
        , describe "plus"
            [ test "0 + 0 = 0" <|
                \_ -> Expect.equal 0 (show <| plus c0 c0)
            , test "1 + 0 = 1" <|
                \_ -> Expect.equal 1 (show <| plus c0 c1)
            , test "5 + 3 = 8" <|
                let
                    c5 =
                        scc <| scc <| scc <| scc <| scc <| c0

                    c3 =
                        scc <| scc <| scc <| c0
                in
                \_ -> Expect.equal 8 (show <| plus c5 c3)
            ]
        , describe "times"
            [ test "0 * 0 = 0" <|
                \_ -> Expect.equal 0 (show <| times c0 c0)
            , test "1 * 0 = 1" <|
                \_ -> Expect.equal 0 (show <| times c0 c1)
            , test "1 * 1 = 1" <|
                \_ -> Expect.equal 1 (show <| times c1 c1)
            , test "5 * 3 = 15" <|
                let
                    c5 =
                        scc <| scc <| scc <| scc <| scc <| c0

                    c3 =
                        scc <| scc <| scc <| c0
                in
                \_ -> Expect.equal 15 (show <| times c5 c3)
            ]
        , describe "times2"
            [ test "0 * 0 = 0" <|
                \_ -> Expect.equal 0 (show <| times2 c0 c0)
            , test "1 * 0 = 1" <|
                \_ -> Expect.equal 0 (show <| times2 c0 c1)
            , test "1 * 1 = 1" <|
                \_ -> Expect.equal 1 (show <| times2 c1 c1)
            , test "5 * 3 = 15" <|
                let
                    c5 =
                        scc <| scc <| scc <| scc <| scc <| c0

                    c3 =
                        scc <| scc <| scc <| c0
                in
                \_ -> Expect.equal 15 (show <| times2 c5 c3)
            ]
        , describe "power"
            [ test "0 ** 0 = 1" <|
                \_ -> Expect.equal 1 (show <| power c0 c0)
            , test "0 ** 1 = 0" <|
                \_ -> Expect.equal 0 (show <| power c0 c1)
            , test "1 ** 1 = 1" <|
                \_ -> Expect.equal 1 (show <| power c1 c1)
            , test "5 ** 3 = 125" <|
                let
                    c5 =
                        scc <| scc <| scc <| scc <| scc <| c0

                    c3 =
                        scc <| scc <| scc <| c0
                in
                \_ -> Expect.equal 125 (show <| power c5 c3)
            , test "3 ** 5 = 243" <|
                let
                    c5 =
                        scc <| scc <| scc <| scc <| scc <| c0

                    c3 =
                        scc <| scc <| scc <| c0
                in
                \_ -> Expect.equal 243 (show <| power c3 c5)
            ]
        , describe "iszro"
            [ test "iszro c0 = tru" <|
                \_ -> Expect.equal tru (iszro c0)
            , test "iszro c1 = fls" <|
                \_ -> Expect.equal fls (iszro c1)
            , test "iszro c2 = fls" <|
                \_ -> Expect.equal fls (iszro c2)
            ]
        ]
