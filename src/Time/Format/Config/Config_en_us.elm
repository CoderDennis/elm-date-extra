module Time.Format.Config.Config_en_us exposing (config)

{-| This is the default english config for formatting dates.

@docs config

Copyright (c) 2016-2018 Robin Luiten

-}

import Time
import Time.Format.Config as Config
import Time.Format.I18n.I_default as Default
import Time.Format.I18n.I_en_us as English


{-| Config for en-us.
-}
config : Config.Config
config =
    { i18n =
        { dayShort = English.dayShort
        , dayName = English.dayName
        , monthShort = English.monthShort
        , monthName = English.monthName
        , dayOfMonthWithSuffix = English.dayOfMonthWithSuffix
        , twelveHourPeriod = Default.twelveHourPeriod
        }
    , format =
        { date = "%-m/%-d/%Y" -- M/d/YYY
        , longDate = "%A, %B %d, %Y" -- dddd, MMMM dd, yyyy
        , time = "%-I:%M %p" -- h:mm tt
        , longTime = "%-I:%M:%S %p" -- h:mm:ss tt
        , dateTime = "%-m/%-d/%Y %-I:%M %p" -- date + time
        , firstDayOfWeek = Time.Sun
        }
    }
