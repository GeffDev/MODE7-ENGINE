const std = @import("std");

const c = @import("../c.zig");

const mode7 = @import("../mode7.zig");

pub var window: *c.SDL_Window = undefined;

pub fn initVideo(windowTitle: [*:0]const u8, w: i32, h: i32) !u8 {


    window = c.SDL_CreateWindow(windowTitle, c.SDL_WINDOWPOS_CENTERED, c.SDL_WINDOWPOS_CENTERED, w, h, c.SDL_WINDOW_OPENGL) orelse {
        try mode7.log.writeToLog(.LogFatal, "SDL_CreateWindow Failed!");
        return 1;
    };

    return 0;
}