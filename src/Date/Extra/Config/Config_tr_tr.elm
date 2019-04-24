module Date.Extra.Config.Config_tr_tr exposing (config)

{-| This is the default Turkish config for formatting dates.

@docs config

Copyright (c) 2017 Mehmet Köse

-}

import Date.Extra.Config as Config
import Date.Extra.I18n.I_default as Default
import Date.Extra.I18n.I_tr_tr as Turkish
import Time


{-| Config for en-us.
-}
config : Config.Config
config =
    { i18n =
        { dayShort = Turkish.dayShort
        , dayName = Turkish.dayName
        , monthShort = Turkish.monthShort
        , monthName = Turkish.monthName
        , dayOfMonthWithSuffix = Turkish.dayOfMonthWithSuffix
        , twelveHourPeriod = Default.twelveHourPeriod
        }
    , format =
        { date = "%d.%m.%Y"
        , longDate = "%d %B %Y %A"
        , time = "%H:%M"
        , longTime = "%H:%M:%S"
        , dateTime = "%d %B %Y %-H:%M:%S"
        , firstDayOfWeek = Time.Mon
        }
    }
