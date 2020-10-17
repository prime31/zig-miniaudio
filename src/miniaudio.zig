usingnamespace @import("c.zig").ma;
usingnamespace @import("sfxr.zig");
usingnamespace @import("dynamic.zig");

const std = @import("std");

pub const AudioEngine = struct {
    allocator: *std.mem.Allocator = undefined,
    engine: *ma_engine,

    pub fn create(allocator: *std.mem.Allocator) !AudioEngine {
        return createWithOptions(allocator, null);
    }

    pub fn createWithOptions(allocator: *std.mem.Allocator, config: ?*ma_engine_config) !AudioEngine {
        var engine = try allocator.create(ma_engine);

        const res = ma_engine_init(config, engine);
        if (res == MA_SUCCESS)
            return AudioEngine{ .allocator = allocator, .engine = engine };

        allocator.destroy(engine);
        return errorForResult(res);
    }

    pub fn destroy(self: *@This()) void {
        ma_engine_uninit(self.engine);
        self.allocator.destroy(self.engine);
    }

    pub fn setVolume(self: *@This(), volume: f32) void {
        _ = ma_engine_set_volume(self.engine, volume);
    }

    pub fn setGain(self: *@This(), gain_db: f32) void {
        _ = ma_engine_set_gain_db(self.engine, gain_db);
    }

    pub fn getMasterSoundGroup(self: *@This()) *ma_sound_group {
        return &self.engine.masterSoundGroup;
    }

    pub fn setListenerPosition(self: *@This(), position: vec3) void {
        _ = ma_engine_listener_set_position(self.engine, position);
    }

    pub fn playOneShot(self: *@This(), path: [*c]const u8) !void {
        const res = ma_engine_play_sound(self.engine, path, null);
        if (res == MA_SUCCESS) return;

        return errorForResult(res);
    }

    pub fn createSoundGroup(self: *@This()) !SoundGroup {
        return SoundGroup.create(self);
    }

    pub fn createSoundGroupWithParent(self: *@This(), parent: SoundGroup) !SoundGroup {
        return SoundGroup.createWithParent(self, parent);
    }

    pub fn createSound(self: *@This(), path: [*c]const u8) !Sound {
        return Sound.create(self, path);
    }

    pub fn createSoundWithOptions(self: *@This(), path: [*c]const u8, options: Sound.LoadOptions) !Sound {
        return Sound.createWithOptions(self, path, options);
    }

    pub fn createSoundFromDataSource(self: *@This(), data_source: *ma_data_source, flags: ma_uint32) !Sound {
        return Sound.createFromDataSource(self, data_source, flags);
    }
};

pub const SoundGroup = struct {
    allocator: *std.mem.Allocator = undefined,
    group: *ma_sound_group,

    pub fn create(engine: *AudioEngine) !SoundGroup {
        var group = try engine.allocator.create(ma_sound_group);

        const res = ma_sound_group_init(engine.engine, null, group);
        if (res == MA_SUCCESS)
            return SoundGroup{ .allocator = engine.allocator, .group = group };

        engine.allocator.destroy(group);
        return errorForResult(res);
    }

    pub fn createWithParent(engine: *AudioEngine, parent: SoundGroup) !SoundGroup {
        var group = try engine.allocator.create(ma_sound_group);

        const res = ma_sound_group_init(engine.engine, parent.group, group);
        if (res == MA_SUCCESS)
            return SoundGroup{ .allocator = engine.allocator, .group = group };

        engine.allocator.destroy(group);
        return errorForResult(res);
    }

    pub fn destroy(self: *@This()) void {
        ma_sound_group_uninit(self.group);
        self.allocator.destroy(self.group);
    }

    pub fn isPlaying(self: @This()) bool {
        return ma_sound_group_is_playing(self.group) == 1;
    }

    pub fn start(self: *@This()) void {
        _ = ma_sound_group_start(self.group);
    }

    pub fn stop(self: *@This()) void {
        _ = ma_sound_group_stop(self.group);
    }

    pub fn setVolume(self: *@This(), volume: f32) void {
        _ = ma_sound_group_set_volume(self.group, volume);
    }

    pub fn getVolume(self: *@This()) f32 {
        return self.group.mixer.volume;
    }

    pub fn setGain(self: *@This(), gain_db: f32) void {
        _ = ma_sound_group_set_gain_db(self.group, gain_db);
    }

    pub fn setEffect(self: *@This(), effect: *ma_effect) void {
        _ = ma_sound_group_set_effect(self.group, effect);
    }

    pub fn setPan(self: *@This(), pan: f32) void {
        _ = ma_sound_group_set_pan(self.group, pan);
    }

    pub fn setPitch(self: *@This(), pitch: f32) void {
        _ = ma_sound_group_set_pitch(self.group, pitch);
    }

    pub fn setFadePointInFrames(self: *@This(), fade_point_index: c_uint, volume_beg: f32, volume_end: f32, time_in_frames_beg: c_ulonglong, time_in_frames_end: c_ulonglong) void {
        _ = ma_sound_set_fade_point_in_frames(self.sound, fade_point_index, volume_beg, volume_end, time_in_frames_beg, time_in_frames_end);
    }

    pub fn setFadePointInMilliseconds(self: *@This(), fade_point_index: c_uint, volume_beg: f32, volume_end: f32, time_in_ms_beg: c_ulonglong, time_in_ms_end: c_ulonglong) void {
        _ = ma_sound_group_set_fade_point_in_milliseconds(self.group, fade_point_index, volume_beg, volume_end, time_in_ms_beg, time_in_ms_end);
    }

    pub fn setFadePointAutoReset(self: *@This(), fade_point_index: c_uint, auto_reset: bool) void {
        _ = ma_sound_group_set_fade_point_auto_reset(self.group, fade_point_index, if (auto_reset) 1 else 0);
    }

    pub fn setStartDelay(self: *@This(), delay_in_ms: c_ulonglong) void {
        _ = ma_sound_group_set_start_delay(self.group, delay);
    }

    pub fn setStopDelay(self: *@This(), delay_in_ms: c_ulonglong) !void {
        _ = ma_sound_group_set_stop_delay(self.group, delay_in_ms);
    }

    pub fn getTimeInFrames(self: *@This()) c_ulonglong {
        var time_in_frames: c_ulonglong = undefined;
        _ = ma_sound_group_get_time_in_frames(self.group, &time_in_frames);
        return time_in_frames;
    }
};

