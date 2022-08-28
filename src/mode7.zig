pub const errorSets = @import("error.zig");

pub const engine = @import("core/engine.zig");
pub const platform = @import("core/platform.zig");
pub const log = @import("core/log.zig");

pub const window = @import("graphics/window.zig");

pub fn main() !u8 {
    return m7Main();
}

pub fn m7Main() !u8 {
    return engine.runM7();
}