const std = @import("std");
const ma = @import("miniaudio");
const c = @cImport(@cInclude("miniaudio.h"));


pub fn main() !void {
    var sin_waveform = std.mem.zeroes(ma.ma_waveform);
    var device = std.mem.zeroes(ma.ma_device);

    const sin_config = ma.ma_waveform_config_init(.ma_format_f32, 2, 48000, .ma_waveform_type_sine, 0.2, 220);
    var res = ma.ma_waveform_init(&sin_config, &sin_waveform);
    if (res != 0) {
        std.debug.print("error: {}\n", .{res});
        return error.WaveformInitFailed;
    }

    var device_config = ma.ma_device_config_init(.ma_device_type_playback);
    device_config.playback.format = .ma_format_f32;
    device_config.playback.channels = 2;
    device_config.sampleRate = 48000;
    device_config.dataCallback = dataCallback;
    device_config.pUserData = &sin_waveform;

    res = ma.ma_device_init(null, &device_config, &device);
    if (res != 0) {
        std.debug.print("error: {}\n", .{res});
        return error.InitFailed;
    }

    res = ma.ma_device_start(&device);
    if (res != 0) {
        std.debug.print("error: {}\n", .{res});
        ma.ma_device_uninit(&device);
        return error.DeviceStartFailed;
    }

    std.time.sleep(std.time.ns_per_s * 1);

    ma.ma_device_uninit(&device);
}

fn dataCallback(device: ?*ma.ma_device, out: ?*c_void, input: ?*const c_void, frame_count: ma.ma_uint32) callconv(.C) void {
    var sinewave = @intToPtr(*ma.ma_waveform, @ptrToInt(device.?.pUserData.?));
    _ = ma.ma_waveform_read_pcm_frames(sinewave, out, frame_count);
}
