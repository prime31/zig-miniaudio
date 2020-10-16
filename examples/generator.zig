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
    // try manualApi();
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

fn generate(e: *AudioEngine) void {
    const frequency = 220.0;
    const amplitude = 0.5;
    const advance = 1.0 / @intToFloat(f32, e.engine.sampleRate);
    std.debug.print("sample rate: {d}\n", .{e.engine.sampleRate});

    var data = e.allocator.alloc(f32, 100000) catch unreachable;
    var i: usize = 0;
    var time: f32 = 0;
    while (i < 100000) : (i += 1) {
        data[i] = std.math.sin(std.math.tau * time * frequency) * amplitude;
        time += advance;
    }

    var buffer = e.allocator.create(ma.ma_audio_buffer) catch unreachable;
    // ma_audio_buffer_config_init(ma_format format, ma_uint32 channels, ma_uint64 sizeInFrames, const void* pData, const ma_allocation_callbacks* pAllocationCallbacks);
    const config = ma.ma_audio_buffer_config_init(.ma_format_f32, 1, 100000, data.ptr, null);

    var res = ma.ma_audio_buffer_init(&config, buffer);
    if (res != 0) {
        std.debug.print("error: {}\n", .{res});
        return;
    }

    var sound = e.allocator.create(ma.ma_sound) catch unreachable;
    res = ma.ma_sound_init_from_data_source(e.engine, buffer, 0, null, sound);
    if (res != 0) {
        std.debug.print("error: {}\n", .{res});
        return;
    }

    _ = ma.ma_sound_start(sound);
    // ma.ma_sound_init_from_data_source(e.engine);
    // ma_sound_init_from_data_source(pEngine: [*c]ma_engine, pDataSource: ?*ma_data_source, flags: ma_uint32, pGroup: [*c]ma_sound_group, pSound: [*c]ma_sound)
}
