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

    std.debug.print("\nq: quit\nc: sfxr coin\nh: sfxr hurt\nj: sfxr jump\nb: sfxr blip\ne: sfxr explosion\nl: sfxr laser\np: sfxr power up\n", .{});

    const stdin = std.io.getStdIn().reader();
    var c: [1]u8 = undefined;
    while (true) {
        c = try stdin.readBytesNoEof(1);
        switch (c[0]) {
            'c' => sfxr(.coin, &e),
            'h' => sfxr(.hurt, &e),
            'j' => sfxr(.jump, &e),
            'b' => sfxr(.blip, &e),
            'e' => sfxr(.explosion, &e),
            'l' => sfxr(.laser, &e),
            'p' => sfxr(.power_up, &e),
            'g', 'q' => break,
            else => {},
        }
    }
}

fn sfxr(preset: ma.SfxrPreset, e: *AudioEngine) void {
    var rng = std.rand.DefaultPrng.init(@intCast(u64, std.time.timestamp()));

    var sf = ma.SfxrDataSource.create(e) catch unreachable;
    sf.loadPreset(preset, rng.random.int(u64));

    var sound = sf.createSound() catch unreachable;
    sound.start();
}
