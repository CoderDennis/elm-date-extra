module Time.Format.Config.Config_es_es exposing (config)

{-| This is the Spanish config for formatting dates.

@docs config

Copyright (c) 2018 Ángel Herranz

-}

import Time
import Time.Format.Config as Config
import Time.Format.I18n.I_default as Default
import Time.Format.I18n.I_es_es as Spanish


{-| Config for es\_es.
-}
config : Config.Config
config =
    { i18n =
        { dayShort = Spanish.dayShort
        , dayName = Spanish.dayName
        , monthShort = Spanish.monthShort
        , monthName = Spanish.monthName
        , dayOfMonthWithSuffix = Spanish.dayOfMonthWithSuffix
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
