const builtin = @import("builtin");
const std = @import("std");
const Builder = std.build.Builder;

// for windows we use a pre-compiled obj file until we can figure out why zig cant compile miniaudio
const build_type: enum { exe, static } = .static;
const compile_type: enum { pre_compiled, compiled } = if (std.builtin.os.tag == .windows) .pre_compiled else .compiled;

pub fn build(b: *std.build.Builder) anyerror!void {
    const target = b.standardTargetOptions(.{});

    // use a different cache folder for macos arm builds
    b.cache_root = if (std.builtin.os.tag == .macos and std.builtin.arch == std.builtin.Arch.aarch64) "zig-arm-cache/bin" else "zig-cache/bin";

    const examples = [_][2][]const u8{
        [_][]const u8{ "sfxr", "examples/sfxr.zig" },
        [_][]const u8{ "engine_simple", "examples/engine_simple.zig" },
        [_][]const u8{ "play_file", "examples/play_file.zig" },
    };

    for (examples) |example, i| {
        const name = example[0];
        const source = example[1];

        var exe = b.addExecutable(name, source);
        exe.setBuildMode(b.standardReleaseOptions());
        exe.setOutputDir(std.fs.path.joinPosix(b.allocator, &[_][]const u8{ b.cache_root, "bin" }) catch unreachable);

        if (build_type == .static) {
            const lib = b.addStaticLibrary("miniaudio", null);
            lib.setBuildMode(std.builtin.Mode.ReleaseSmall);
            lib.setTarget(target);

            linkArtifact(b, lib, target);
            lib.install();

            exe.linkLibrary(lib);

            exe.addIncludeDir("miniaudio/extras/miniaudio_split");
            exe.addIncludeDir("miniaudio/research");
            exe.addPackagePath("miniaudio", std.fs.path.join(b.allocator, &[_][]const u8{"src/miniaudio.zig"}) catch unreachable);
        } else {
            linkArtifact(b, exe, target);
        }

        const run_cmd = exe.run();
        const exe_step = b.step(name, b.fmt("run {}.zig", .{name}));
        exe_step.dependOn(&run_cmd.step);

        // first element in the list is added as "run" so "zig build run" works
        if (i == 0) {
            const run_exe_step = b.step("run", b.fmt("run {}.zig", .{name}));
            run_exe_step.dependOn(&run_cmd.step);
        }
    }

    addBuildMiniaudioObjectFile(b);
}

/// builds the miniaudio object file. On Windows, this is done manually with the x64 command prompt: `cl miniaudio.c`
fn addBuildMiniaudioObjectFile(b: *Builder) void {
    var run_cmd = b.addSystemCommand(&[_][]const u8{ "gcc", "-c", "miniaudio.c" });
    run_cmd.cwd = "src/c_src";
    const exe_step = b.step("compile", "compiles miniaudio into an object file");
    exe_step.dependOn(&run_cmd.step);
}

pub fn linkArtifact(b: *Builder, exe: *std.build.LibExeObjStep, target: std.build.Target) void {
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
    exe.addIncludeDir("miniaudio");
    exe.addIncludeDir("miniaudio/research");

    if (compile_type == .pre_compiled) {
        if (target.isWindows()) {
            exe.addObjectFile("src/c_src/miniaudio.obj");
        } else {
            exe.addObjectFile("src/c_src/miniaudio.o");
        }
    } else {
        const cflags = &[_][]const u8{ "-DMA_NO_FLAC", "-DMA_NO_WEBAUDIO", "-DMA_NO_ENCODING", "-DMA_NO_NULL", "-DMA_NO_RUNTIME_LINKING" };
        exe.addCSourceFile("src/c_src/miniaudio.c", cflags);
    }

    exe.addPackagePath("miniaudio", std.fs.path.join(b.allocator, &[_][]const u8{"src/miniaudio.zig"}) catch unreachable);
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
