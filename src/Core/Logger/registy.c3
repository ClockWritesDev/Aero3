module aero3::logger::registry;
import std::core::string, std::collections;

typedef Category = inline String;
typedef RegType = inline char;
typedef LogID = usz;

const Category CAT_WINDOW   = "WINDOW";
const Category CAT_RENDERER = "RENDERER";
const Category CAT_INPUT    = "INPUT";
const Category CAT_MEMORY   = "MEMORY";
const Category CAT_TEST     = "TEST";
const Category CAT_ERROR    = "ERROR";
const Category CAT_ASSERT   = "ASSERT";
const Category CAT_CRASH    = "CRASH";
//const Category AUDIO        = 8; possibily added in the future
//const Category NETWORK      = 79; possibly added in the future

const RegType REG_INFO  = 0;
const RegType REG_WARN  = 1;
const RegType REG_ERROR = 2;
const RegType REG_FATAL = 3;
const RegType REG_RESET = 4;

String[256] registries_types_names = {
	[REG_INFO]  = "INFO",
    [REG_WARN]  = "WARN",
    [REG_ERROR] = "ERROR",
    [REG_FATAL] = "FATAL"
};

struct LogRegistries {
    Category category_type;
    List{Aero3Logger} loggers;
    LogID loggers_length;
}

fn LogRegistries newRegistry(Category category_type) {
    List{Aero3Logger} log_list;
    log_list.init(mem);

    return (LogRegistries) {
        .category_type = category_type,
        .loggers = log_list,
        .loggers_length = 0
    };
}

fn void LogRegistries.registerLog(&self, String msg) {
    LogID newid = self.loggers_length + 1;
    Aero3Logger newlog = logger::newLogger(msg, newid);
    self.loggers.push(newlog);
    self.loggers_length = (LogID)self.loggers.size;
}

fn Aero3Logger* LogRegistries.borrowLog(&self, LogID id) {
    return &self.loggers.get((usz)id);
}

fn void LogRegistries.log(&self, RegType registry_type) {
    foreach (log : self.loggers)
    {
        log.consoleLog(self.category_type, registry_type);
    }
}

fn void LogRegistries.cleanUpLogs(&self) {

    self.loggers.free();
}