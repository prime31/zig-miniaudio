const std = @import("std");
const ma = @import("miniaudio");
const wtf = @import("../src/tmp.zig");

const AudioEngine = @import("miniaudio").AudioEngine;
const SoundGroup = @import("miniaudio").SoundGroup;
const Sound = @import("miniaudio").Sound;
const DataSource = @import("miniaudio").DataSource;
const PassThroughEffect = @import("miniaudio").PassThroughEffect;

pub fn main() !void {
    // try manualApi();
    var e = try AudioEngine.init(std.testing.allocator);
    defer e.deinit();

    // e.setVolume(0.15);
    // try e.playOneShot("examples/assets/clang.wav");

    std.debug.print("\nq: quit\nm: generate\n", .{});
    generate(&e);

    const stdin = std.io.getStdIn().reader();
    var c: [1]u8 = undefined;
    while (true) {
        c = try stdin.readBytesNoEof(1);
        switch (c[0]) {
            'm' => soundWaveform(&e),
            'd' => soundDataSource(&e),
            'g', 'q' => break,
            else => {},
        }
    }
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

fn generateSin(e: *AudioEngine) void {
    var sine_waveform = e.allocator.create(ma.ma_waveform) catch unreachable;
    const sine_config = ma.ma_waveform_config_init(e.engine.format, 1, e.engine.sampleRate, .ma_waveform_type_sine, 0.2, 220);
    var res = ma.ma_waveform_init(&sine_config, sine_waveform);
    if (res != 0) {
        std.debug.print("error: {}\n", .{res});
        return;
    }

    var sound = e.allocator.create(ma.ma_sound) catch unreachable;
    const config = ma.ma_audio_buffer_config_init(.ma_format_f32, 1, 6, sine_waveform, null);
    res = ma.ma_sound_init_from_data_source(e.engine, sine_waveform, 0, null, sound);
    if (res != 0) {
        std.debug.print("error: {}\n", .{res});
        return;
    }

    _ = ma.ma_sound_start(sound);
}

fn soundWaveform(e: *AudioEngine) void {
    var sound = Sound.initWaveform(e, .ma_waveform_type_sine, 0.5, 220) catch unreachable;
    sound.start();
}

fn soundDataSource(e: *AudioEngine) void {
    var ds = DataSource.create(e) catch unreachable;
    var sound = Sound.initFromDataSource(e, ds, 0) catch unreachable;
    sound.start();
}

const SfxrParams = struct {
    wave_type: i32 = 0,

    p_base_freq: f32 = 0,
    p_freq_limit: f32 = 0,
    p_freq_ramp: f32 = 0,
    p_freq_dramp: f32 = 0,
    p_duty: f32 = 0,
    p_duty_ramp: f32 = 0,

    p_vib_strength: f32 = 0,
    p_vib_speed: f32 = 0,
    p_vib_delay: f32 = 0,

    p_env_attack: f32 = 0,
    p_env_sustain: f32 = 0,
    p_env_decay: f32 = 0,
    p_env_punch: f32 = 0,

    filter_on: bool = false,
    p_lpf_resonance: f32 = 0,
    p_lpf_freq: f32 = 0,
    p_lpf_ramp: f32 = 0,
    p_hpf_freq: f32 = 0,
    p_hpf_ramp: f32 = 0,

    p_pha_offset: f32 = 0,
    p_pha_ramp: f32 = 0,

    p_repeat_speed: f32 = 0,

    p_arp_speed: f32 = 0,
    p_arp_mod: f32 = 0,

    master_vol: f32 = 0,

    sound_vol: f32 = 0,

    pub fn init() SfxrParams {
        return .{};
    }

    pub fn reset(self: *SfxrParams) void {
        self.wave_type = 0;

        self.p_base_freq = 0.3;
        self.p_freq_limit = 0.0;
        self.p_freq_ramp = 0.0;
        self.p_freq_dramp = 0.0;
        self.p_duty = 0.0;
        self.p_duty_ramp = 0.0;

        self.p_vib_strength = 0.0;
        self.p_vib_speed = 0.0;
        self.p_vib_delay = 0.0;

        self.p_env_attack = 0.0;
        self.p_env_sustain = 0.3;
        self.p_env_decay = 0.4;
        self.p_env_punch = 0.0;

        self.filter_on = false;
        self.p_lpf_resonance = 0.0;
        self.p_lpf_freq = 1.0;
        self.p_lpf_ramp = 0.0;
        self.p_hpf_freq = 0.0;
        self.p_hpf_ramp = 0.0;

        self.p_pha_offset = 0.0;
        self.p_pha_ramp = 0.0;

        self.p_repeat_speed = 0.0;

        self.p_arp_speed = 0.0;
        self.p_arp_mod = 0.0;

        self.master_vol = 0.05;
        self.sound_vol = 0.5;
    }

    pub fn loadPreset(self: *SfxrParams, preset: SfxrPreset) void {
        switch (preset) {
            .coin => {

            },
            else => {},
        }
    }
};

const Sfxr = struct {
    playing_sample: bool = false,
    phase: i32 = 0,
    fperiod: f64 = 0,
    fmaxperiod: f64 = 0,
    fslide: f64 = 0,
    fdslide: f64 = 0,
    period: i32 = 0,
    square_duty: f32 = 0,
    square_slide: f32 = 0,
    env_stage: i32 = 0,
    env_time: i32 = 0,
    env_length: [3]i32 = undefined,
    env_vol: f32 = 0,
    fphase: f32 = 0,
    fdphase: f32 = 0,
    iphase: i32 = 0,
    phaser_buffer: [1024]f32 = undefined,
    ipp: i32 = 0,
    noise_buffer: [32]f32 = undefined,
    fltp: f32 = 0,
    fltdp: f32 = 0,
    fltw: f32 = 0,
    fltw_d: f32 = 0,
    fltdmp: f32 = 0,
    fltphp: f32 = 0,
    flthp: f32 = 0,
    flthp_d: f32 = 0,
    vib_phase: f32 = 0,
    vib_speed: f32 = 0,
    vib_amp: f32 = 0,
    rep_time: i32 = 0,
    rep_limit: i32 = 0,
    arp_time: i32 = 0,
    arp_limit: i32 = 0,
    arp_mod: f64 = 0,

    pub fn init() Sfxr {
        return .{};
    }
};

pub const SfxrPreset = enum(u2) {
    coin,
    laser,
    explosion,
    power_up,
    hurt,
    jump,
    blip,
};
