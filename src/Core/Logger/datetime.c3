module aero3::logger::datetime;

import std::time, std::core::string, std::core::mem::allocator;

const long SECS_PER_DAY = 86400;
typedef TimeZone = inline int;

const TimeZone UTCM12 = -12;
const TimeZone UTCM11 = -11;
const TimeZone UTCM10 = -10;
const TimeZone UTCM9  = -9;
const TimeZone UTCM8  = -8;
const TimeZone UTCM7  = -7;
const TimeZone UTCM6  = -6;
const TimeZone UTCM5  = -5;
const TimeZone UTCM4  = -4;
const TimeZone UTCM3  = -3;
const TimeZone UTCM2  = -2;
const TimeZone UTCM1  = -1;
const TimeZone UTC0   = 0;
const TimeZone UTCP1  = 1;
const TimeZone UTCP2  = 2;
const TimeZone UTCP3  = 3;
const TimeZone UTCP4  = 4;
const TimeZone UTCP5  = 5;
const TimeZone UTCP6  = 6;
const TimeZone UTCP7  = 7;
const TimeZone UTCP8  = 8;
const TimeZone UTCP9  = 9;
const TimeZone UTCP10 = 10;
const TimeZone UTCP11 = 11;
const TimeZone UTCP12 = 12;
const TimeZone UTCP13 = 13;
const TimeZone UTCP14 = 14;

struct TimeStamp {
    String time_formated;

    int seconds;
    int minutes;
    int hours;

    int day;
    int month;
    long year;

    TimeZone zone;
}

fn TimeStamp stampNow(TimeZone tz_offset = UTCM3) {
    Time now    = time::now();
    double secs = now.to_seconds();
    secs       += ((double)tz_offset * 3600);

    double days      = secs / SECS_PER_DAY;
    long day_of_year = (long)(days % 365.2425);

    long year  = (long)(1970 + days / 365.2425);
    int  month = (int)(1 + (day_of_year / 30.44));
    int  day   = (int)(1 + (day_of_year % 30.44));

    int hours   = (int)((secs / 3600) % 24);
    int minutes = (int)((secs / 60) % 60);
    int seconds = (int)(secs % 60);

    String time_formated = string::format(
        allocator::mem,
        "%02d/%02d/%04d - %02d:%02d:%02d",
        day, month, year, hours, minutes, seconds
    );

    return (TimeStamp) {
        time_formated,

        seconds,
        minutes,
        hours,

        day,
        month,
        year,

        tz_offset
        };
}
