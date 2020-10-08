module TennisTest exposing (suite)

import Expect
import Tennis
import Test exposing (..)


suite : Test
suite =
    describe "Tennis"
        [ test "new game" <|
            \_ ->
                Tennis.init
                    |> Tennis.scoreToString
                    |> Expect.equal "Love-Love"
        , test "player 1 scores" <|
            \_ ->
                Tennis.init
                    |> Tennis.player1Scores
                    |> Tennis.scoreToString
                    |> Expect.equal "15-Love"
        , test "player 2 scores" <|
            \_ ->
                Tennis.init
                    |> Tennis.player2Scores
                    |> Tennis.scoreToString
                    |> Expect.equal "Love-15"
        , test "player 1 and 2 score" <|
            \_ ->
                Tennis.init
                    |> Tennis.player1Scores
                    |> Tennis.player2Scores
                    |> Tennis.scoreToString
                    |> Expect.equal "15-All"
        , test "player 1 scores twice and 2 score" <|
            \_ ->
                Tennis.init
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.player2Scores
                    |> Tennis.scoreToString
                    |> Expect.equal "30-15"
        , test "player 1 wins after scoring 4 times" <|
            \_ ->
                Tennis.init
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.scoreToString
                    |> Expect.equal "Player 1 wins"
        , test "player 2 wins after scoring 4 times" <|
            \_ ->
                Tennis.init
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.scoreToString
                    |> Expect.equal "Player 2 wins"
        , test "player 1 and 2 score 3 times for Deuce" <|
            \_ ->
                Tennis.init
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.scoreToString
                    |> Expect.equal "Deuce"
        , test "player 1 scores after Deuce" <|
            \_ ->
                Tennis.init
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.player1Scores
                    |> Tennis.scoreToString
                    |> Expect.equal "Advantage Player 1"
        , test "player 2 scores after Deuce" <|
            \_ ->
                Tennis.init
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.scoreToString
                    |> Expect.equal "Advantage Player 2"
        , test "player 1 and 2 score after Deuce" <|
            \_ ->
                Tennis.init
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.player1Scores
                    |> Tennis.player2Scores
                    |> Tennis.scoreToString
                    |> Expect.equal "Deuce"
        , test "player 1 wins after Deuce" <|
            \_ ->
                Tennis.init
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.scoreToString
                    |> Expect.equal "Player 1 wins"
        , test "player 1 wins after second Deuce" <|
            \_ ->
                Tennis.init
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.player1Scores
                    |> Tennis.player2Scores
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.scoreToString
                    |> Expect.equal "Player 1 wins"
        , test "Scoring after win is not possible" <|
            \_ ->
                Tennis.init
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.player1Scores
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.player2Scores
                    |> Tennis.scoreToString
                    |> Expect.equal "Player 1 wins"
        ]
