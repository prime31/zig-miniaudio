usingnamespace @import("c.zig").ma;
const std = @import("std");

// this file is just exploring different ways to do things. What really needs to be fleshed out and implemented is:
// - a way to setup DataSource so that it can have a "subclass" that it defers ma_data_source_callbacks to
// - same exact thing for effects
// - same exact thing for async load notifications
//
// the challenge is really just object lifecycle. Sub-objects need to be allocated somewhere and have their lifecycle managed
// (ex DataSource stored in the DataSource implementer like the Allocator interface). When DataSource is destroyed it needs
// to destroy the implementer.

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

// example of how an effect can be created
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
    fn onProcessPCMFrames(effect: ?*ma_effect, input_stream_count: ma_uint32, frames_in: [*c]?*const c_void, frame_count_in: [*c]ma_uint64, frames_out: ?*c_void, frame_count_out: [*c]ma_uint64) callconv(.C) ma_result {
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

// example of using DynamicDataSource that really only works when no internal data is required, not so useful...
// var dds = try DynamicDataSource.create(&e, std.mem.zeroInit(ma.ma_data_source_callbacks, .{
//     .onRead = DataSource.onRead
// }));
// var sound = try dds.createSound();
// sound.start();
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
        return Sound.createFromDataSource(self.data_source.engine, self, 0) catch unreachable;
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
