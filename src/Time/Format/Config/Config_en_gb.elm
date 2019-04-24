module Time.Format.Config.Config_en_gb exposing (config)

{-| This is the UK english config for formatting dates.

@docs config

Copyright (c) 2016-2017 Bruno Girin

-}

import Time
import Time.Format.Config as Config
import Time.Format.I18n.I_default as Default
import Time.Format.I18n.I_en_us as English


{-| Config for en-gb.
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
        { date = "%-d/%m/%Y" -- d/MM/yyyy
        , longDate = "%A, %-d %B %Y" -- dddd, d MMMM yyyy
        , time = "%-I:%M %p" -- h:mm tt
        , longTime = "%-I:%M:%S %p" -- h:mm:ss tt
        , dateTime = "%-d/%m/%Y %-I:%M %p" -- date + time
        , firstDayOfWeek = Time.Mon
        }
    }
