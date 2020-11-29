const builtin = @import("builtin");
const std = @import("std");
const Builder = std.build.Builder;

// for windows we use a pre-compiled obj file until we can figure out why zig cant compile miniaudio
const build_type: enum { exe, static } = .exe;
const compile_type: enum { pre_compiled, compiled } = if (std.builtin.os.tag == .windows) .pre_compiled else .compiled;

pub fn build(b: *std.build.Builder) anyerror!void {
    const target = b.standardTargetOptions(.{});

    // use a different cache folder for macos arm builds
    b.cache_root = if (std.builtin.os.tag == .macos and std.builtin.arch == std.builtin.Arch.aarch64) "zig-arm-cache" else "zig-cache";

    const examples = [_][2][]const u8{
        [_][]const u8{ "sfxr", "examples/sfxr.zig" },
        [_][]const u8{ "engine_simple", "examples/engine_simple.zig" },
        [_][]const u8{ "play_file", "examples/play_file.zig" },
    };

    for (examples) |example, i| {
        const name = example[0];
        const source = example[1];

        createExe(b, target, name, source);

        // first element in the list is added as "run" so "zig build run" works
        if (i == 0) createExe(b, target, "run", source);
    }
}

fn createExe(b: *Builder, target: std.build.Target, name: []const u8, source: []const u8) void {
    var exe = b.addExecutable(name, source);
    exe.setBuildMode(b.standardReleaseOptions());
    exe.setOutputDir(std.fs.path.joinPosix(b.allocator, &[_][]const u8{ b.cache_root, "bin" }) catch unreachable);

    addMiniaudioToArtifact(b, exe, target, "");

    const run_cmd = exe.run();
    const exe_step = b.step(name, b.fmt("run {}.zig", .{name}));
    exe_step.dependOn(&run_cmd.step);
}

/// prefix_path is the path to the gfx build.zig file relative to your build.zig.
/// prefix_path is used to add package paths. It should be the the same path used to include this build file.
pub fn addMiniaudioToArtifact(b: *Builder, exe: *std.build.LibExeObjStep, target: std.build.Target, comptime prefix_path: []const u8) void {
    // we either compile miniaudio right into the exe or to a static lib first. Preferably, exe will work on all platforms at some point.
    if (build_type == .static) {
        const lib = b.addStaticLibrary("miniaudio", null);
        lib.setBuildMode(std.builtin.Mode.ReleaseSmall);
        lib.setTarget(target);

        linkArtifact(b, lib, target, prefix_path);
        lib.install();

        exe.linkLibrary(lib);

        exe.addIncludeDir(prefix_path ++ "miniaudio/extras/miniaudio_split");
        exe.addIncludeDir(prefix_path ++ "miniaudio/research");
        exe.addPackagePath("miniaudio", prefix_path ++ "src/miniaudio.zig");
    } else {
        linkArtifact(b, exe, target, prefix_path);
    }

    addBuildMiniaudioObjectFile(b, prefix_path);
}

pub fn linkArtifact(b: *Builder, exe: *std.build.LibExeObjStep, target: std.build.Target, comptime prefix_path: []const u8) void {
    if (prefix_path.len > 0 and !std.mem.endsWith(u8, prefix_path, "/")) @panic("prefix-path must end with '/' if it is not empty");

    exe.linkLibC();
    if (target.isDarwin()) {
        const frameworks_dir = macosFrameworksDir(b) catch unreachable;
        exe.addFrameworkDir(frameworks_dir);
        exe.linkFramework("CoreAudio");
        exe.linkFramework("CoreFoundation");
        exe.linkFramework("AudioUnit");
    } else if (target.isLinux()) {
        exe.linkSystemLibrary("pthread");
        exe.linkSystemLibrary("m");
        exe.linkSystemLibrary("dl");
    }

    // required if doing @cImport to generate a cimport.zig file
    exe.addIncludeDir(prefix_path ++ "miniaudio");
    exe.addIncludeDir(prefix_path ++ "miniaudio/research");

    // windows requires a precompiled obj file until zig can build it
    if (compile_type == .pre_compiled) {
        if (target.isWindows()) {
            exe.addObjectFile(prefix_path ++ "src/c_src/miniaudio.obj");
        } else {
            exe.addObjectFile(prefix_path ++ "src/c_src/miniaudio.o");
        }
    } else {
        const cflags = &[_][]const u8{ "-DMA_NO_FLAC", "-DMA_NO_WEBAUDIO", "-DMA_NO_ENCODING", "-DMA_NO_NULL", "-DMA_NO_RUNTIME_LINKING" };
        exe.addCSourceFile(prefix_path ++ "src/c_src/miniaudio.c", cflags);
    }

    exe.addPackagePath("miniaudio", prefix_path ++ "src/miniaudio.zig");
}

/// builds the miniaudio object file. On Windows, this is done manually with the x64 command prompt: `cl miniaudio.c`
fn addBuildMiniaudioObjectFile(b: *Builder, comptime prefix_path: []const u8) void {
    var run_cmd = b.addSystemCommand(&[_][]const u8{ "gcc", "-c", "miniaudio.c" });
    run_cmd.cwd = prefix_path ++ "src/c_src";
    const exe_step = b.step("compile-miniaudio", "compiles miniaudio into an object file");
    exe_step.dependOn(&run_cmd.step);
}

/// helper function to get SDK path on Mac
fn macosFrameworksDir(b: *Builder) ![]u8 {
    var str = try b.exec(&[_][]const u8{ "xcrun", "--show-sdk-path" });
    const strip_newline = std.mem.lastIndexOf(u8, str, "\n");
    if (strip_newline) |index| {
        str = str[0..index];
    }
    return b.fmt("{}/System/Library/Frameworks", .{str});
}
