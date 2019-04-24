module Time.Format.FormatTests exposing (tests)

{- Test time format. -}

import Expect
import Test exposing (..)
import Time exposing (Posix, customZone, millisToPosix)
import Time.Format as Format
import Time.Format.Config exposing (Config)
import Time.Format.Config.Config_de_de as Config_de_de
import Time.Format.Config.Config_en_au as Config_en_au
import Time.Format.Config.Config_en_gb as Config_en_gb
import Time.Format.Config.Config_en_us as Config_en_us
import Time.Format.Config.Config_es_es as Config_es_es
import Time.Format.Config.Config_et_ee as Config_et_ee
import Time.Format.Config.Config_fi_fi as Config_fi_fi
import Time.Format.Config.Config_fr_fr as Config_fr_fr
import Time.Format.Config.Config_ja_jp as Config_ja_jp
import Time.Format.Config.Config_lt_lt as Config_lt_lt
import Time.Format.Config.Config_nb_no as Config_nb_no
import Time.Format.Config.Config_nl_nl as Config_nl_nl
import Time.Format.Config.Config_pl_pl as Config_pl_pl
import Time.Format.Config.Config_pt_br as Config_pt_br
import Time.Format.Config.Config_ro_ro as Config_ro_ro
import Time.Format.Config.Config_ru_ru as Config_ru_ru
import Time.Format.Config.Config_sv_se as Config_sv_se
import Time.Format.Config.Config_tr_tr as Config_tr_tr


config_en_au =
    Config_en_au.config


config_en_us =
    Config_en_us.config


config_en_gb =
    Config_en_gb.config


config_fr_fr =
    Config_fr_fr.config


config_fi_fi =
    Config_fi_fi.config


config_sv_se =
    Config_sv_se.config


config_pl_pl =
    Config_pl_pl.config


config_ro_ro =
    Config_ro_ro.config


config_nl_nl =
    Config_nl_nl.config


config_pt_br =
    Config_pt_br.config


config_et_ee =
    Config_et_ee.config


config_ja_jp =
    Config_ja_jp.config


config_ru_ru =
    Config_ru_ru.config


config_de_de =
    Config_de_de.config


config_tr_tr =
    Config_tr_tr.config


config_lt_lt =
    Config_lt_lt.config


config_es_es =
    Config_es_es.config


config_nb_no =
    Config_nb_no.config


tests : Test
tests =
    describe "Date.Format tests"
        [ describe "format tests" <|
            List.map runFormatTest formatTestCases
        , describe "configLanguage tests" <|
            List.map runConfigLanguageTest formatConfigTestCases
        ]



{-

   Time : 1407833631116
     is : 2014-08-12T08:53:51.116+00:00
     is : 2014-08-12T18:53:51.116+10:00
     is : 2014-08-12T04:53:51.116-04:00

     In a specific time zone... that showed errors.
     "Tue Aug 12 2014 04:53:51 GMT-0400 (Eastern Daylight Time)""
     toUTCString() is : "Tue, 12 Aug 2014 08:53:51 GMT"
     toISOString() is : "2014-08-12T08:53:51.116Z"

   Time : 1407855231116
     is : 2014-08-12T14:53:51.116+00:00
     is : 2014-08-13T00:53:51.116+10:00


   Using floor here to work around bug in Elm 0.16 on Windows
   that cant produce this as integer into the javascript source.

-}


aTestTime =
    floor 1407833631116.0


aTestTime3 =
    floor -48007855231116.0


{-| problem year negative year out disabled test
-}
aTestTime5 =
    floor 1407182031000.0


{-| 2014-08-04T19:53:51.000Z
-}
aTestTime6 =
    floor 1407117600000.0


{-| 2014-08-04T12:00:00.000+10:00
-}
aTestTime7 =
    floor 1407074400000.0


{-| 2014-08-04T00:00:00.000+10:00
-}
aTestTime8 =
    floor 1375426800000.0


{-| 2013-08-02T17:00:00.000+10:00
-}
aTestTime9 =
    floor -55427130000000.0


