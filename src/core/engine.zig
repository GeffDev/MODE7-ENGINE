const mode7 = @import("../mode7.zig");

pub fn runM7() !u8 {
    mode7.log.writeToLog(.LogInfo, "Initialising Engine") catch return 1;

    _ = try mode7.window.initVideo("M7", 1280, 720);

    return 0;
}