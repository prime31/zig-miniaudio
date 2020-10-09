const std = @import("std");
const ma = @import("miniaudio");
const wtf = @import("../src/tmp.zig");

const LoadedNotification = struct {
    cb: ma.ma_async_notification_callbacks = .{ .onSignal = null },
    sound: ?*ma.ma_sound = null,

    pub fn init(sound: *ma.ma_sound, onSignal: fn (?*ma.ma_async_notification, c_int) callconv(.C) void) LoadedNotification {
        var note = LoadedNotification{ .sound = sound };
        note.cb.onSignal = onSignal;
        return note;
    }
};

pub const AudioEngine = struct {
    engine: *ma.ma_engine,

    pub fn init() !AudioEngine {
        return initWithOptions(null);
    }

    pub fn initWithOptions(config: ?*ma.ma_engine_config) !AudioEngine {
        var engine = try std.testing.allocator.create(ma.ma_engine);

        const res = ma.ma_engine_init(config, engine);
        if (res == ma.MA_SUCCESS)
            return AudioEngine{ .engine = engine };

        return errorForResult(res);
    }

    pub fn deinit(self: *@This()) void {
        ma.ma_engine_uninit(self.engine);
        std.testing.allocator.destroy(self.engine);
    }

    pub fn playOneShot(self: *@This(), path: [*c]const u8) !void {
        const res = ma.ma_engine_play_sound(self.engine, path, null);
        if (res == ma.MA_SUCCESS) return;

        return errorForResult(res);
    }

    pub fn initSoundFromFile(self: *@This(), path: [*c]const u8) !Sound {
        var sound = try std.testing.allocator.create(ma.ma_sound);

        const res = ma.ma_sound_init_from_file(self.engine, path, ma.MA_DATA_SOURCE_FLAG_DECODE, null, null, sound);
        if (res == ma.MA_SUCCESS) {
            return Sound{ .sound = sound };
        }

        std.testing.allocator.destroy(sound);
        return errorForResult(res);
    }
};

pub const Sound = struct {
    sound: *ma.ma_sound,

    pub fn deinit(self: @This()) void {
        std.testing.allocator.destroy(self.sound);
    }

    pub fn start(self: *@This()) !void {
        const res = ma.ma_sound_start(self.sound);
        if (res == ma.MA_SUCCESS) return;

        return errorForResult(res);
    }
};

fn errorForResult(res: ma.ma_result) anyerror {
    std.debug.print("----- fucker: {}\n", .{res});
    return switch (res) {
        else => error.Unknown,
    };
}

pub fn main() !void {
    std.debug.print("engine size: {}, resource size: {}, device size: {}\n", .{ @sizeOf(ma.ma_engine), @sizeOf(ma.ma_resource_manager), @sizeOf(ma.ma_device) });

    var e = try AudioEngine.init();
    try e.playOneShot("examples/assets/clang.wav");

    var snd = try e.initSoundFromFile("examples/assets/loop.wav");
    try snd.start();

    const stdin = std.io.getStdIn().reader();
    var c: [1]u8 = undefined;
    if (true) {
        c = try stdin.readBytesNoEof(1);
        return;
    }

    var engine = std.mem.zeroes(ma.ma_engine);
    var res: ma.ma_result = 0;

    res = ma.ma_engine_init(null, &engine);
    defer _ = ma.ma_engine_uninit(&engine);

    if (res != 0) {
        std.debug.print("error: {}\n", .{res});
        return error.DecoderInitFailed;
    }

    std.debug.print("owns: {}, engine size: {}, resource size: {}, device size: {}\n", .{ engine.ownsDevice, @sizeOf(ma.ma_engine), @sizeOf(ma.ma_resource_manager), @sizeOf(ma.ma_device) });

    var sound = std.mem.zeroes(ma.ma_sound);

    var n = LoadedNotification.init(&sound, onSoundLoaded);
    n.cb.onSignal = onSoundLoaded;

    _ = ma.ma_sound_init_from_file(&engine, "examples/assets/loop.wav", ma.MA_DATA_SOURCE_FLAG_DECODE, &n, null, &sound);
    _ = ma.ma_sound_set_looping(&sound, 1);
    _ = ma.ma_sound_start(&sound);
    _ = ma.ma_sound_set_pan(&sound, 1);
    _ = ma.ma_sound_set_fade_point_in_milliseconds(&sound, 0, 0, 1, 0, 1000);
    _ = ma.ma_sound_set_fade_point_auto_reset(&sound, 0, ma.MA_FALSE); // Enable fading around loop transitions

    var time_in_frames: c_ulonglong = undefined;
    _ = ma.ma_sound_get_time_in_frames(&sound, &time_in_frames);
    std.debug.print("time: {}\n", .{time_in_frames});

    std.time.sleep(700 * std.time.ns_per_ms);
    _ = ma.ma_sound_set_pan(&sound, -1);
    _ = ma.ma_sound_set_pitch(&sound, 0.7);
    _ = ma.ma_sound_set_volume(&sound, 0.5);

    std.time.sleep(300 * std.time.ns_per_ms);
    _ = ma.ma_sound_set_pan(&sound, 1);
    res = ma.ma_engine_play_sound(&engine, "examples/assets/clang-beat.wav", null);

    // _ = ma.ma_engine_listener_set_position(&engine, .{ .x = 1000000, .y = 10000000, .z = 100000000 });
    // _ = ma.ma_sound_set_position(&sound, .{ .x = 0, .y = 0, .z = 0 });

    var i: usize = 0;
    while (i < 10) : (i += 1) {
        _ = ma.ma_engine_play_sound(&engine, "examples/assets/clang.wav", null);
        std.time.sleep(150 * std.time.ns_per_ms);
    }

    res = ma.ma_engine_play_sound(&engine, "examples/assets/clang.wav", null);
    std.time.sleep(300 * std.time.ns_per_ms);

    _ = ma.ma_sound_group_set_pitch(ma.ma_engine_get_master_sound_group(&engine), 0.4);

    res = ma.ma_engine_play_sound(&engine, "examples/assets/clang.wav", null);
    std.time.sleep(200 * std.time.ns_per_ms);

    std.time.sleep(std.time.ns_per_s * 3);
}

fn onSoundLoaded(notification: ?*ma.ma_async_notification, code: c_int) callconv(.C) void {
    var note = @ptrCast(*LoadedNotification, @alignCast(@alignOf(LoadedNotification), notification));
    std.debug.print("Loaded. code: {}-----------\n", .{code});

    if (code == 0) {
        var time_in_frames: c_ulonglong = undefined;
        _ = ma.ma_sound_get_time_in_frames(note.sound, &time_in_frames);
        std.debug.print("time from cb: {}\n", .{time_in_frames});
    }
}
