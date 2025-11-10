module aero3::logger::registry;
import std::core::string, std::io;

typedef Category = inline String;
typedef RegType = inline char;

const Category CAT_WINDOW   = "WINDOW";
const Category CAT_RENDERER = "RENDERER";
const Category CAT_INPUT    = "INPUT";
const Category CAT_MEMORY   = "MEMORY";
const Category CAT_TEST     = "TEST";
const Category CAT_ERROR    = "ERROR";
const Category CAT_ASSERT   = "ASSERT";
const Category CAT_CRASH    = "CRASH";
//const Category AUDIO        = "AUDIO"; possibily added in the future
//const Category NETWORK      = "NETWORK"; possibly added in the future
//you can make your own Category like: const Category NAME = "NAME";

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
    Aero3Logger logger;
}

fn LogRegistries newRegistry(Category category_type) {
    Aero3Logger logger;

    return (LogRegistries) {
        .category_type = category_type,
        .logger = logger,
    };
}

fn void LogRegistries.registerLog(&self, String msg, RegType new_reg_type = REG_INFO) {
    self.logger.setLogger(msg, new_reg_type);
}
fn Aero3Logger LogRegistries.borrowLog(&self) {
    return self.logger;
}
fn void LogRegistries.log(&self) {
    self.logger.consoleLog(self.category_type);
}