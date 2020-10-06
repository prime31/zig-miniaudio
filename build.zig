const builtin = @import("builtin");
const std = @import("std");
const Builder = std.build.Builder;

pub const LibType = enum(i32) {
    static,
    dynamic, // requires DYLD_LIBRARY_PATH to point to the dylib path
    exe_compiled,
};

pub fn build(b: *std.build.Builder) anyerror!void {
    const target = b.standardTargetOptions(.{});

    const examples = [_][2][]const u8{
        [_][]const u8{ "play_file", "examples/play_file.zig" },
        [_][]const u8{ "mix", "examples/mix.zig" },
        [_][]const u8{ "simple", "examples/simple.zig" },
    };

    for (examples) |example, i| {
        const name = example[0];
        const source = example[1];

        var exe = b.addExecutable(name, source);
        exe.setBuildMode(b.standardReleaseOptions());

        // only required if doing @cImport to generate a cimport.zig file
        exe.addIncludeDir("miniaudio/extras/miniaudio_split");
        linkArtifact(b, exe, target, .exe_compiled);

        const run_cmd = exe.run();
        const exe_step = b.step(name, b.fmt("run {}.zig", .{name}));
        exe_step.dependOn(&run_cmd.step);

        // first element in the list is added as "run" so "zig build run" works
        if (i == 0) {
            exe.setOutputDir("zig-cache/bin");
            const run_exe_step = b.step("run", b.fmt("run {}.zig", .{name}));
            run_exe_step.dependOn(&run_cmd.step);
        }
    }
}

pub fn linkArtifact(b: *Builder, exe: *std.build.LibExeObjStep, target: std.build.Target, lib_type: LibType) void {
    exe.linkLibC();

    if (target.isDarwin()) {
        const frameworks_dir = macosFrameworksDir(b) catch unreachable;
        exe.addFrameworkDir(frameworks_dir);
        exe.linkFramework("CoreAudio");
    } else if (target.isLinux()) {
        exe.linkSystemLibrary("pthread");
        exe.linkSystemLibrary("m");
        exe.linkSystemLibrary("dl");
    }

    exe.addIncludeDir("miniaudio/extras/miniaudio_split");

    const cflags = &[_][]const u8{ "-Wextra", "-Wpedantic", "-std=c89", "-DMA_NO_FLAC", "-DMA_NO_WEBAUDIO", "-DMA_NO_ENCODING" };
    exe.addCSourceFile("src/miniaudio.c", cflags);

    exe.addPackagePath("miniaudio", std.fs.path.join(b.allocator, &[_][]const u8{ "src/miniaudio.zig" }) catch unreachable);
}

/// helper function to get SDK path on Mac
fn macosFrameworksDir(b: *Builder) ![]u8 {
    var str = try b.exec(&[_][]const u8{ "xcrun", "--show-sdk-path" });
    const strip_newline = std.mem.lastIndexOf(u8, str, "\n");
    if (strip_newline) |index| {
        str = str[0..index];
    }
    const frameworks_dir = try std.mem.concat(b.allocator, u8, &[_][]const u8{ str, "/System/Library/Frameworks" });
    return frameworks_dir;
}
