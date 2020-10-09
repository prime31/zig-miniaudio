usingnamespace @cImport({
    @cInclude("miniaudio.h");
    @cInclude("miniaudio_engine.h");
});

const std = @import("std");

const LoadNotification = struct {
    cb: ma_async_notification_callbacks = .{ .onSignal = null },
    sound: ?*ma_sound = null,

    pub fn init(sound: *ma_sound, onSignal: fn (?*ma_async_notification, c_int) callconv(.C) void) LoadNotification {
        var note = LoadNotification{ .sound = sound };
        note.cb.onSignal = onSignal;
        return note;
    }
};

pub const AudioEngine = struct {
    engine: *ma_engine,

    pub fn init() !AudioEngine {
        return initWithOptions(null);
    }

    pub fn initWithOptions(config: ?*ma_engine_config) !AudioEngine {
        var engine = try std.testing.allocator.create(ma_engine);

        const res = ma_engine_init(config, engine);
        if (res == MA_SUCCESS)
            return AudioEngine{ .engine = engine };

        std.testing.allocator.destroy(engine);
        return errorForResult(res);
    }

    pub fn deinit(self: *@This()) void {
        ma_engine_uninit(self.engine);
        std.testing.allocator.destroy(self.engine);
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

    pub fn initSoundGroup(self: *@This()) !SoundGroup {
        return SoundGroup.init(self);
    }

    pub fn initSoundGroupWithParent(self: *@This(), parent: SoundGroup) !SoundGroup {
        return SoundGroup.initWithParent(self, parent);
    }

    pub fn initSound(self: *@This(), path: [*c]const u8) !Sound {
        return Sound.init(self, path);
    }

    pub fn initSoundWithOptions(self: *@This(), path: [*c]const u8, options: Sound.LoadOptions) !Sound {
        return Sound.initWithOptions(self, path, options);
    }

    pub fn initSoundFromDataSource(self: *@This(), data_source: *ma_data_source, flags: ma_unit32) !Sound {
        return Sound.initFromDataSource(self, data_source, flags);
    }
};

pub const SoundGroup = struct {
    group: *ma_sound_group,

    pub fn init(engine: *AudioEngine) !SoundGroup {
        var group = try std.testing.allocator.create(ma_sound_group);

        const res = ma_sound_group_init(engine.engine, null, group);
        if (res == MA_SUCCESS)
            return SoundGroup{ .group = group };

        std.testing.allocator.destroy(group);
        return errorForResult(res);
    }

    pub fn deinit(self: @This()) void {
        ma_sound_group_uninit(self.group);
        std.testing.allocator.destroy(self.group);
    }

    pub fn initWithParent(engine: *AudioEngine, parent: SoundGroup) !SoundGroup {
        var group = try std.testing.allocator.create(ma_sound_group);

        const res = ma_sound_group_init(engine.engine, parent.group, group);
        if (res == MA_SUCCESS)
            return SoundGroup{ .group = group };

        std.testing.allocator.destroy(group);
        return errorForResult(res);
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

pub const Sound = struct {
    sound: *ma_sound,

    pub const LoadOptions = struct {
        stream: bool = false,
        group: ?SoundGroup = null,

        pub fn getFlags(self: @This()) c_uint {
            if (self.stream) return MA_DATA_SOURCE_FLAG_DECODE | MA_DATA_SOURCE_FLAG_STREAM | MA_DATA_SOURCE_FLAG_ASYNC;
            return MA_DATA_SOURCE_FLAG_DECODE;
        }
    };

    pub fn init(engine: *AudioEngine, path: [*c]const u8) !Sound {
        return initWithOptions(engine, path, .{});
    }

    pub fn initWithOptions(engine: *AudioEngine, path: [*c]const u8, options: LoadOptions) !Sound {
        var sound = try std.testing.allocator.create(ma_sound);

        var group = if (options.group) |g| g.group else null;
        const res = ma_sound_init_from_file(engine.engine, path, options.getFlags(), null, group, sound);
        if (res == MA_SUCCESS) {
            return Sound{ .sound = sound };
        }

        std.testing.allocator.destroy(sound);
        return errorForResult(res);
    }

    pub fn initFromDataSource(engine: *AudioEngine, data_source: *ma_data_source, flags: ma_unit32) !Sound {
        var sound = try std.testing.allocator.create(ma_sound);

        const res = init_from_data_source(engine.engine, data_source, flags, null, sound);
        if (res == MA_SUCCESS) {
            return Sound{ .sound = sound };
        }

        std.testing.allocator.destroy(sound);
        return errorForResult(res);
    }

    pub fn deinit(self: @This()) void {
        ma_sound_uninit(self.sound);
        std.testing.allocator.destroy(self.sound);
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

    pub fn setEffect(self: *@This(), effect: *ma_effect) void {
        _ = ma_sound_set_effect(self.sound, effect);
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
};

fn errorForResult(res: ma_result) anyerror {
    std.debug.print("----- errors still need to be filled in: {}\n", .{res});
    return switch (res) {
        else => error.Unknown,
    };
}
