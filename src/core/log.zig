const std = @import("std");
const builtin = @import("builtin");

const LogWarnEnabled: bool = true;
const LogInfoEnabled: bool = true;
const LogDebugEnabled: bool = true;

// add a build type check to disable select log type

const LogTypes = enum { LogError = 0, LogFatal = 1, LogWarn = 2, LogInfo = 3, LogDebug = 4 };

