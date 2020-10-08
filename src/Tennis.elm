module Tennis exposing (..)

import Html exposing (a)


type Score
    = Love
    | Fifteen
    | Thirty
    | Forty
    | WonOrDeuce


type Game
    = Ongoing Score Score
    | Deuce
    | AdvantagePlayer1
    | AdvantagePlayer2
    | WinPlayer1
    | WinPlayer2


init : Game
init =
    Ongoing Love Love


player1Scores : Game -> Game
player1Scores game =
    case game of
        Ongoing first second ->
            Ongoing (increaseScore first) second |> checkDeuce |> checkGameEnd

        Deuce ->
            AdvantagePlayer1

        AdvantagePlayer1 ->
            WinPlayer1

        AdvantagePlayer2 ->
            Deuce

        WinPlayer1 ->
            WinPlayer1

        WinPlayer2 ->
            WinPlayer2


player2Scores : Game -> Game
player2Scores game =
    case game of
        Ongoing first second ->
            Ongoing first (increaseScore second) |> checkDeuce |> checkGameEnd

        Deuce ->
            AdvantagePlayer2

        AdvantagePlayer1 ->
            Deuce

        AdvantagePlayer2 ->
            WinPlayer2

        WinPlayer1 ->
            WinPlayer1

        WinPlayer2 ->
            WinPlayer2


increaseScore : Score -> Score
increaseScore score =
    case score of
        Love ->
            Fifteen

        Fifteen ->
            Thirty

        Thirty ->
            Forty

        Forty ->
            WonOrDeuce

        WonOrDeuce ->
            WonOrDeuce


checkDeuce : Game -> Game
checkDeuce game =
    case game of
        Ongoing WonOrDeuce WonOrDeuce ->
            Deuce

        Ongoing Forty Forty ->
            Deuce

        _ ->
            game


checkGameEnd : Game -> Game
checkGameEnd game =
    case game of
        Ongoing WonOrDeuce WonOrDeuce ->
            Deuce

        Ongoing WonOrDeuce _ ->
            WinPlayer1

        Ongoing _ WonOrDeuce ->
            WinPlayer2

        _ ->
            game


playerScoreToString : Score -> String
playerScoreToString score =
    case score of
        Love ->
            "Love"

        Fifteen ->
            "15"

        Thirty ->
            "30"

        Forty ->
            "40"

        _ ->
            "Unhandled"


scoreToString : Game -> String
scoreToString game =
    case game of
        Ongoing player1Score player2Score ->
            ongoingScoreToString player1Score player2Score

        Deuce ->
            "Deuce"

        AdvantagePlayer1 ->
            "Advantage Player 1"

        AdvantagePlayer2 ->
            "Advantage Player 2"

        WinPlayer1 ->
            "Player 1 wins"

        WinPlayer2 ->
            "Player 2 wins"


ongoingScoreToString : Score -> Score -> String
ongoingScoreToString player1Score player2Score =
    if ( player1Score, player2Score ) == ( Love, Love ) then
        "Love-Love"

    else if player1Score == player2Score then
        playerScoreToString player1Score ++ "-All"

    else
        playerScoreToString player1Score
            ++ "-"
            ++ playerScoreToString player2Score
