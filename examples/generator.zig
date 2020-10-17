const std = @import("std");
const ma = @import("miniaudio");
const wtf = @import("../src/tmp.zig");

const AudioEngine = @import("miniaudio").AudioEngine;
const SoundGroup = @import("miniaudio").SoundGroup;
const Sound = @import("miniaudio").Sound;
const DataSource = @import("miniaudio").DataSource;
const DynamicDataSource = @import("miniaudio").DynamicDataSource;
const PassThroughEffect = @import("miniaudio").PassThroughEffect;

pub fn main() !void {
    var e = try AudioEngine.init(std.testing.allocator);
    defer e.deinit();

    std.debug.print("\nq: quit\nm: sine Waveform\nd: sine from DataSource\nc: sfxr coin\nh: sfxr hurt\nj: sfxr jump\nb: sfxr blip\ne: sfxr explosion\nl: sfxr laser\np: sfxr power up\n", .{});

    // example, create a real one and replace this
    // var dds = try DynamicDataSource.create(&e, std.mem.zeroInit(ma.ma_data_source_callbacks, .{
    //     .onRead = DataSource.onRead
    // }));
    // var sound = try dds.createSound();
    // sound.start();

    const stdin = std.io.getStdIn().reader();
    var c: [1]u8 = undefined;
    while (true) {
        c = try stdin.readBytesNoEof(1);
        switch (c[0]) {
            'm' => (try Sound.initWaveform(&e, .ma_waveform_type_sine, 0.5, 220)).start(),
            'd' => {
                var ds = try DataSource.create(&e);
                var sound = try Sound.initFromDataSource(&e, ds, 0);
                sound.start();
            },
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
    sf.params.loadPreset(preset, rng.random.int(u64));

    var sound = Sound.initFromMaDataSource(e, sf, 0) catch unreachable;
    sound.start();
}
