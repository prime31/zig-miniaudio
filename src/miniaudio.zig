usingnamespace @import("c.zig").ma;
usingnamespace @import("sfxr.zig");

const std = @import("std");

const LoadNotification = extern struct {
    cb: ma_async_notification_callbacks = .{ .onSignal = onSoundLoaded },
    sound: *Sound,
    allocator: *std.mem.Allocator = undefined,

    pub fn create(allocator: *std.mem.Allocator, sound: *Sound) !LoadNotification {
        var note = try allocator.create(LoadNotification);
        note.cb.onSignal = onSoundLoaded;
        note.sound = sound;
        note.allocator = allocator;
        return note;
    }

    pub fn destroy(self: *@This()) void {
        self.allocator.destroy(self);
    }

    fn onSoundLoaded(notification: ?*ma_async_notification, code: c_int) callconv(.C) void {
        var note = @ptrCast(*LoadNotification, @alignCast(@alignOf(LoadNotification), notification));
        std.debug.print("Loaded. code: {}-----------\n", .{code});

        if (code == MA_NOTIFICATION_COMPLETE) {
            note.destroy();
        } else if (code == MA_NOTIFICATION_FAILED) {
            note.destroy();
        }
    }
};

pub const PassThroughEffect = extern struct {
    base: ma_effect_base,
    format: ma_format,
    channels: ma_uint32,

    pub fn init(format: ma_format, channels: ma_uint32) PassThroughEffect {
        return .{
            .base = std.mem.zeroInit(ma_effect_base, .{
                .onProcessPCMFrames = onProcessPCMFrames,
                // .onGetRequiredInputFrameCount = onGetRequiredInputFrameCount;
                // .onGetExpectedOutputFrameCount = onGetExpectedOutputFrameCount;
                .onGetInputDataFormat = onGetInputDataFormat,
                .onGetOutputDataFormat = onGetOutputDataFormat,
            }),
            .format = format,
            .channels = channels,
        };
    }

    /// inputFrameCount is how many valid input frames are available in the input buffer.
    /// On output you need to set it to how many input frames were actually consumed.
    /// On input, outputFrameCount is the capacity of the output buffer.
    /// On output you need to set it to how many output frames were actually output.
    fn onProcessPCMFrames(effect: ?*ma_effect, frames_in: ?*const c_void, frame_count_in: [*c]ma_uint64, frames_out: ?*c_void, frame_count_out: [*c]ma_uint64) callconv(.C) ma_result {
        std.debug.print("onProcessPCMFrames\n", .{});
        var base = @ptrCast(*PassThroughEffect, @alignCast(@alignOf(PassThroughEffect), effect));

        const frame_count: ma_uint64 = std.math.min(frame_count_in.*, frame_count_out.*);
        _ = ma_copy_pcm_frames(frames_out, frames_in, frame_count, base.format, base.channels);

        // example of doing a pan effect, which only operates in stereo streams which is why the slice is frame_count * 2
        // var out = @ptrCast([*]f32, @alignCast(@alignOf(f32), frames_out))[0..frame_count * 2];
        // var in = @ptrCast([*]const f32, @alignCast(@alignOf(f32), frames_in))[0..frame_count * 2];
        // stereoBalancePcmFrames(out, in, frame_count, -1);

        frame_count_in.* = frame_count;
        frame_count_out.* = frame_count;

        return MA_SUCCESS;
    }

    // example of doing a pan effect
    fn stereoBalancePcmFrames(out: []f32, in: []const f32, frame_count: ma_uint64, pan: f32) void {
        var i: usize = 0;

        if (pan > 0) {
            var factor = 1.0 - pan;
            if (out.ptr == in.ptr) {
                while (i < frame_count) : (i += 1) {
                    out[i * 2 + 0] = in[i * 2 + 0] * factor;
                }
            } else {
                while (i < frame_count) : (i += 1) {
                    out[i * 2 + 0] = in[i * 2 + 0] * factor;
                    out[i * 2 + 1] = in[i * 2 + 1];
                }
            }
        } else {
            var factor = 1.0 + pan;
            if (out.ptr == in.ptr) {
                while (i < frame_count) : (i += 1) {
                    out[i * 2 + 1] = in[i * 2 + 1] * factor;
                }
            } else {
                while (i < frame_count) : (i += 1) {
                    out[i * 2 + 0] = in[i * 2 + 0];
                    out[i * 2 + 1] = in[i * 2 + 1] * factor;
                }
            }
        }
    }

    fn onGetRequiredInputFrameCount(effect: ?*ma_effect, output_frame_count: ma_uint64) callconv(.C) ma_uint64 {
        std.debug.print("onGetRequiredInputFrameCount\n", .{});
        return MA_SUCCESS;
    }

    fn onGetExpectedOutputFrameCount(effect: ?*ma_effect, input_frame_count: ma_uint64) callconv(.C) ma_uint64 {
        std.debug.print("onGetExpectedOutputFrameCount\n", .{});
        var base = @ptrCast(*PassThroughEffect, @alignCast(@alignOf(PassThroughEffect), effect));

        const out_frame_count = ma_effect_get_expected_output_frame_count(&base.base, input_frame_count);
        std.debug.print("---- out_frame_count: {}\n", .{out_frame_count});
        return out_frame_count;
    }

    fn onGetInputDataFormat(effect: ?*ma_effect, format: [*c]ma_format, channels: [*c]ma_uint32, sample_rate: [*c]ma_uint32) callconv(.C) ma_result {
        var base = @ptrCast(*PassThroughEffect, @alignCast(@alignOf(PassThroughEffect), effect));

        format.* = base.format;
        channels.* = base.channels;
        sample_rate.* = 0; //snd_format.sample_rate;
        return MA_SUCCESS;
    }

    fn onGetOutputDataFormat(effect: ?*ma_effect, format: [*c]ma_format, channels: [*c]ma_uint32, sample_rate: [*c]ma_uint32) callconv(.C) ma_result {
        var base = @ptrCast(*PassThroughEffect, @alignCast(@alignOf(PassThroughEffect), effect));

        format.* = base.format;
        channels.* = base.channels;
        sample_rate.* = 0; //snd_format.sample_rate;
        return MA_SUCCESS;
    }
};

