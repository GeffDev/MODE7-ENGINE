const target = @import("builtin").target;
const std = @import("std");

const platforms = enum {
    M7_WINDOWS,
    M7_LINUX,
};

pub const platform: platforms = switch(target.os.tag) {
    .windows => .M7_WINDOWS,
    .linux => .M7_LINUX,
    else => unreachable,
};
