module aero3::logger;

import aero3::logger::registry, aero3::logger::colors, aero3::logger::datetime;
import std::time, std::core::string, std::core::mem::allocator, std::io;

struct Aero3Logger {
    LogID logger_id;
    RegType registry_type;
    TimeStamp log_timestamp;
    String log_msg;
}

fn Aero3Logger newLogger(String msg, LogID id, RegType registry_type) {
    return (Aero3Logger){
        .logger_id = id,
        .log_timestamp = datetime::stampNow(), 
        .log_msg = msg};
}

fn void Aero3Logger.updateLogger(&self, String new_msg, RegType new_reg_type) {
    self.log_timestamp = datetime::stampNow();
    self.log_msg = new_msg;
    self.registry_type = new_reg_type;
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