pub const AudioEngine = struct {
    allocator: *std.mem.Allocator = undefined,
    engine: *ma_engine,

    pub fn init(allocator: *std.mem.Allocator) !AudioEngine {
        return initWithOptions(allocator, null);
    }

    pub fn initWithOptions(allocator: *std.mem.Allocator, config: ?*ma_engine_config) !AudioEngine {
        var engine = try allocator.create(ma_engine);

        const res = ma_engine_init(config, engine);
        if (res == MA_SUCCESS)
            return AudioEngine{ .allocator = allocator, .engine = engine };

        allocator.destroy(engine);
        return errorForResult(res);
    }

    pub fn deinit(self: *@This()) void {
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

    pub fn initSoundFromDataSource(self: *@This(), data_source: *DataSource, flags: ma_uint32) !Sound {
        return Sound.initFromDataSource(self, data_source, flags);
    }

    pub fn initSoundFromMaDataSource(self: *@This(), data_source: *ma_data_source, flags: ma_uint32) !Sound {
        return Sound.initFromMaDataSource(self, data_source, flags);
    }
};

pub const SoundGroup = struct {
    allocator: *std.mem.Allocator = undefined,
    group: *ma_sound_group,

    pub fn init(engine: *AudioEngine) !SoundGroup {
        var group = try engine.allocator.create(ma_sound_group);

        const res = ma_sound_group_init(engine.engine, null, group);
        if (res == MA_SUCCESS)
            return SoundGroup{ .allocator = engine.allocator, .group = group };

        engine.allocator.destroy(group);
        return errorForResult(res);
    }

    pub fn initWithParent(engine: *AudioEngine, parent: SoundGroup) !SoundGroup {
        var group = try engine.allocator.create(ma_sound_group);

        const res = ma_sound_group_init(engine.engine, parent.group, group);
        if (res == MA_SUCCESS)
            return SoundGroup{ .allocator = engine.allocator, .group = group };

        engine.allocator.destroy(group);
        return errorForResult(res);
    }

    pub fn deinit(self: *@This()) void {
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
    data_source: ?*DataSource = null,

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
        var sound = try engine.allocator.create(ma_sound);

        var group = if (options.group) |g| g.group else null;
        const res = ma_sound_init_from_file(engine.engine, path, options.getFlags(), null, group, sound);
        if (res == MA_SUCCESS) {
            return Sound{ .allocator = engine.allocator, .sound = sound };
        }

        engine.allocator.destroy(sound);
        return errorForResult(res);
    }

    pub fn initFromDataSource(engine: *AudioEngine, data_source: *DataSource, flags: ma_uint32) !Sound {
        var sound = try engine.allocator.create(ma_sound);

        const res = ma_sound_init_from_data_source(engine.engine, data_source, flags, null, sound);
        if (res == MA_SUCCESS) {
            return Sound{ .allocator = engine.allocator, .sound = sound };
        }

        data_source.destroy();
        engine.allocator.destroy(sound);
        return errorForResult(res);
    }

    pub fn initFromMaDataSource(engine: *AudioEngine, data_source: *ma_data_source, flags: ma_uint32) !Sound {
        // TODO: manage data_source lifecycle. it could be heap allocated i think
        var sound = try engine.allocator.create(ma_sound);

        const res = ma_sound_init_from_data_source(engine.engine, data_source, flags, null, sound);
        if (res == MA_SUCCESS) {
            return Sound{ .allocator = engine.allocator, .sound = sound };
        }

        engine.allocator.destroy(sound);
        return errorForResult(res);
    }

    pub fn initWaveform(engine: *AudioEngine, waveform_type: ma_waveform_type, amplitude: f64, frequency: f64) !Sound {
        // TODO: dont leak the ma_waveform
        var waveform = engine.allocator.create(ma_waveform) catch unreachable;
        errdefer engine.allocator.destroy(waveform);

        const config = ma_waveform_config_init(engine.engine.format, engine.engine.channels, engine.engine.sampleRate, waveform_type, amplitude, frequency);
        var res = ma_waveform_init(&config, waveform);
        if (res != 0) {
            engine.allocator.destroy(waveform);
            return errorForResult(res);
        }

        return initFromMaDataSource(engine, waveform, 0);
    }

    pub fn deinit(self: @This()) void {
        ma_sound_uninit(self.sound);
        if (self.data_source) |ds| ds.destroy();
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

pub const DynamicDataSource = extern struct {
    data_source: DataSource,

    pub fn create(engine: *AudioEngine, callbacks: ma_data_source_callbacks) !*DynamicDataSource {
        var dds = try engine.allocator.create(DynamicDataSource);
        dds.data_source.ds = std.mem.zeroInit(ma_data_source_callbacks, callbacks);

        std.debug.assert(dds.data_source.ds.onRead != null);
        if (dds.data_source.ds.onSeek == null) dds.data_source.ds.onSeek = DataSource.onSeek;
        if (dds.data_source.ds.onGetDataFormat == null) dds.data_source.ds.onGetDataFormat = DataSource.onGetDataFormat;
        if (dds.data_source.ds.onGetCursor == null) dds.data_source.ds.onGetCursor = DataSource.onGetCursor;

        dds.data_source.engine = engine;
        dds.data_source.time = 0;
        dds.data_source.advance = 1.0 / @intToFloat(f32, engine.engine.sampleRate);
        return dds;
    }

    pub fn destroy(self: *@This()) void {
        self.engine.allocator.destroy(self);
    }

    pub fn createSound(self: *@This()) !Sound {
        return Sound.initFromMaDataSource(self.data_source.engine, self, 0) catch unreachable;
    }
};

pub const DataSource = extern struct {
    ds: ma_data_source_callbacks,
    engine: *AudioEngine,
    time: f32 = 0,
    advance: f32,

    pub fn create(engine: *AudioEngine) !*DataSource {
        var data_source = try engine.allocator.create(DataSource);
        data_source.ds = std.mem.zeroInit(ma_data_source_callbacks, .{
            .onRead = onRead,
            .onSeek = onSeek,
            .onMap = null,
            .onUnmap = null,
            .onGetDataFormat = onGetDataFormat,
            .onGetCursor = onGetCursor,
            .onGetLength = null, // no length for generated audio
        });
        data_source.engine = engine;
        data_source.time = 0;
        data_source.advance = 1.0 / @intToFloat(f32, engine.engine.sampleRate);
        return data_source;
    }

    pub fn destroy(self: *@This()) void {
        self.engine.allocator.destroy(self);
    }

    fn onRead(data_source: ?*ma_data_source, frames_out: ?*c_void, frame_count: ma_uint64, frames_read: [*c]ma_uint64) callconv(.C) ma_result {
        var base = @ptrCast(*DataSource, @alignCast(@alignOf(DataSource), data_source));
        var out = @ptrCast([*]f32, @alignCast(@alignOf(f32), frames_out))[0..frame_count];

        const frequency = 220.0;
        const amplitude = 0.5;

        if (frames_out != null) {
            var i: usize = 0;
            while (i < frame_count) : (i += 1) {
                out[i] = std.math.sin(std.math.tau * base.time * frequency) * amplitude;
                base.time += base.advance;
            }
        } else {
            base.time += base.advance * @intToFloat(f32, frame_count);
        }

        frames_read.* = frame_count;

        return MA_SUCCESS;
    }

    fn onSeek(data_source: ?*ma_data_source, frame_index: ma_uint64) callconv(.C) ma_result {
        std.debug.print("onSeek: {d}\n", .{frame_index});
        var base = @ptrCast(*DataSource, @alignCast(@alignOf(DataSource), data_source));
        return MA_SUCCESS;
    }

    fn onMap(data_source: ?*ma_data_source, frames_out: [*c]?*c_void, frame_count: [*c]ma_uint64) callconv(.C) ma_result {
        std.debug.print("onMap\n", .{});
        var base = @ptrCast(*DataSource, @alignCast(@alignOf(DataSource), data_source));
        return MA_SUCCESS;
    }

    fn onUnmap(data_source: ?*ma_data_source, frame_count: ma_uint64) callconv(.C) ma_result {
        std.debug.print("onUnmap\n", .{});
        var base = @ptrCast(*DataSource, @alignCast(@alignOf(DataSource), data_source));
        return MA_SUCCESS;
    }

    fn onGetDataFormat(data_source: ?*ma_data_source, format: [*c]ma_format, channels: [*c]ma_uint32, sample_rate: [*c]ma_uint32) callconv(.C) ma_result {
        var base = @ptrCast(*DataSource, @alignCast(@alignOf(DataSource), data_source));

        format.* = base.engine.engine.format;
        channels.* = 1; //base.engine.engine.channels;
        sample_rate.* = base.engine.engine.sampleRate;
        return MA_SUCCESS;
    }

    fn onGetCursor(data_source: ?*ma_data_source, cursor: [*c]ma_uint64) callconv(.C) ma_result {
        var base = @ptrCast(*DataSource, @alignCast(@alignOf(DataSource), data_source));
        cursor.* = @floatToInt(ma_uint64, base.time / base.advance);
        return MA_SUCCESS;
    }

    fn onGetLength(data_source: ?*ma_data_source, length: [*c]ma_uint64) callconv(.C) ma_result {
        std.debug.print("onGetLength\n", .{});
        var base = @ptrCast(*DataSource, @alignCast(@alignOf(DataSource), data_source));
        return MA_SUCCESS;
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
