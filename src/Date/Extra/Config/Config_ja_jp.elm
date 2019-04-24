module Date.Extra.Config.Config_ja_jp exposing (config)

{-| This is the Japanese config for formatting dates.

@docs config

Copyright (c) 2017 Yosuke Torii

-}

import Date.Extra.Config as Config
import Date.Extra.I18n.I_default as Default
import Date.Extra.I18n.I_ja_jp as Japanese
import Time


{-| Config for ja\_jp.
-}
config : Config.Config
config =
    { i18n =
        { dayShort = Japanese.dayShort
        , dayName = Japanese.dayName
        , monthShort = Japanese.monthShort
        , monthName = Japanese.monthName
        , dayOfMonthWithSuffix = Japanese.dayOfMonthWithSuffix
        , twelveHourPeriod = Default.twelveHourPeriod
        }
    , format =
        { date = "%Y/%-m/%-d"
        , longDate = "%Y年%-m月%-d日(%a)"
        , time = "%-H:%M"
        , longTime = "%-H時%M分%S秒"
        , dateTime = "%Y/%-m/%-d %-H:%M"
        , firstDayOfWeek = Time.Mon
        }
    }
