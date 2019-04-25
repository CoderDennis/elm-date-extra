module Time.Format exposing (format)

{-| Date Format, turning dates into strings.

The format code originally came from and was modified and extended from.
<https://github.com/mgold/elm-date-format/blob/1.0.4/src/Date/Format.elm>


## Date presentation

@docs format

Copyright (c) 2016-2018 Robin Luiten

-}

import Regex
import String exposing (fromInt, padLeft, right)
import Time exposing (Month, Posix, Zone, toDay, toHour, toMillis, toMinute, toMonth, toSecond, toWeekday, toYear)
import Time.Format.Config as Config
import Time.Format.Core as Core
import Time.Format.TwelveHourClock exposing (twelveHourPeriod)


month : Zone -> Posix -> String
month zone time =
    monthMonth <| Time.toMonth zone time


monthMonth : Month -> String
monthMonth m =
    padLeft 2 '0' <| fromInt (Core.monthToInt m)


year : Zone -> Posix -> String
year zone time =
    yearInt <| Time.toYear zone time


yearInt : Int -> String
yearInt y =
    padLeft 4 '0' <| fromInt y


{-| Date formatter.

Initially from <https://github.com/mgold/elm-date-format/blob/1.0.4/src/Date/Format.elm>.

-}
formatRegex : Regex.Regex
formatRegex =
    Maybe.withDefault Regex.never <|
        Regex.fromString "%(y|Y|m|_m|-m|B|^B|b|^b|d|-d|-@d|e|@e|A|^A|a|^a|H|-H|k|I|-I|l|p|P|M|S|%|L)"


{-| Use a format string to format a Posix time for a specific Zone.
-}
format : Config.Config -> String -> Zone -> Posix -> String
format config formatStr zone time =
    Regex.replace
        formatRegex
        (formatToken
            config
            zone
            time
        )
        formatStr


formatToken : Config.Config -> Zone -> Posix -> Regex.Match -> String
formatToken config zone d m =
    let
        symbol =
            List.head m.submatches |> collapse |> Maybe.withDefault " "

        -- _ = Debug.log "formatToken" (symbol)
    in
    case symbol of
        "Y" ->
            d |> toYear zone |> padWithN 4 '0'

        "y" ->
            d |> toYear zone |> padWithN 2 '0' |> right 2

        "m" ->
            d |> toMonth zone |> Core.monthToInt |> padWith '0'

        "_m" ->
            d |> toMonth zone |> Core.monthToInt |> padWith ' '

        "-m" ->
            d |> toMonth zone |> Core.monthToInt |> fromInt

        "B" ->
            d |> toMonth zone |> config.i18n.monthName

        "^B" ->
            d |> toMonth zone |> config.i18n.monthName |> String.toUpper

        "b" ->
            d |> toMonth zone |> config.i18n.monthShort

        "^b" ->
            d |> toMonth zone |> config.i18n.monthShort |> String.toUpper

        "d" ->
            d |> toDay zone |> padWith '0'

        "-d" ->
            d |> toDay zone |> fromInt

        "-@d" ->
            d |> toDay zone |> config.i18n.dayOfMonthWithSuffix False

        "e" ->
            d |> toDay zone |> padWith ' '

        "@e" ->
            d |> toDay zone |> config.i18n.dayOfMonthWithSuffix True

        "A" ->
            d |> toWeekday zone |> config.i18n.dayName

        "^A" ->
            d |> toWeekday zone |> config.i18n.dayName |> String.toUpper

        "a" ->
            d |> toWeekday zone |> config.i18n.dayShort

        "^a" ->
            d |> toWeekday zone |> config.i18n.dayShort |> String.toUpper

        "H" ->
            d |> toHour zone |> padWith '0'

        "-H" ->
            d |> toHour zone |> fromInt

        "k" ->
            d |> toHour zone |> padWith ' '

        "I" ->
            d |> toHour zone |> hourMod12 |> padWith '0'

        "-I" ->
            d |> toHour zone |> hourMod12 |> fromInt

        "l" ->
            d |> toHour zone |> hourMod12 |> padWith ' '

        "p" ->
            d
                |> twelveHourPeriod zone
                |> config.i18n.twelveHourPeriod
                |> String.toUpper

        "P" ->
            d |> twelveHourPeriod zone |> config.i18n.twelveHourPeriod

        "M" ->
            d |> toMinute zone |> padWith '0'

        "S" ->
            d |> toSecond zone |> padWith '0'

        "L" ->
            d |> toMillis zone |> padWithN 3 '0'

        "%" ->
            symbol

        _ ->
            ""


collapse : Maybe (Maybe a) -> Maybe a
collapse m =
    m |> Maybe.andThen identity


hourMod12 h =
    if modBy 12 h == 0 then
        12

    else
        modBy 12 h


padWith : Char -> Int -> String
padWith c =
    padLeft 2 c << fromInt


padWithN : Int -> Char -> Int -> String
padWithN n c =
    padLeft n c << fromInt
