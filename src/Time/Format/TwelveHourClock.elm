module Time.Format.TwelveHourClock exposing
    ( TwelveHourPeriod(..)
    , twelveHourPeriod
    )

{-| Definition of 12-Hour clock and AM/PMv alue for dates.

@docs TwelveHourPeriod
@docs twelveHourPeriod

-}

import Time exposing (Posix, Zone, toHour)


{-| 12-Hour clock abbreviations (AM/PM)
-}
type TwelveHourPeriod
    = AM
    | PM


{-| Common Date to AM/PM value.
-}
twelveHourPeriod : Zone -> Posix -> TwelveHourPeriod
twelveHourPeriod z d =
    if toHour z d < 12 then
        AM

    else
        PM
