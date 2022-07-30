const target = @import("builtin").target;
const std = @import("std");

pub export fn CheckPlatform() void {
    switch (target.os.tag) {
        .linux => {
            std.debug.print("PLATFORM: LINUX", .{});
        },
        .windows => {
            std.debug.print("PLATFORM: WINDOWS", .{});
        },
        else => {
            std.debug.print("PLATFORM: UNKNOWN", .{});
        },
    }
}
