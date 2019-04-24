module Date.Extra.Config.Config_fi_fi exposing (config)

{-| This is the Finnish config for formatting dates.

@docs config

Copyright (c) 2016-2017 Ossi Hanhinen

-}

import Date.Extra.Config as Config
import Date.Extra.I18n.I_default as Default
import Date.Extra.I18n.I_fi_fi as Finnish
import Time


{-| Config for fi-fi.
-}
config : Config.Config
config =
    { i18n =
        { dayShort = Finnish.dayShort
        , dayName = Finnish.dayName
        , monthShort = Finnish.monthShort
        , monthName = Finnish.monthName
        , dayOfMonthWithSuffix = Finnish.dayOfMonthWithSuffix
        , twelveHourPeriod = Default.twelveHourPeriod
        }
    , format =
        { date = "%-d.%-m.%Y" -- d.m.YYYY
        , longDate = "%A, %-d %B %Y" -- dddd, d MMMM yyyy
        , time = "%-H:%M" -- h:mm
        , longTime = "%-H:%M:%S" -- h:mm:ss
        , dateTime = "%-d.%-m.%Y %-H:%M" -- date + time
        , firstDayOfWeek = Time.Mon
        }
    }
