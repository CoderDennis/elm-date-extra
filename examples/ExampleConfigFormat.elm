module Main exposing (main)

{-| An example of adjusting the Config for Format.

Configure the month name produced when formatting dates.

This example modifies an existing Config but you can create
your own Config without using existing ones as well.

You can also use existing translations in the Date.Config.I18n namespace if
they match your language needs for your own config.

Copyright (c) 2016-2018 Robin Luiten

-}

import Browser
import Html exposing (Html, div, text)
import String
import Time exposing (utc)
import Time.Format exposing (format)
import Time.Format.Config.Config_en_au exposing (config)


{-| Modify the i18n in config to change month names so they area reversed.
-}
configReverseMonthName =
    let
        i18nCurrent =
            config.i18n

        i18nUpdated =
            { i18nCurrent
                | monthName = String.reverse << i18nCurrent.monthName
            }
    in
    { config
        | i18n = i18nUpdated
    }


{-| See [DocFormat.md](../DocFormat.md) for token meanings.
-}
myDateFormat =
    "%A, %e %B %Y"


formatOriginal =
    format config myDateFormat


formatReverseMonthName =
    format configReverseMonthName myDateFormat


{-| Time 1407833631161.0 in utc is "2014-08-12 08:53:51.161"
-}
testDate1 =
    Time.millisToPosix 1407833631161


main =
    Browser.sandbox
        { init = ()
        , view = view
        , update = \_ model -> model
        }


view _ =
    div []
        [ div []
            [ text
                ("formatOriginal en_au config with utc time zone \""
                    ++ formatOriginal utc testDate1
                    ++ "\". "
                )
            ]
        , div []
            [ text
                ("formatReverseMonthName en_au config with utc time zone \""
                    ++ formatReverseMonthName utc testDate1
                    ++ "\". "
                )
            ]
        ]