{-| Sun Jan 05 2014 00:00:00 GMT+1000
-}
aTestTime10 =
    floor 1388844000000.0


type alias FormatTestCase =
    { name : String
    , expected : String
    , formatStr : String
    , time : Int
    }


{-| 0213-08-02T17:00:00.000+10:00
forces to +10:00 time zone so will run on any time zone
-}
runFormatTest : FormatTestCase -> Test
runFormatTest { name, expected, formatStr, time } =
    let
        asPosix =
            millisToPosix time

        -- _ = Debug.log "runFormatTest"
        --   ( "name", name
        --   , (Date.year asDate, Date.month asDate, Date.day asDate, Date.hour asDate)
        --   , "time", time
        --   , "format", (Format.formatOffset Config_en_us.config -600 formatStr asDate)
        --   )
    in
    test name <|
        \() ->
            Expect.equal
                expected
                (Format.format Config_en_us.config formatStr (customZone 600 []) asPosix)


formatTestCases : List FormatTestCase
formatTestCases =
    [ FormatTestCase "numeric date" "12/08/2014" "%d/%m/%Y" aTestTime
    , FormatTestCase "spelled out date" "Tuesday, August 12, 2014" "%A, %B %d, %Y" aTestTime
    , FormatTestCase "with %% " "% 12/08/2014" "%% %d/%m/%Y" aTestTime
    , FormatTestCase "with %% no space" " %12/08/2014" " %%%d/%m/%Y" aTestTime
    , FormatTestCase "with milliseconds" "2014-08-12 (.116)" "%Y-%m-%d (.%L)" aTestTime
    , FormatTestCase "with milliseconds 2" "2014-08-12T18:53:51.116" "%Y-%m-%dT%H:%M:%S.%L" aTestTime
    , FormatTestCase "small year" "0448-09-09T22:39:28.884" "%Y-%m-%dT%H:%M:%S.%L" aTestTime3
    , FormatTestCase "Config_en_us date aTestTime5" "8/5/2014" config_en_us.format.date aTestTime5
    , FormatTestCase "Config_en_us longDate" "Tuesday, August 05, 2014" config_en_us.format.longDate aTestTime5
    , FormatTestCase "Config_en_us time" "5:53 AM" config_en_us.format.time aTestTime5
    , FormatTestCase "Config_en_us longTime" "5:53:51 AM" config_en_us.format.longTime aTestTime5
    , FormatTestCase "Config_en_us time with PM hour" "6:53 PM" config_en_us.format.time aTestTime
    , FormatTestCase "Config_en_us longTime with PM hour" "6:53:51 PM" config_en_us.format.longTime aTestTime
    , FormatTestCase "Config_en_us dateTime" "8/5/2014 5:53 AM" config_en_us.format.dateTime aTestTime5
    , FormatTestCase "Config_en_us dateTime test PM" "8/4/2014 12:00 PM" config_en_us.format.dateTime aTestTime6
    , FormatTestCase "Config_en_us dateTime test AM" "8/4/2014 12:00 AM" config_en_us.format.dateTime aTestTime7
    , FormatTestCase "Config_en_au date" "5/08/2014" config_en_au.format.date aTestTime5
    , FormatTestCase "Config_en_au longDate" "Tuesday, 5 August 2014" config_en_au.format.longDate aTestTime5
    , FormatTestCase "Config_en_au time" "5:53 AM" config_en_au.format.time aTestTime5
    , FormatTestCase "Config_en_au longTime" "5:53:51 AM" config_en_au.format.longTime aTestTime5
    , FormatTestCase "Config_en_au dateTime" "5/08/2014 5:53 AM" config_en_au.format.dateTime aTestTime5
    , FormatTestCase "Config_en_us date aTestTime" "8/12/2014" config_en_us.format.date aTestTime
    , FormatTestCase "Check day 12 ordinal date format with out padding" "[12][12th]" "[%-d][%-@d]" aTestTime
    , FormatTestCase "Check day 12 ordinal date format with padding" "[12][12th]" "[%e][%@e]" aTestTime
    , FormatTestCase "Check day 2 ordinal date format with out padding" "[2][2nd]" "[%-d][%-@d]" aTestTime8
    , FormatTestCase "Check day 2 ordinal date format with padding" "[ 2][ 2nd]" "[%e][%@e]" aTestTime8
    , FormatTestCase "Check short year field " "0213" "%Y" aTestTime9
    , FormatTestCase "Check 2 digit year field " "13" "%y" aTestTime9
    ]


