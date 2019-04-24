module Date.Extra.I18n.I_fi_fi exposing
    ( dayShort
    , dayName
    , monthShort
    , monthName
    , dayOfMonthWithSuffix
    )

{-| Finnish values for day and month names.

@docs dayShort
@docs dayName
@docs monthShort
@docs monthName
@docs dayOfMonthWithSuffix

Copyright (c) 2016 Ossi Hanhinen

-}

import String exposing (fromInt)
import Time exposing (Month(..), Weekday(..))


{-| Day short name.
-}
dayShort : Weekday -> String
dayShort day =
    case day of
        Mon ->
            "ma"

        Tue ->
            "ti"

        Wed ->
            "ke"

        Thu ->
            "to"

        Fri ->
            "pe"

        Sat ->
            "la"

        Sun ->
            "su"


{-| Day full name.
-}
dayName : Weekday -> String
dayName day =
    case day of
        Mon ->
            "maanantai"

        Tue ->
            "tiistai"

        Wed ->
            "keskiviikko"

        Thu ->
            "torstai"

        Fri ->
            "perjantai"

        Sat ->
            "lauantai"

        Sun ->
            "sunnuntai"


{-| Month short name.
-}
monthShort : Month -> String
monthShort month =
    case month of
        Jan ->
            "tammi"

        Feb ->
            "helmi"

        Mar ->
            "maalis"

        Apr ->
            "huhti"

        May ->
            "touko"

        Jun ->
            "kesä"

        Jul ->
            "heinä"

        Aug ->
            "elo"

        Sep ->
            "syys"

        Oct ->
            "loka"

        Nov ->
            "marras"

        Dec ->
            "joulu"


{-| Month full name.
-}
monthName : Month -> String
monthName month =
    case month of
        Jan ->
            "tammikuuta"

        Feb ->
            "helmikuuta"

        Mar ->
            "maaliskuuta"

        Apr ->
            "huhtikuuta"

        May ->
            "toukokuuta"

        Jun ->
            "kesäkuuta"

        Jul ->
            "heinäkuuta"

        Aug ->
            "elokuuta"

        Sep ->
            "syyskuuta"

        Oct ->
            "lokakuuta"

        Nov ->
            "marraskuuta"

        Dec ->
            "joulukuuta"


{-| This may not do anything in Finish
-}
dayOfMonthWithSuffix : Bool -> Int -> String
dayOfMonthWithSuffix _ =
    fromInt