pub const Sound = extern struct {
    allocator: *std.mem.Allocator = undefined,
    sound: *ma_sound,

    pub const LoadOptions = struct {
        stream: bool = false,
        group: ?SoundGroup = null,

        pub fn getFlags(self: @This()) c_uint {
            if (self.stream) return MA_DATA_SOURCE_FLAG_DECODE | MA_DATA_SOURCE_FLAG_STREAM | MA_DATA_SOURCE_FLAG_ASYNC;
            return MA_DATA_SOURCE_FLAG_DECODE;
        }
    };

    pub fn create(engine: *AudioEngine, path: [*c]const u8) !Sound {
        return createWithOptions(engine, path, .{});
    }

    pub fn createWithOptions(engine: *AudioEngine, path: [*c]const u8, options: LoadOptions) !Sound {
        var sound = try engine.allocator.create(ma_sound);

        var group = if (options.group) |g| g.group else null;
        const res = ma_sound_init_from_file(engine.engine, path, options.getFlags(), null, group, sound);
        if (res == MA_SUCCESS) {
            return Sound{ .allocator = engine.allocator, .sound = sound };
        }

        engine.allocator.destroy(sound);
        return errorForResult(res);
    }

    /// data_source should be an extern struct with the first field of type ma_data_source_callbacks
    pub fn createFromDataSource(engine: *AudioEngine, data_source: anytype, flags: ma_uint32) !Sound {
        comptime {
            var first_field = std.meta.fields(std.meta.Child(@TypeOf(data_source)))[0];
            std.debug.assert(first_field.field_type == ma_data_source_callbacks);
        }

        // TODO: dont leak the data_source
        var sound = try engine.allocator.create(ma_sound);

        const res = ma_sound_init_from_data_source(engine.engine, data_source, flags, null, sound);
        if (res == MA_SUCCESS) {
            return Sound{ .allocator = engine.allocator, .sound = sound };
        }

        engine.allocator.destroy(sound);
        return errorForResult(res);
    }

    pub fn createWaveform(engine: *AudioEngine, waveform_type: ma_waveform_type, amplitude: f64, frequency: f64) !Sound {
        // TODO: dont leak the ma_waveform
        var waveform = engine.allocator.create(ma_waveform) catch unreachable;
        errdefer engine.allocator.destroy(waveform);

        const config = ma_waveform_config_init(engine.engine.format, engine.engine.channels, engine.engine.sampleRate, waveform_type, amplitude, frequency);
        var res = ma_waveform_init(&config, waveform);
        if (res != 0) {
            engine.allocator.destroy(waveform);
            return errorForResult(res);
        }

        return createFromDataSource(engine, waveform, 0);
    }

    pub fn destroy(self: @This()) void {
        ma_sound_uninit(self.sound);
        self.allocator.destroy(self.sound);
    }

    pub fn isPlaying(self: @This()) bool {
        return self.sound.isPlaying == 1;
    }

    pub fn isAtEnd(self: @This()) bool {
        return self.sound.atEnd == 1;
    }

    pub fn start(self: *@This()) void {
        _ = ma_sound_start(self.sound);
    }

    pub fn stop(self: *@This()) void {
        _ = ma_sound_stop(self.sound);
    }

    pub fn setVolume(self: *@This(), volume: f32) void {
        self.sound.volume = volume;
    }

    pub fn getVolume(self: *@This()) f32 {
        return self.sound.volume;
    }

    pub fn setGain(self: *@This(), gain_db: f32) void {
        self.setVolume(ma_gain_db_to_factor(gain_db));
    }

    pub fn setEffect(self: *@This(), effect: ?*ma_effect) void {
        self.sound.effect.pPreEffect = effect;
        // _ = ma_sound_set_effect(self.sound, effect);
    }

    pub fn setPan(self: *@This(), pan: f32) void {
        _ = ma_sound_set_pan(self.sound, pan);
    }

    pub fn getPan(self: *@This()) f32 {
        return self.sound.effect.panner.pan;
    }

    pub fn setPitch(self: *@This(), pitch: f32) void {
        _ = ma_sound_set_pitch(self.sound, pitch);
    }

    pub fn getPitch(self: *@This()) f32 {
        return self.sound.effect.pitch;
    }

    pub fn setPosition(self: *@This(), position: vec3) void {
        _ = ma_sound_set_position(self.sound, position);
    }

    pub fn setLooping(self: *@This(), looping: bool) void {
        _ = ma_sound_set_looping(self.sound, if (looping) 1 else 0);
    }

    pub fn getLooping(self: @This()) bool {
        return self.sound.isLooping == 1;
    }

    pub fn setFadePointInFrames(self: *@This(), fade_point_index: c_uint, volume_beg: f32, volume_end: f32, time_in_frames_beg: c_ulonglong, time_in_frames_end: c_ulonglong) void {
        _ = ma_sound_set_fade_point_in_frames(self.sound, fade_point_index, volume_beg, volume_end, time_in_frames_beg, time_in_frames_end);
    }

    pub fn setFadePointInMilliseconds(self: *@This(), fade_point_index: c_uint, volume_beg: f32, volume_end: f32, time_in_ms_beg: c_ulonglong, time_in_ms_end: c_ulonglong) void {
        _ = ma_sound_set_fade_point_in_milliseconds(self.sound, fade_point_index, volume_beg, volume_end, time_in_ms_beg, time_in_ms_end);
    }

    /// Enables fading around loop transitions when false
    pub fn setFadePointAutoReset(self: *@This(), fade_point_index: c_uint, auto_reset: bool) void {
        _ = ma_sound_set_fade_point_auto_reset(self.sound, fade_point_index, if (auto_reset) 1 else 0);
    }

    pub fn setStartDelay(self: *@This(), delay_in_ms: c_ulonglong) void {
        _ = ma_sound_set_start_delay(self.sound, delay);
    }

    pub fn setStopDelay(self: *@This(), delay_in_ms: c_ulonglong) !void {
        _ = ma_sound_set_stop_delay(self.sound, delay_in_ms);
    }

    pub fn getTimeInFrames(self: *@This(), delay_in_ms: c_ulonglong) c_ulonglong {
        var time: c_ulonglong = undefined;
        _ = ma_sound_get_time_in_frames(self.sound, &time);
        return time;
    }

    pub fn seekToPcmFrame(self: *@This(), frame_index: c_ulonglong) void {
        _ = ma_sound_seek_to_pcm_frame(self.sound, frame_index);
    }

    pub fn getDataFormat(self: *@This()) struct { format: ma_format, channels: ma_uint32, sample_rate: ma_uint32 } {
        var format: ma_format = undefined;
        var channels: ma_uint32 = undefined;
        var sample_rate: ma_uint32 = undefined;
        _ = ma_sound_get_data_format(self.sound, &format, &channels, &sample_rate);
        return .{
            .format = format,
            .channels = channels,
            .sample_rate = sample_rate,
        };
    }

    pub fn getCursorInPcmFrames(self: *@This()) c_ulonglong {
        var cursor: c_ulonglong = undefined;
        _ = ma_sound_get_cursor_in_pcm_frames(self.sound, &cursor);
    }

    pub fn getLengthInPcmFrames(self: *@This()) c_ulonglong {
        var length: c_ulonglong = undefined;
        _ = ma_sound_get_length_in_pcm_frames(self.sound, &length);
        return length;
    }

    pub fn getLength(self: *@This()) f32 {
        const format = self.getDataFormat();
        const frames = self.getLengthInPcmFrames();
        return @intToFloat(f32, frames / format.sample_rate);
    }
};

fn errorForResult(res: ma_result) anyerror {
    return switch (res) {
        MA_INVALID_ARGS => error.InvalidArgs,
        MA_OUT_OF_MEMORY => error.OutOfMemory,
        MA_OUT_OF_RANGE => error.OutOfRange,
        MA_ACCESS_DENIED => error.AccessDenied,
        MA_DOES_NOT_EXIST => error.DoesNotExist,
        MA_ALREADY_EXISTS => error.AlreadyExists,
        MA_TOO_MANY_OPEN_FILES => error.TooManyOpenFiles,
        MA_INVALID_FILE => error.InvalidFile,
        MA_TOO_BIG => error.TooBig,
        MA_PATH_TOO_LONG => error.PathTooLong,
        MA_NAME_TOO_LONG => error.NameTooLong,
        MA_NOT_DIRECTORY => error.NotDirectory,
        MA_IS_DIRECTORY => error.IsDirectory,
        else => error.Unknown,
    };
}
