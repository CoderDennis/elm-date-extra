module Date.Extra.Config.Config_lt_lt exposing (config)

{-| This is the default Lithuanian config for formatting dates.

@docs config

Copyright (c) 2016-2018 Robin Luiten

-}

import Date.Extra.Config as Config
import Date.Extra.I18n.I_default as Default
import Date.Extra.I18n.I_lt_lt as Lithuanian
import Time


{-| Config for en-us.
-}
config : Config.Config
config =
    { i18n =
        { dayShort = Lithuanian.dayShort
        , dayName = Lithuanian.dayName
        , monthShort = Lithuanian.monthShort
        , monthName = Lithuanian.monthName
        , dayOfMonthWithSuffix = Lithuanian.dayOfMonthWithSuffix
        , twelveHourPeriod = Default.twelveHourPeriod
        }
    , format =
        { date = "%Y-%m-%d"
        , longDate = "%A, %Y, %B %-d"
        , time = "%H:%M"
        , longTime = "%H:%M:%S"
        , dateTime = "%a, %-d. %b %Y. %-H:%M"
        , firstDayOfWeek = Time.Mon
        }
    }
