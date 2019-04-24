module Time.Format.Config.Config_et_ee exposing (config)

{-| This is the default Estonian config for formatting dates.

@docs config

Copyright (c) 2016-2018 Robin Luiten

-}

import Time
import Time.Format.Config as Config
import Time.Format.I18n.I_default as Default
import Time.Format.I18n.I_et_ee as Estonian


{-| Config for en-us.
-}
config : Config.Config
config =
    { i18n =
        { dayShort = Estonian.dayShort
        , dayName = Estonian.dayName
        , monthShort = Estonian.monthShort
        , monthName = Estonian.monthName
        , dayOfMonthWithSuffix = Estonian.dayOfMonthWithSuffix
        , twelveHourPeriod = Default.twelveHourPeriod
        }
    , format =
        { date = "%-d. %b %Y. a" -- d. M YYYY. a
        , longDate = "%A, %-d. %B %Y" -- dddd, dd. MMMM yyyy
        , time = "%-H:%M" -- h:mm
        , longTime = "%-H:%M:%S" -- h:mm:ss
        , dateTime = "%a, %-d. %b %Y. %-H:%M:%S" -- date + time
        , firstDayOfWeek = Time.Mon
        }
    }
