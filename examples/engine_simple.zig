const std = @import("std");
const ma = @import("miniaudio");
const wtf = @import("../src/tmp.zig");

const AudioEngine = @import("miniaudio").AudioEngine;
const SoundGroup = @import("miniaudio").SoundGroup;
const Sound = @import("miniaudio").Sound;
const PassThroughEffect = @import("miniaudio").PassThroughEffect;

pub fn main() !void {
    // try manualApi();

    var e = try AudioEngine.init(std.testing.allocator);
    defer e.deinit();

    e.setVolume(0.15);
    try e.playOneShot("examples/assets/clang.wav");

    var grp = try e.initSoundGroup();
    defer grp.deinit();

    var sndo = try e.createSoundWithOptions("examples/assets/clang-beat.wav", .{
        .stream = true,
        .group = grp,
    });
    defer sndo.destroy();
    sndo.setFadePointInMilliseconds(0, 0, 0.3, 0, 1000);
    sndo.start();

    std.debug.print("group. playing: {}, volume: {}, time: {}\n", .{ grp.isPlaying(), grp.getVolume(), grp.getTimeInFrames() });

    var snd = try e.createSound("examples/assets/loop.wav");
    std.debug.print("sync time: {d}\n", .{ snd.getLength() });
    defer snd.destroy();
    snd.setLooping(true);
    snd.start();

    var effect = PassThroughEffect.init(e.engine.format, e.engine.channels);

    std.debug.print("\nq: quit\nm: play music\nb: play clang-beat\nc: play clang\nv: lower loop volume\ne: apply effect\nf: unapply effect\n", .{});

    const stdin = std.io.getStdIn().reader();
    var c: [1]u8 = undefined;
    while (true) {
        c = try stdin.readBytesNoEof(1);
        switch (c[0]) {
            'm' => {
                var mus = try e.createSoundWithOptions("examples/assets/clearday.mp3", .{
                    .stream = true,
                });
                mus.setFadePointInMilliseconds(0, 0, 0.3, 0, 1000);
                mus.start();
            },
            'b' => try e.playOneShot("examples/assets/clang-beat.wav"),
            'c' => try e.playOneShot("examples/assets/clang.wav"),
            'v' => snd.setVolume(0.3),
            'e' => snd.setEffect(&effect),
            'f' => snd.setEffect(null),
            'g', 'q' => break,
            else => {},
        }
    }
}

fn manualApi() !void {
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

    // var n = LoadNotification.init(&sound, onSoundLoaded);

    _ = ma.ma_sound_init_from_file(&engine, "examples/assets/loop.wav", ma.MA_DATA_SOURCE_FLAG_DECODE, null, null, &sound);
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
