const std = @import("std");
const ma = @import("miniaudio");
const c = @cImport(@cInclude("miniaudio.h"));

pub fn main() !void {
    var device = std.mem.zeroes(ma.ma_device);
    var decoder = std.mem.zeroes(ma.ma_decoder);
    var res: ma.ma_result = 0;

    // res = ma.ma_decoder_init_file("examples/assets/clearday.mp3", null, &decoder);
    // res = ma.ma_decoder_init_file_wav("examples/assets/clang-beat.wav", null, &decoder);
    // res = ma.ma_decoder_init_file_wav("examples/assets/clang.wav", null, &decoder);
    res = ma.ma_decoder_init_file_wav("examples/assets/loop.wav", null, &decoder);
    defer _ = ma.ma_decoder_uninit(&decoder);
    if (res != 0) {
        std.debug.print("error: {}\n", .{res});
        return error.DecoderInitFailed;
    }

    var device_config = ma.ma_device_config_init(.ma_device_type_playback);
    device_config.playback.format = decoder.outputFormat;
    device_config.playback.channels = decoder.outputChannels;
    device_config.sampleRate = decoder.outputSampleRate;
    device_config.dataCallback = dataCallback;
    device_config.pUserData = &decoder;

    res = ma.ma_device_init(null, &device_config, &device);
    defer ma.ma_device_uninit(&device);
    if (res != 0) {
        std.debug.print("error: {}\n", .{res});
        return error.InitFailed;
    }

    res = ma.ma_device_start(&device);
    if (res != 0) {
        std.debug.print("error: {}\n", .{res});
        return error.DeviceStartFailed;
    }

    std.time.sleep(std.time.ns_per_s * 3);
    std.debug.print("---- done ----\n", .{});
}

fn dataCallback(device: ?*ma.ma_device, out: ?*c_void, input: ?*const c_void, frame_count: ma.ma_uint32) callconv(.C) void {
    var decoder = @intToPtr(*ma.ma_decoder, @ptrToInt(device.?.pUserData.?));

    // const frames_read = ma.ma_decoder_read_pcm_frames(decoder, out, frame_count);
    // if (frames_read < frame_count) {
    //     std.debug.print("read: {}\n", .{frames_read});
    //     _ = ma.ma_decoder_seek_to_pcm_frame(decoder, 0);
    // }

    _ = ma.ma_data_source_read_pcm_frames(decoder, out, frame_count, null, 1);
}
