const target = @import("builtin").target;
const std = @import("std");

pub export fn CheckPlatform() void {
    switch (target.os.tag) {
        .linux => {
            std.debug.print("PLATFORM: LINUX\n", .{});
        },
        .windows => {
            std.debug.print("PLATFORM: WINDOWS\n", .{});
        },
        else => {
            std.debug.print("PLATFORM: UNKNOWN\n", .{});
        },
    }
}