type alias ConfigLanguageTestCase =
    { name : String
    , expected : String
    , config : Config
    , formatStr : String
    , time : Int
    }


runConfigLanguageTest : ConfigLanguageTestCase -> Test
runConfigLanguageTest { name, expected, config, formatStr, time } =
    let
        asPosix =
            millisToPosix time
    in
    test name <|
        \() ->
            Expect.equal
                expected
                (Format.format config formatStr (customZone 600 []) asPosix)


{-| These tests are testing a few language field values and the day idiom function.
-}
dayDayIdiomMonth =
    "%A (%@e) %d %B %Y"


formatConfigTestCases : List ConfigLanguageTestCase
formatConfigTestCases =
    [ ConfigLanguageTestCase "Config_en_au format" "5/08/2014" config_en_au config_en_au.format.date aTestTime5
    , ConfigLanguageTestCase "Config_en_au format idiom" "Tuesday ( 5th) 05 August 2014" config_en_au dayDayIdiomMonth aTestTime5
    , ConfigLanguageTestCase "Config_en_us day idiom" "8/5/2014" config_en_us config_en_us.format.date aTestTime5
    , ConfigLanguageTestCase "Config_en_us format idiom" "Tuesday ( 5th) 05 August 2014" config_en_us dayDayIdiomMonth aTestTime5
    , ConfigLanguageTestCase "Config_en_gb day idiom" "5/08/2014" config_en_gb config_en_gb.format.date aTestTime5
    , ConfigLanguageTestCase "Config_en_gb format idiom" "Tuesday ( 5th) 05 August 2014" config_en_gb dayDayIdiomMonth aTestTime5
    , ConfigLanguageTestCase "Config_fr_fr day idiom" "05/08/2014" config_fr_fr config_fr_fr.format.date aTestTime5
    , ConfigLanguageTestCase "Config_fr_fr format idiom" "Mardi (  5) 05 Août 2014" config_fr_fr dayDayIdiomMonth aTestTime5
    , ConfigLanguageTestCase "Config_fi_fi day idiom" "5.8.2014" config_fi_fi config_fi_fi.format.date aTestTime5
    , ConfigLanguageTestCase "Config_fi_fi format idiom" "tiistai (5) 05 elokuuta 2014" config_fi_fi dayDayIdiomMonth aTestTime5
    , ConfigLanguageTestCase "Config_sv_se day idiom" "2014-08-05" config_sv_se config_sv_se.format.date aTestTime5
    , ConfigLanguageTestCase "Config_sv_se long date idiom" "tisdag 5 augusti 2014" config_sv_se config_sv_se.format.longDate aTestTime5
    , ConfigLanguageTestCase "Config_sv_se date time idiom" "2014-08-05 05:53" config_sv_se config_sv_se.format.dateTime aTestTime5
    , ConfigLanguageTestCase "Config_sv_se format idiom" "tisdag (5) 05 augusti 2014" config_sv_se dayDayIdiomMonth aTestTime5
    , ConfigLanguageTestCase "Config_sv_se time idiom" "17:00" config_sv_se config_sv_se.format.time aTestTime8
    , ConfigLanguageTestCase "Config_pl_pl day idiom" "05.08.2014" config_pl_pl config_pl_pl.format.date aTestTime5
    , ConfigLanguageTestCase "Config_pl_pl format idiom" "wtorek (5) 05 sierpień 2014" config_pl_pl dayDayIdiomMonth aTestTime5
    , ConfigLanguageTestCase "Config_ro_ro day idiom" "05.08.2014" config_ro_ro config_ro_ro.format.date aTestTime5
    , ConfigLanguageTestCase "Config_ro_ro format idiom" "Marți (5) 05 August 2014" config_ro_ro dayDayIdiomMonth aTestTime5
    , ConfigLanguageTestCase "Config_nl_nl day idiom" "05-08-2014" config_nl_nl config_nl_nl.format.date aTestTime5
    , ConfigLanguageTestCase "Config_nl_nl time idiom" "05:53" config_nl_nl config_nl_nl.format.time aTestTime5
    , ConfigLanguageTestCase "Config_nl_nl dateTime idiom" "05-08-2014 05:53" config_nl_nl config_nl_nl.format.dateTime aTestTime5
    , ConfigLanguageTestCase "Config_nl_nl format date idiom" "dinsdag (5) 05 augustus 2014" config_nl_nl dayDayIdiomMonth aTestTime5
    , ConfigLanguageTestCase "Config_pt_br day idiom" "05/08/2014" config_pt_br config_pt_br.format.date aTestTime5
    , ConfigLanguageTestCase "Config_pt_br format idiom" "Terça-feira ( 5) 05 Agosto 2014" config_pt_br dayDayIdiomMonth aTestTime5
    , ConfigLanguageTestCase "Config_et_ee day idiom" "5. aug 2014. a" config_et_ee config_et_ee.format.date aTestTime5
    , ConfigLanguageTestCase "Config_et_ee format idiom" "teisipäev (5.) 05 august 2014" config_et_ee dayDayIdiomMonth aTestTime5
    , ConfigLanguageTestCase "Config_lt_lt day idiom" "2014-08-05" config_lt_lt config_lt_lt.format.date aTestTime5
    , ConfigLanguageTestCase "Config_lt_lt format idiom" "Antradienis (5.) 05 Rugpjūčio 2014" config_lt_lt dayDayIdiomMonth aTestTime5
    , ConfigLanguageTestCase "Config_ja_jp day idiom" "2014/8/5" config_ja_jp config_ja_jp.format.date aTestTime5
    , ConfigLanguageTestCase "Config_ja_jp format idiom" "火曜日 (5) 05 8月 2014" config_ja_jp dayDayIdiomMonth aTestTime5
    , ConfigLanguageTestCase "Config_ru_ru day idiom" "05/08/2014" config_ru_ru config_ru_ru.format.date aTestTime5
    , ConfigLanguageTestCase "Config_ru_ru format idiom" "вторник (5) 05 август 2014" config_ru_ru dayDayIdiomMonth aTestTime5
    , ConfigLanguageTestCase "Config_ru_ru time idiom" "05:53" config_ru_ru config_ru_ru.format.time aTestTime5
    , ConfigLanguageTestCase "Config_ru_ru time with am/pm" "5:53 ДП" config_ru_ru "%-I:%M %p" aTestTime5
    , ConfigLanguageTestCase "Config_de_de date idiom" "5. August 2014" config_de_de config_de_de.format.date aTestTime5
    , ConfigLanguageTestCase "Config_de_de longDate idiom" "Dienstag, 5. August 2014" config_de_de config_de_de.format.longDate aTestTime5
    , ConfigLanguageTestCase "Config_tr_tr date idiom" "05.08.2014" config_tr_tr config_tr_tr.format.date aTestTime5
    , ConfigLanguageTestCase "Config_tr_tr longDate idiom" "05 Ağustos 2014 Salı" config_tr_tr config_tr_tr.format.longDate aTestTime5
    , ConfigLanguageTestCase "Config_fr_fr hours in 24" "05:53" config_fr_fr config_fr_fr.format.time aTestTime5
    , ConfigLanguageTestCase "Config_es_es day idiom" "05.08.2014" config_es_es config_es_es.format.date aTestTime5
    , ConfigLanguageTestCase "Config_es_es format idiom" "Martes (5) 05 Agosto 2014" config_es_es dayDayIdiomMonth aTestTime5
    , ConfigLanguageTestCase "Config_nb_no format date" "2014-08-05" config_nb_no config_nb_no.format.date aTestTime5
    ]
