module Time.Format.Config.Config_ro_ro exposing (config)

{-| This is the Romanian config for formatting dates.

@docs config

Copyright (c) 2016-2017 Cezar Halmagean

-}

import Time
import Time.Format.Config as Config
import Time.Format.I18n.I_default as Default
import Time.Format.I18n.I_ro_ro as Romanian


{-| Config for ro\_ro.
-}
config : Config.Config
config =
    { i18n =
        { dayShort = Romanian.dayShort
        , dayName = Romanian.dayName
        , monthShort = Romanian.monthShort
        , monthName = Romanian.monthName
        , dayOfMonthWithSuffix = Romanian.dayOfMonthWithSuffix
        , twelveHourPeriod = Default.twelveHourPeriod
        }
    , format =
        { date = "%d.%m.%Y" -- dd.MM.yyyy
        , longDate = "%A, %-d %B %Y" -- dddd, d MMMM yyyy
        , time = "%-H:%M" -- h:mm
        , longTime = "%-H:%M:%S" -- h:mm:ss
        , dateTime = "%-d.%m.%Y %-H:%M" -- date + time
        , firstDayOfWeek = Time.Mon
        }
    }
