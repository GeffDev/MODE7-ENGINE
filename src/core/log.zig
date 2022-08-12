const std = @import("std");
const builtin = @import("builtin");

const LogTypes = enum(u8) { LogError = 0, LogFatal = 1, LogWarn = 2, LogInfo = 3, LogDebug = 4 };

var LogWarnEnabled: bool = true;
var LogInfoEnabled: bool = true;
var LogDebugEnabled: bool = true;

pub export fn buildTypeLogCheck() void {
    comptime {
        if (builtin.Mode == .ReleaseSmall || .ReleaseFast) {
            LogDebugEnabled = false;
        }
    }
}

pub export fn writeToLog(log_type: LogTypes, message: *[]const u8) void {
    // seems to be wildly inefficient, but who cares right now
    const stdout = std.io.getStdOut().writer();
    
    switch (log_type) {
        LogTypes.LogError => {
            stdout.print("[ERROR]: {s}\n", .{&message});
        }
    }
}
