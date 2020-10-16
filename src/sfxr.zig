const std = @import("std");
usingnamespace @import("c.zig").ma;
const AudioEngine = @import("miniaudio.zig").AudioEngine;
const DataSource = @import("miniaudio.zig").DataSource;

var rng = std.rand.DefaultPrng.init(0x12345678);

fn frnd(val: f32) f32 {
    const mod = @mod(rng.random.int(i32), @as(i32, 10001));
    return @intToFloat(f32, mod) / 10000.0 * val;
}

fn rnd(val: i32) i32 {
    return @mod(rng.random.int(i32), (val + 1));
}

const pow = std.math.pow;

pub const SfxrParams = extern struct {
    wave_type: i32 = 0,

    p_base_freq: f32 = 0.3,
    p_freq_limit: f32 = 0,
    p_freq_ramp: f32 = 0,
    p_freq_dramp: f32 = 0,
    p_duty: f32 = 0,
    p_duty_ramp: f32 = 0,

    p_vib_strength: f32 = 0,
    p_vib_speed: f32 = 0,
    p_vib_delay: f32 = 0,

    p_env_attack: f32 = 0,
    p_env_sustain: f32 = 0.3,
    p_env_decay: f32 = 0.4,
    p_env_punch: f32 = 0,

    filter_on: bool = false,
    p_lpf_resonance: f32 = 0,
    p_lpf_freq: f32 = 1.0,
    p_lpf_ramp: f32 = 0,
    p_hpf_freq: f32 = 0,
    p_hpf_ramp: f32 = 0,

    p_pha_offset: f32 = 0,
    p_pha_ramp: f32 = 0,

    p_repeat_speed: f32 = 0,

    p_arp_speed: f32 = 0,
    p_arp_mod: f32 = 0,

    master_vol: f32 = 0.05,
    sound_vol: f32 = 0.5,

    pub fn init() SfxrParams {
        return .{};
    }

    pub fn reset(self: *SfxrParams) void {
        self.* = .{};
    }

    pub fn loadPreset(self: *SfxrParams, preset: SfxrPreset, seed: u64) void {
        self.reset();
        rng.seed(seed);

        switch (preset) {
            .coin => {
                self.p_base_freq = 0.4 + frnd(0.5);
                self.p_env_attack = 0.0;
                self.p_env_sustain = frnd(0.1);
                self.p_env_decay = 0.1 + frnd(0.4);
                self.p_env_punch = 0.3 + frnd(0.3);
                if (rng.random.boolean()) {
                    self.p_arp_speed = 0.5 + frnd(0.2);
                    self.p_arp_mod = 0.2 + frnd(0.4);
                }
            },
            .laser => {
                self.wave_type = rnd(2);
                if (self.wave_type == 2 and rng.random.boolean())
                    self.wave_type = rnd(1);
                self.p_base_freq = 0.5 + frnd(0.5);
                self.p_freq_limit = self.p_base_freq - 0.2 - frnd(0.6);
                if (self.p_freq_limit < 0.2) self.p_freq_limit = 0.2;
                self.p_freq_ramp = -0.15 - frnd(0.2);
                if (rnd(2) == 0) {
                    self.p_base_freq = 0.3 + frnd(0.6);
                    self.p_freq_limit = frnd(0.1);
                    self.p_freq_ramp = -0.35 - frnd(0.3);
                }
                if (rng.random.boolean()) {
                    self.p_duty = frnd(0.5);
                    self.p_duty_ramp = frnd(0.2);
                } else {
                    self.p_duty = 0.4 + frnd(0.5);
                    self.p_duty_ramp = -frnd(0.7);
                }
                self.p_env_attack = 0.0;
                self.p_env_sustain = 0.1 + frnd(0.2);
                self.p_env_decay = frnd(0.4);
                if (rng.random.boolean())
                    self.p_env_punch = frnd(0.3);
                if (rnd(2) == 0) {
                    self.p_pha_offset = frnd(0.2);
                    self.p_pha_ramp = -frnd(0.2);
                }
                if (rng.random.boolean())
                    self.p_hpf_freq = frnd(0.3);
            },
            .explosion => {
                self.wave_type = 3;
                if (rng.random.boolean()) {
                    self.p_base_freq = 0.1 + frnd(0.4);
                    self.p_freq_ramp = -0.1 + frnd(0.4);
                } else {
                    self.p_base_freq = 0.2 + frnd(0.7);
                    self.p_freq_ramp = -0.2 - frnd(0.2);
                }
                self.p_base_freq *= self.p_base_freq;
                if (rnd(4) == 0)
                    self.p_freq_ramp = 0.0;
                if (rnd(2) == 0)
                    self.p_repeat_speed = 0.3 + frnd(0.5);
                self.p_env_attack = 0.0;
                self.p_env_sustain = 0.1 + frnd(0.3);
                self.p_env_decay = frnd(0.5);
                if (rng.random.boolean()) {
                    self.p_pha_offset = -0.3 + frnd(0.9);
                    self.p_pha_ramp = -frnd(0.3);
                }
                self.p_env_punch = 0.2 + frnd(0.6);
                if (rng.random.boolean()) {
                    self.p_vib_strength = frnd(0.7);
                    self.p_vib_speed = frnd(0.6);
                }
                if (rnd(2) == 0) {
                    self.p_arp_speed = 0.6 + frnd(0.3);
                    self.p_arp_mod = 0.8 - frnd(1.6);
                }
            },
            .power_up => {
                if (rng.random.boolean()) {
                    self.wave_type = 1;
                } else {
                    self.p_duty = frnd(0.6);
                }
                if (rng.random.boolean()) {
                    self.p_base_freq = 0.2 + frnd(0.3);
                    self.p_freq_ramp = 0.1 + frnd(0.4);
                    self.p_repeat_speed = 0.4 + frnd(0.4);
                } else {
                    self.p_base_freq = 0.2 + frnd(0.3);
                    self.p_freq_ramp = 0.05 + frnd(0.2);
                    if (rng.random.boolean()) {
                        self.p_vib_strength = frnd(0.7);
                        self.p_vib_speed = frnd(0.6);
                    }
                }
                self.p_env_attack = 0.0;
                self.p_env_sustain = frnd(0.4);
                self.p_env_decay = 0.1 + frnd(0.4);
            },
            .hurt => {
                self.wave_type = rnd(2);
                if (self.wave_type == 2)
                    self.wave_type = 3;
                if (self.wave_type == 0)
                    self.p_duty = frnd(0.6);
                self.p_base_freq = 0.2 + frnd(0.6);
                self.p_freq_ramp = -0.3 - frnd(0.4);
                self.p_env_attack = 0.0;
                self.p_env_sustain = frnd(0.1);
                self.p_env_decay = 0.1 + frnd(0.2);
                if (rng.random.boolean())
                    self.p_hpf_freq = frnd(0.3);
            },
            .jump => {
                self.wave_type = 0;
                self.p_duty = frnd(0.6);
                self.p_base_freq = 0.3 + frnd(0.3);
                self.p_freq_ramp = 0.1 + frnd(0.2);
                self.p_env_attack = 0.0;
                self.p_env_sustain = 0.1 + frnd(0.3);
                self.p_env_decay = 0.1 + frnd(0.2);
                if (rng.random.boolean())
                    self.p_hpf_freq = frnd(0.3);
                if (rng.random.boolean())
                    self.p_lpf_freq = 1.0 - frnd(0.6);
            },
            .blip => {
                self.wave_type = rnd(1);
                if (self.wave_type == 0)
                    self.p_duty = frnd(0.6);
                self.p_base_freq = 0.2 + frnd(0.4);
                self.p_env_attack = 0.0;
                self.p_env_sustain = 0.1 + frnd(0.1);
                self.p_env_decay = frnd(0.2);
                self.p_hpf_freq = 0.1;
            },
        }
    }
};

