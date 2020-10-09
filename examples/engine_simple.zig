const std = @import("std");
const ma = @import("miniaudio");
const wtf = @import("../src/tmp.zig");

const AudioEngine = @import("miniaudio").AudioEngine;
const SoundGroup = @import("miniaudio").SoundGroup;
const Sound = @import("miniaudio").Sound;

pub const Effect = struct {
    sound: Sound = undefined,
    base: ma.ma_effect_base,

    pub fn init() Effect {
        return .{ .base = std.mem.zeroes(ma.ma_effect_base) };
    }
};

// ma_effect* pEffect, const void* pFramesIn, ma_uint64* pFrameCountIn, void* pFramesOut, ma_uint64* pFrameCountOut);
fn onProcessPCMFrames(effect: ?*ma.ma_effect, frames_in: ?*const c_void, frame_count_in: [*c]ma.ma_uint64, frames_out: ?*c_void, frame_count_out: [*c]ma.ma_uint64) callconv(.C) ma.ma_result {
    std.debug.print("onProcessPCMFrames\n", .{});
    var base = @ptrCast(*Effect, @alignCast(@alignOf(Effect), effect));

    var snd_format = base.sound.getDataFormat();
    const frame_count: ma.ma_uint64 = std.math.min(frame_count_in.*, frame_count_out.*);

    _ = ma.ma_copy_pcm_frames(frames_out, frames_in, frame_count, snd_format.format, 2);

    frame_count_in.* = frame_count;
    frame_count_out.* = frame_count;

    return ma.MA_SUCCESS;
}

fn onGetRequiredInputFrameCount(effect: ?*ma.ma_effect, output_frame_count: ma.ma_uint64) callconv(.C) ma.ma_uint64 {
    std.debug.print("onGetRequiredInputFrameCount\n", .{});
    return ma.MA_SUCCESS;
}

fn onGetExpectedOutputFrameCount(effect: ?*ma.ma_effect, input_frame_count: ma.ma_uint64) callconv(.C) ma.ma_uint64 {
    std.debug.print("onGetExpectedOutputFrameCount\n", .{});
    var base = @ptrCast(*Effect, @alignCast(@alignOf(Effect), effect));

    const out_frame_count = ma.ma_effect_get_expected_output_frame_count(&base.base, input_frame_count);
    std.debug.print("---- out_frame_count: {}\n", .{out_frame_count});
    return out_frame_count;
}

fn onGetInputDataFormat(effect: ?*ma.ma_effect, format: [*c]ma.ma_format, channels: [*c]ma.ma_uint32, sample_rate: [*c]ma.ma_uint32) callconv(.C) ma.ma_result {
    std.debug.print("onGetInputDataFormat\n", .{});
    var base = @ptrCast(*Effect, @alignCast(@alignOf(Effect), effect));
    var snd_format = base.sound.getDataFormat();
    // std.debug.print("snd_format: {}\n", .{snd_format});

    format.* = snd_format.format;
    channels.* = snd_format.channels;
    sample_rate.* = snd_format.sample_rate;
    return ma.MA_SUCCESS;
}

fn onGetOutputDataFormat(effect: ?*ma.ma_effect, format: [*c]ma.ma_format, channels: [*c]ma.ma_uint32, sample_rate: [*c]ma.ma_uint32) callconv(.C) ma.ma_result {
    std.debug.print("onGetOutputDataFormat\n", .{});
    // var base = @ptrCast(*Effect, @alignCast(@alignOf(Effect), effect));
    // var snd_format = base.sound.getDataFormat();
    // // std.debug.print("snd_format: {}\n", .{snd_format});

    // format.* = snd_format.format;
    // channels.* = snd_format.channels;
    // sample_rate.* = snd_format.sample_rate;
    return ma.MA_SUCCESS;
}

pub fn main() !void {
    std.debug.print("engine size: {}, resource size: {}, device size: {}\n", .{ @sizeOf(ma.ma_engine), @sizeOf(ma.ma_resource_manager), @sizeOf(ma.ma_device) });

    var e = try AudioEngine.init();
    defer e.deinit();
    var master_grp = SoundGroup{ .group = e.getMasterSoundGroup() };

    e.setVolume(0.15);
    try e.playOneShot("examples/assets/clang.wav");

    var grp = try e.initSoundGroup();
    defer grp.deinit();

    var sndo = try e.initSoundWithOptions("examples/assets/clang-beat.wav", .{
        .stream = true,
        .group = grp,
    });
    defer sndo.deinit();
    sndo.setFadePointInMilliseconds(0, 0, 0.3, 0, 1000);
    sndo.start();
    std.debug.print("clang-beat length: {}\n", .{sndo.getLengthInPcmFrames()});

    std.debug.print("group. playing: {}, volume: {}, time: {}\n", .{ grp.isPlaying(), grp.getVolume(), grp.getTimeInFrames() });

    var snd = try e.initSound("examples/assets/loop.wav");
    defer snd.deinit();
    snd.setLooping(true);
    snd.start();

    var effect = Effect.init();
    effect.sound = snd;
    effect.base.onProcessPCMFrames = onProcessPCMFrames;
    effect.base.onGetRequiredInputFrameCount = onGetRequiredInputFrameCount;
    effect.base.onGetExpectedOutputFrameCount = onGetExpectedOutputFrameCount;
    // effect.base.onGetInputDataFormat = onGetInputDataFormat;
    // effect.base.onGetOutputDataFormat = onGetOutputDataFormat;
    snd.setEffect(&effect);


    std.debug.print("\ng: quit\nm: play music\nb: play clang-beat\nc: play clang\nv: lower loop volume\ne: apply effect\n", .{});

    const stdin = std.io.getStdIn().reader();
    var c: [1]u8 = undefined;
    while (true) {
        c = try stdin.readBytesNoEof(1);
        switch (c[0]) {
            'm' => {
                var mus = try e.initSoundWithOptions("examples/assets/clearday.mp3", .{
                    .stream = true,
                });
                mus.setFadePointInMilliseconds(0, 0, 0.3, 0, 1000);
                mus.start();
            },
            'b' => try e.playOneShot("examples/assets/clang-beat.wav"),
            'c' => try e.playOneShot("examples/assets/clang.wav"),
            'v' => snd.setVolume(0.3),
            'e' => snd.setEffect(&effect),
            'g' => return,
            else => {},
        }
    }
}

fn manualApi() void {
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

    var n = LoadNotification.init(&sound, onSoundLoaded);
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
    var note = @ptrCast(*LoadNotification, @alignCast(@alignOf(LoadNotification), notification));
    std.debug.print("Loaded. code: {}-----------\n", .{code});

    if (code == ma.MA_NOTIFICATION_COMPLETE) {
        var time_in_frames: c_ulonglong = undefined;
        _ = ma.ma_sound_get_time_in_frames(note.sound, &time_in_frames);
        std.debug.print("time from cb: {}\n", .{time_in_frames});
    }
}
