module Date.Extra.Config.Config_pt_br exposing (config)

{-| This is the Brazilian Portuguese config for formatting dates.

@docs config

-}

import Date.Extra.Config as Config
import Date.Extra.I18n.I_default as Default
import Date.Extra.I18n.I_pt_br as Portuguese
import Time


{-| Config for pt-br.
-}
config : Config.Config
config =
    { i18n =
        { dayShort = Portuguese.dayShort
        , dayName = Portuguese.dayName
        , monthShort = Portuguese.monthShort
        , monthName = Portuguese.monthName
        , dayOfMonthWithSuffix = Portuguese.dayOfMonthWithSuffix
        , twelveHourPeriod = Default.twelveHourPeriod
        }
    , format =
        { date = "%d/%m/%Y"
        , longDate = "%A, %-d de %B de %Y"
        , time = "%H:%M"
        , longTime = "%H:%M:%S"
        , dateTime = "%d/%m/%Y %H:%M"
        , firstDayOfWeek = Time.Sun
        }
    }
