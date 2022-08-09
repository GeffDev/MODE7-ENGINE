const target = @import("builtin").target;
const std = @import("std");

pub export fn CheckPlatform() [*:0]const u8 {
    switch (target.os.tag) {
        .linux => {
            return "LINUX";
        },
        .windows => {
            return "WINDOWS";
        },
        else => {
            return "UNKNOWN";
        },
    }
}