pub const SfxrDataSource = extern struct {
    ds: ma_data_source_callbacks = undefined,
    engine: *AudioEngine = undefined,

    looping: bool = false,
    playing_sample: bool = true,
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

    params: SfxrParams = .{},

    pub fn create(engine: *AudioEngine) !*SfxrDataSource {
        var dds = try engine.allocator.create(SfxrDataSource);
        dds.* = .{};
        dds.resetSample(false);
        dds.ds = std.mem.zeroInit(ma_data_source_callbacks, .{
            .onRead = onRead,
            .onGetDataFormat = onGetDataFormat,
        });
        dds.engine = engine;

        return dds;
    }

    pub fn destroy(self: *@This()) void {
        self.engine.allocator.destroy(sel);
    }

    pub fn createSound(self: *@This()) !Sound {
        return Sound.initFromMaDataSource(self.data_source.engine, self, 0) catch unreachable;
    }

    pub fn resetSample(self: *SfxrDataSource, restart: bool) void {
        if (!restart)
            self.phase = 0;
        self.fperiod = 100.0 / (self.params.p_base_freq * self.params.p_base_freq + 0.001);
        self.period = @floatToInt(i32, self.fperiod);
        self.fmaxperiod = 100.0 / (self.params.p_freq_limit * self.params.p_freq_limit + 0.001);
        self.fslide = 1.0 - pow(f32, self.params.p_freq_ramp, 3.0) * 0.01;
        self.fdslide = -pow(f32, self.params.p_freq_dramp, 3.0) * 0.000001;
        self.square_duty = 0.5 - self.params.p_duty * 0.5;
        self.square_slide = -self.params.p_duty_ramp * 0.00005;

        if (self.params.p_arp_mod >= 0.0) {
            self.arp_mod = 1.0 - pow(f32, self.params.p_arp_mod, 2.0) * 0.9;
        } else {
            self.arp_mod = 1.0 + pow(f32, self.params.p_arp_mod, 2.0) * 10.0;
        }
        self.arp_time = 0;
        self.arp_limit = @floatToInt(i32, pow(f32, 1.0 - self.params.p_arp_speed, 2.0) * 20000 + 32);
        if (self.params.p_arp_speed == 1.0)
            self.arp_limit = 0;

        if (!restart) {
            // reset filter
            self.fltp = 0.0;
            self.fltdp = 0.0;
            self.fltw = pow(f32, self.params.p_lpf_freq, 3.0) * 0.1;
            self.fltw_d = 1.0 + self.params.p_lpf_ramp * 0.0001;
            self.fltdmp = 5.0 / (1.0 + pow(f32, self.params.p_lpf_resonance, 2.0) * 20.0) * (0.01 + self.fltw);
            if (self.fltdmp > 0.8) self.fltdmp = 0.8;
            self.fltphp = 0.0;
            self.flthp = pow(f32, self.params.p_hpf_freq, 2.0) * 0.1;
            self.flthp_d = (1.0 + self.params.p_hpf_ramp * 0.0003);

            // reset vibrato
            self.vib_phase = 0.0;
            self.vib_speed = pow(f32, self.params.p_vib_speed, 2.0) * 0.01;
            self.vib_amp = self.params.p_vib_strength * 0.5;

            // reset envelope
            self.env_vol = 0.0;
            self.env_stage = 0;
            self.env_time = 0;
            self.env_length[0] = @floatToInt(i32, self.params.p_env_attack * self.params.p_env_attack * 100000.0);
            self.env_length[1] = @floatToInt(i32, self.params.p_env_sustain * self.params.p_env_sustain * 100000.0);
            self.env_length[2] = @floatToInt(i32, self.params.p_env_decay * self.params.p_env_decay * 100000.0);

            self.fphase = pow(f32, self.params.p_pha_offset, 2.0) * 1020.0;
            if (self.params.p_pha_offset < 0.0) self.fphase = -self.fphase;
            self.fdphase = pow(f32, self.params.p_pha_ramp, 2.0) * 1.0;
            if (self.params.p_pha_ramp < 0.0) self.fdphase = -self.fdphase;
            self.iphase = @floatToInt(i32, std.math.absFloat(self.fphase));
            self.ipp = 0;

            var i: usize = 0;
            while (i < 1024) : (i += 1) {
                self.phaser_buffer[i] = 0;
            }

            i = 0;
            while (i < 32) : (i += 1) {
                self.noise_buffer[i] = frnd(2) - 1;
            }

            self.rep_time = 0;
            self.rep_limit = @floatToInt(i32, pow(f32, 1.0 - self.params.p_repeat_speed, 2.0) * 20000 + 32);
            if (self.params.p_repeat_speed == 0.0)
                self.rep_limit = 0;
        }
    }

    fn onRead(data_source: ?*ma_data_source, frames_out: ?*c_void, frame_count: ma_uint64, frames_read: [*c]ma_uint64) callconv(.C) ma_result {
        var self = @ptrCast(*SfxrDataSource, @alignCast(@alignOf(SfxrDataSource), data_source));
        var out = @ptrCast([*]f32, @alignCast(@alignOf(f32), frames_out))[0..frame_count];

        for (out) |*frame, i| {
            self.rep_time += 1;
            if (self.rep_limit != 0 and self.rep_time >= self.rep_limit) {
                self.rep_time = 0;
                self.resetSample(true);
            }

            // frequency envelopes/arpeggios
            self.arp_time += 1;
            if (self.arp_limit != 0 and self.arp_time >= self.arp_limit) {
                self.arp_limit = 0;
                self.fperiod *= self.arp_mod;
            }
            self.fslide += self.fdslide;
            self.fperiod *= self.fslide;
            if (self.fperiod > self.fmaxperiod) {
                self.fperiod = self.fmaxperiod;
                if (self.params.p_freq_limit > 0.0) {
                    if (self.looping) {
                        self.resetSample(false);
                    } else {
                        self.playing_sample = false;
                        frames_read.* = i;
                        return MA_AT_END;
                    }
                }
            }
            var rfperiod = self.fperiod;
            if (self.vib_amp > 0.0) {
                self.vib_phase += self.vib_speed;
                rfperiod = (self.fperiod * (1.0 + std.math.sin(self.vib_phase) * self.vib_amp));
            }
            self.period = @floatToInt(i32, rfperiod);
            if (self.period < 8) self.period = 8;
            self.square_duty += self.square_slide;
            if (self.square_duty < 0.0) self.square_duty = 0.0;
            if (self.square_duty > 0.5) self.square_duty = 0.5;

            // volume envelope
            self.env_time += 1;
            if (self.env_time > self.env_length[@intCast(usize, self.env_stage)]) {
                self.env_time = 0;
                self.env_stage += 1;
                if (self.env_stage == 3) {
                    if (self.looping) {
                        self.resetSample(false);
                    } else {
                        self.playing_sample = false;
                        frames_read.* = i;
                        return MA_AT_END;
                    }
                }
            }
            if (self.env_stage == 0) {
                if (self.env_length[0] > 0) {
                    self.env_vol = @intToFloat(f32, self.env_time) / @intToFloat(f32, self.env_length[0]);
                } else {
                    self.env_vol = 0;
                }
            }
            if (self.env_stage == 1) {
                if (self.env_length[1] > 0) {
                    self.env_vol = 1.0 + pow(f32, 1.0 - @intToFloat(f32, self.env_time) / @intToFloat(f32, self.env_length[1]), 1.0) * 2.0 * self.params.p_env_punch;
                } else {
                    self.env_vol = 0;
                }
            }
            if (self.env_stage == 2) {
                if (self.env_length[2] > 0) {
                    self.env_vol = 1.0 - @intToFloat(f32, self.env_time) / @intToFloat(f32, self.env_length[2]);
                } else {
                    self.env_vol = 0;
                }
            }

            // phaser step
            self.fphase += self.fdphase;
            self.iphase = @floatToInt(i32, std.math.absFloat(self.fphase));
            if (self.iphase > 1023) self.iphase = 1023;

            if (self.flthp_d != 0.0) {
                self.flthp *= self.flthp_d;
                if (self.flthp < 0.00001) self.flthp = 0.00001;
                if (self.flthp > 0.1) self.flthp = 0.1;
            }

            var ssample: f32 = 0.0;
            var si: usize = 0;
            while (si < 8) : (si += 1) { // 8x supersampling
                var sample: f32 = 0.0;
                self.phase += 1;
                if (self.phase >= self.period) {
                    self.phase = @mod(self.phase, self.period);
                    if (self.params.wave_type == 3) {
                        var k: usize = 0;
                        while (k < 32) : (k += 32) {
                            self.noise_buffer[k] = frnd(2.0) - 1.0;
                        }
                    }
                }

                // base waveform
                var fp = @intToFloat(f32, self.phase) / @intToFloat(f32, self.period);

                switch (self.params.wave_type) {
                    0 => {
                        // square
                        if (fp < self.square_duty) {
                            sample = 0.5;
                        } else {
                            sample = -0.5;
                        }
                    },
                    1 => {
                        // sawtooth
                        sample = 1.0 - fp * 2;
                    },
                    2 => {
                        // sine
                        sample = std.math.sin(fp * 2 * std.math.pi);
                    },
                    3 => {
                        // noise
                        sample = self.noise_buffer[@intCast(usize, @divTrunc(self.phase * 32, self.period))];
                    },
                    else => {},
                }

                // lp filter
                var pp = self.fltp;
                self.fltw *= self.fltw_d;
                if (self.fltw < 0.0) self.fltw = 0.0;
                if (self.fltw > 0.1) self.fltw = 0.1;
                if (self.params.p_lpf_freq != 1.0) {
                    self.fltdp += (sample - self.fltp) * self.fltw;
                    self.fltdp -= self.fltdp * self.fltdmp;
                } else {
                    self.fltp = sample;
                    self.fltdp = 0.0;
                }
                self.fltp += self.fltdp;

                // hp filter
                self.fltphp += self.fltp - pp;
                self.fltphp -= self.fltphp * self.flthp;
                sample = self.fltphp;

                // phaser
                self.phaser_buffer[@intCast(usize, self.ipp & 1023)] = sample;
                sample += self.phaser_buffer[@intCast(usize, (self.ipp - self.iphase + 1024) & 1023)];
                self.ipp = (self.ipp + 1) & 1023;
                // final accumulation and envelope application
                ssample += sample * self.env_vol;
            }

            ssample = ssample / 8 * self.params.master_vol;
            ssample *= 2.0 * self.params.sound_vol;

            frame.* = std.math.clamp(ssample, -1, 1);
        }
        frames_read.* = frame_count;
        return MA_SUCCESS;
    }

    pub fn onSeek(data_source: ?*ma_data_source, frame_index: ma_uint64) callconv(.C) ma_result {
        std.debug.print("onSeek: {d}\n", .{frame_index});
        var base = @ptrCast(*SfxrDataSource, @alignCast(@alignOf(SfxrDataSource), data_source));
        return MA_SUCCESS;
    }

    pub fn onGetDataFormat(data_source: ?*ma_data_source, format: [*c]ma_format, channels: [*c]ma_uint32, sample_rate: [*c]ma_uint32) callconv(.C) ma_result {
        var base = @ptrCast(*SfxrDataSource, @alignCast(@alignOf(SfxrDataSource), data_source));

        format.* = base.engine.engine.format;
        channels.* = 1;
        sample_rate.* = base.engine.engine.sampleRate;
        return MA_SUCCESS;
    }
};

pub const SfxrPreset = enum(u3) {
    coin,
    laser,
    explosion,
    power_up,
    hurt,
    jump,
    blip,
};
