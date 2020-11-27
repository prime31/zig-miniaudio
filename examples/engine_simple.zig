const std = @import("std");
const ma = @import("miniaudio");
const wtf = @import("../src/tmp.zig");

const AudioEngine = @import("miniaudio").AudioEngine;
const SoundGroup = @import("miniaudio").SoundGroup;
const Sound = @import("miniaudio").Sound;
const PassThroughEffect = @import("miniaudio").PassThroughEffect;

pub fn main() !void {
    var e = try AudioEngine.create(std.testing.allocator);
    defer e.destroy();

    e.setVolume(0.15);
    try e.playOneShot("examples/assets/clang.wav");

    var grp = try e.createSoundGroup();
    defer grp.destroy();

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
