const std = @import("std");
const target = @import("builtin").target;

pub fn build(b: *std.build.Builder) void {
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    const lib = b.addStaticLibrary("mode7", "src/platform.zig");
    lib.setBuildMode(mode);
    lib.linkLibC();

    // sdl
    lib.addIncludePath("deps/include/SDL2");

    lib.install();

    const main_tests = b.addTest("src/main.zig");
    main_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
