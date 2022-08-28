const std = @import("std");
const builtin = @import("builtin");

pub const LogTypes = enum(u8) { LogError = 0, LogFatal = 1, LogWarn = 2, LogInfo = 3, LogDebug = 4 };

var LogWarnEnabled: bool = true;
var LogInfoEnabled: bool = true;
var LogDebugEnabled: bool = true;

pub fn writeToLog(log_type: LogTypes, message: [*:0]const u8) !void {
    comptime {
        if (builtin.mode == std.builtin.Mode.ReleaseSmall or builtin.mode == std.builtin.Mode.ReleaseFast) {
            LogDebugEnabled = false;
        }
    }
    
    // seems to be wildly inefficient, but who cares right now
    const stdout = std.io.getStdOut().writer();

    if (log_type == LogTypes.LogDebug and LogDebugEnabled == false) {
        return;
    }

    switch (log_type) {
        LogTypes.LogError => {
            try stdout.print("[ERROR]: {s}\n", .{message});
        },
        LogTypes.LogDebug => {
            try stdout.print("[DEBUG]: {s}\n", .{message});
        },
        LogTypes.LogFatal => {
            try stdout.print("[FATAL]: {s}\n", .{message});
        },
        LogTypes.LogInfo => {
            try stdout.print("[INFO]: {s}\n", .{message});
        },
        LogTypes.LogWarn => {
            try stdout.print("[WARNING]: {s}\n", .{message});
        }
    }
}
