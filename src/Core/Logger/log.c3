module aero3::logger;

import aero3::logger::registry;
import aero3::logger::colors;
import aero3::logger::datetime;
import std::time, std::core::string, std::core::mem::allocator, std::io;

struct Aero3Logger {
    RegType registry_type;
    TimeStamp log_timestamp;
    String log_msg;
}

fn void Aero3Logger.setLogger(&self, String msg, RegType registry_type) {
    self.registry_type = registry_type;
    self.log_timestamp = datetime::stampNow();
    self.log_msg = msg;
}

fn void Aero3Logger.consoleLog(&self, Category log_category) {
    String out = string::format(
    allocator::mem,
    "%s[%s] [%s]%s %s -> %s",
    colors::getColor(self.registry_type),

    self.log_timestamp.time_formated,
    registry::registries_types_names[self.registry_type],

    colors::getColor(registry::REG_RESET),

    log_category,
    self.log_msg
    );

    io::printfn("%s", out);
}