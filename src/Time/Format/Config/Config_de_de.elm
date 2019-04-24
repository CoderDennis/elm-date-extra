module Time.Format.Config.Config_de_de exposing (config)

{-| This is the default German config for formatting dates.

@docs config

Copyright (c) 2017 Frank Schmitt

-}

import Time
import Time.Format.Config as Config
import Time.Format.I18n.I_de_de as German
import Time.Format.I18n.I_default as Default


{-| Config for en-us.
-}
config : Config.Config
config =
    { i18n =
        { dayShort = German.dayShort
        , dayName = German.dayName
        , monthShort = German.monthShort
        , monthName = German.monthName
        , dayOfMonthWithSuffix = German.dayOfMonthWithSuffix
        , twelveHourPeriod = Default.twelveHourPeriod
        }
    , format =
        { date = "%-d. %B %Y" -- d. M YYYY. a
        , longDate = "%A, %-d. %B %Y" -- dddd, dd. MMMM yyyy
        , time = "%-H:%M" -- h:mm
        , longTime = "%-H:%M:%S" -- h:mm:ss
        , dateTime = "%a, %-d. %b %Y. %-H:%M:%S" -- date + time
        , firstDayOfWeek = Time.Mon
        }
    }
