module Time.Format.Config.Config_tr_tr exposing (config)

{-| This is the default Turkish config for formatting dates.

@docs config

Copyright (c) 2017 Mehmet Köse

-}

import Time
import Time.Format.Config as Config
import Time.Format.I18n.I_default as Default
import Time.Format.I18n.I_tr_tr as Turkish


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
