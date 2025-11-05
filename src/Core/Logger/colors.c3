module aero3::logger::colors;
import aero3::logger::registry;

const String GREEN = "\x1b[0;32m";
const String YELLOW = "\x1b[0;33m";
const String RED = "\x1b[0;31m";
const String BLUE = "\x1b[0;34m";
const String PINK = "\x1b[0;35m";
const String TEAL = "\x1b[0;36m";
const String BLACK = "\x1b[0;30m";
const String WHITE = "\x1b[0;29m";

const String GREEN_BOLD = "\x1b[1;32m";
const String YELLOW_BOLD = "\x1b[1;33m";
const String RED_BOLD = "\x1b[1;31m";
const String BLUE_BOLD = "\x1b[1;34m";
const String PINK_BOLD = "\x1b[1;35m";
const String TEAL_BOLD = "\x1b[1;36m";
const String BLACK_BOLD = "\x1b[1;30m";
const String WHITE_BOLD = "\x1b[1;29m";

const String RESET = "\x1b[0m";

fn String getColor(RegType reg_type) {
    switch (reg_type)
    {
    case registry::REG_INFO:
        return GREEN_BOLD;
    case registry::REG_WARN:
        return YELLOW_BOLD;
    case registry::REG_ERROR:
        return RED_BOLD;
    case registry::REG_FATAL:
        return PINK_BOLD; 
    case registry::REG_RESET:
        return RESET;
    default:
        return GREEN_BOLD;
    }
}