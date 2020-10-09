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

        std.testing.allocator.destroy(engine);
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
        return Sound.initFromFile(self, path);
    }

    pub fn initSoundFromDataSource(self: *@This(), data_source: *ma.ma_data_source, flags: ma.ma_unit32) !Sound {
        return Sound.initFromDataSource(self, data_source, flags);
    }
};

pub const Sound = struct {
    sound: *ma.ma_sound,

    pub fn initFromFile(engine: *AudioEngine, path: [*c]const u8) !Sound {
        var sound = try std.testing.allocator.create(ma.ma_sound);

        const res = ma.ma_sound_init_from_file(engine.engine, path, ma.MA_DATA_SOURCE_FLAG_DECODE, null, null, sound);
        if (res == ma.MA_SUCCESS) {
            return Sound{ .sound = sound };
        }

        std.testing.allocator.destroy(sound);
        return errorForResult(res);
    }

    pub fn initFromDataSource(engine: *AudioEngine, data_source: *ma.ma_data_source, flags: ma.ma_unit32) !Sound {
        var sound = try std.testing.allocator.create(ma.ma_sound);

        const res = ma.init_from_data_source(engine.engine, data_source, flags, null, sound);
        if (res == ma.MA_SUCCESS) {
            return Sound{ .sound = sound };
        }

        std.testing.allocator.destroy(sound);
        return errorForResult(res);
    }

    pub fn deinit(self: @This()) void {
        ma.ma_sound_uninit(self.sound);
        std.testing.allocator.destroy(self.sound);
    }

    pub fn isPlaying(self: @This()) bool {
        return self.sound.isPlaying == 1;
    }

    pub fn isAtEnd(self: @This()) bool {
        return self.sound.atEnd == 1;
    }

    pub fn isLooping(self: @This()) bool {
        return self.sound.isLooping == 1;
    }

    pub fn start(self: *@This()) !void {
        const res = ma.ma_sound_start(self.sound);
        if (res != ma.MA_SUCCESS) return errorForResult(res);
    }

    pub fn stop(self: *@This()) !void {
        const res = ma.ma_sound_start(self.sound);
        if (res != ma.MA_SUCCESS) return errorForResult(res);
    }

    pub fn setVolume(self: *@This(), volume: f32) !void {
        const res = ma.ma_sound_set_volume(self.sound, volume);
        if (res != ma.MA_SUCCESS) return errorForResult(res);
    }

    pub fn setGainDb(self: *@This(), gain_db: f32) !void {
        const res = ma.ma_sound_set_gain_db(self.sound, gain_db);
        if (res != ma.MA_SUCCESS) return errorForResult(res);
    }

    pub fn setEffect(self: *@This(), effect: *ma.ma_effect) !void {
        const res = ma.ma_sound_set_effect(self.sound, effect);
        if (res != ma.MA_SUCCESS) return errorForResult(res);
    }

    pub fn setPan(self: *@This(), pan: f32) !void {
        const res = ma.ma_sound_set_pan(self.sound, pan);
        if (res != ma.MA_SUCCESS) return errorForResult(res);
    }

    pub fn setPitch(self: *@This(), pitch: f32) !void {
        const res = ma.ma_sound_set_pitch(self.sound, pitch);
        if (res != ma.MA_SUCCESS) return errorForResult(res);
    }

    pub fn setPosition(self: *@This(), position: ma.vec3) !void {
        const res = ma.ma_sound_set_position(self.sound, position);
        if (res != ma.MA_SUCCESS) return errorForResult(res);
    }

    pub fn setLooping(self: *@This(), looping: bool) !void {
        const res = ma.ma_sound_set_looping(self.sound, if (looping) 1 else 0);
        if (res != ma.MA_SUCCESS) return errorForResult(res);
    }

    pub fn setFadePointInFrames(self: *@This(), fade_point_index: c_uint, volume_beg: f32, volume_end: f32, time_in_frames_beg: c_ulonglong, time_in_frames_end: c_ulonglong) !void {
        const res = ma.ma_sound_set_fade_point_in_frames(self.sound, fade_point_index, volume_beg, volume_end, time_in_frames_beg, time_in_frames_end);
        if (res != ma.MA_SUCCESS) return errorForResult(res);
    }

    pub fn setFadePointInMilliseconds(self: *@This(), fade_point_index: c_uint, volume_beg: f32, volume_end: f32, time_in_ms_beg: c_ulonglong, time_in_ms_end: c_ulonglong) !void {
        const res = ma.ma_sound_set_fade_point_in_milliseconds(self.sound, fade_point_index, volume_beg, volume_end, time_in_ms_beg, time_in_ms_end);
        if (res != ma.MA_SUCCESS) return errorForResult(res);
    }

    pub fn setFadePointAutoReset(self: *@This(), fade_point_index: c_uint, auto_reset: bool) !void {
        const res = ma.ma_sound_set_fade_point_auto_reset(self.sound, fade_point_index, if (auto_reset) 1 else 0);
        if (res != ma.MA_SUCCESS) return errorForResult(res);
    }

    pub fn setStartDelay(self: *@This(), delay_in_ms: c_ulonglong) !void {
        const res = ma.ma_sound_set_start_delay(self.sound, delay);
        if (res != ma.MA_SUCCESS) return errorForResult(res);
    }

    pub fn setStopDelay(self: *@This(), delay_in_ms: c_ulonglong) !void {
        const res = ma.ma_sound_set_stop_delay(self.sound, delay_in_ms);
        if (res != ma.MA_SUCCESS) return errorForResult(res);
    }

    pub fn getTimeInFrames(self: *@This(), delay_in_ms: c_ulonglong) !c_ulonglong {
        var time: c_ulonglong = undefined;
        const res = ma.ma_sound_get_time_in_frames(self.sound, &time);
        if (res != ma.MA_SUCCESS) return errorForResult(res);
        return time;
    }

    pub fn seekToPcmFrame(self: *@This(), frame_index: c_ulonglong) !void {
        const res = ma.ma_sound_seek_to_pcm_frame(self.sound, frame_index);
        if (res != ma.MA_SUCCESS) return errorForResult(res);
    }

    // MA_API ma_result ma_sound_get_data_format(ma_sound* pSound, ma_format* pFormat, ma_uint32* pChannels, ma_uint32* pSampleRate);
    pub fn getDataFormat(self: *@This()) !void {
        @compileError("not imp");
        const res = ma.ma_sound_get_data_format(self.sound, delay_in_ms);
        if (res != ma.MA_SUCCESS) return errorForResult(res);
    }

    pub fn getCursorInPcmFrames(self: *@This()) !c_ulonglong {
        var cursor: c_ulonglong = undefined;
        const res = ma.ma_sound_get_cursor_in_pcm_frames(self.sound, &cursor);
        if (res == ma.MA_SUCCESS) return cursor;
        return errorForResult(res);
    }

    pub fn getLengthInPcmFrames(self: *@This()) !c_ulonglong {
        var length: c_ulonglong = undefined;
        const res = ma.ma_sound_get_length_in_pcm_frames(self.sound, &length);
        if (res == ma.MA_SUCCESS) return length;
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

    var e = try AudioEngine.init(); defer e.deinit();
    try e.playOneShot("examples/assets/clang.wav");

    var snd = try e.initSoundFromFile("examples/assets/loop.wav"); defer snd.deinit();
    try snd.start();

    const stdin = std.io.getStdIn().reader();
    var c: [1]u8 = undefined;
    if (true) {
        c = try stdin.readBytesNoEof(1);
        std.debug.print("isPlaying: {}, len: {}\n", .{snd.isPlaying(), try snd.getLengthInPcmFrames()});
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
