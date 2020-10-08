module Tennis exposing (..)

import Html exposing (a)


type Game
    = Ongoing ( Int, Int )
    | Deuce
    | AdvantagePlayer1
    | AdvantagePlayer2
    | WinPlayer1
    | WinPlayer2


init : Game
init =
    Ongoing ( 0, 0 )


player1Scores : Game -> Game
player1Scores game =
    case game of
        Ongoing ( first, second ) ->
            Ongoing ( first + 1, second ) |> checkDeuce |> checkGameEnd

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
        Ongoing ( first, second ) ->
            Ongoing ( first, second + 1 ) |> checkDeuce |> checkGameEnd

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


checkDeuce : Game -> Game
checkDeuce game =
    case game of
        Ongoing ( 3, 3 ) ->
            Deuce

        _ ->
            game


checkGameEnd : Game -> Game
checkGameEnd game =
    case game of
        Ongoing ( a, b ) ->
            if a > 3 && a > b + 1 then
                WinPlayer1

            else if b > 3 && b > a + 1 then
                WinPlayer2

            else
                Ongoing ( a, b )

        _ ->
            game


playerScoreToString : Int -> String
playerScoreToString score =
    case score of
        0 ->
            "Love"

        1 ->
            "15"

        2 ->
            "30"

        3 ->
            "40"

        _ ->
            "Unhandled"


scoreToString : Game -> String
scoreToString game =
    case game of
        WinPlayer1 ->
            "Player 1 wins"

        WinPlayer2 ->
            "Player 2 wins"

        AdvantagePlayer1 ->
            "Advantage Player 1"

        AdvantagePlayer2 ->
            "Advantage Player 2"

        Deuce ->
            "Deuce"

        Ongoing ( a, b ) ->
            let
                player1 =
                    playerScoreToString a

                player2 =
                    playerScoreToString b
            in
            if ( a, b ) == ( 0, 0 ) then
                "Love-Love"

            else if player1 == player2 then
                player1 ++ "-All"

            else
                player1 ++ "-" ++ player2
