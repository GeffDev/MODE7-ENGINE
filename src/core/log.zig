const std = @import("std");
const builtin = @import("builtin");

const LogTypes = enum(u8) { LogError = 0, LogFatal = 1, LogWarn = 2, LogInfo = 3, LogDebug = 4 };

var LogWarnEnabled: bool = true;
var LogInfoEnabled: bool = true;
var LogDebugEnabled: bool = true;

pub export fn buildTypeLogCheck() void {
    if (builtin.Mode == .ReleaseSmall || .ReleaseFast) {
        LogDebugEnabled = false;
    }
}

pub export fn initLog() bool {
    return true;
}

pub export fn cleanUpLog() void {}

pub export fn logInput(log_type: LogTypes, message: []const u8) void {
    if (log_type == LogTypes.LogDebug) {
        if (LogDebugEnabled == false) {
            return;
        }
    }

    logOutput(log_type, message);
}

pub export fn logOutput(log_type: LogTypes, message: []const u8) void {}
