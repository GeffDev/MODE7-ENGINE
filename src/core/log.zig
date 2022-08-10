const std = @import("std");
const builtin = @import("builtin");

var LogWarnEnabled: bool = true;
var LogInfoEnabled: bool = true;
var LogDebugEnabled: bool = true;

const LogTypes = enum(u8) { LogError = 0, LogFatal = 1, LogWarn = 2, LogInfo = 3, LogDebug = 4 };

pub export fn BuildTypeLogCheck() void {
    if (builtin.Mode == .ReleaseSmall || .ReleaseFast) {
        LogDebugEnabled = false;
    }
}
