const target = @import("builtin").target;
const std = @import("std");

pub export fn CheckPlatform() void {
    switch(target.os.tag) {
        .linux => {
            std.log.info("linux", .{});
        },
        else => {
            std.log.info("unknown", .{});
        }
    }
}