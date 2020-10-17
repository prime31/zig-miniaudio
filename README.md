# zig-miniaudio

Zig wrapper for [miniaudio](https://miniaud.io/). The low-level, direct miniaudio API is available by importing the "miniaudio" package. There is also a high-level API that wraps the miniaudio engine in Zig fashion. It consists of the following players:

- **AudioEngine:** wraps up the `ma_engine` and provides convenience methods for setting engine-level properties and for creating `Sound`s and `SoundGroup`s.
- **SoundGroup:** optional construct that allows you to group multiple `Sound`s and control them
- **Sound:** can be loaded with an audio file, waveform or any raw data source that you provide. Has playback, pan, gain, volume properties.
- **SfxrDataSource:** a special helper for games. Exposes dynamic SFXR effects including all the usual presets: coin, laser, explosion, power_up, hurt, jump and blip.

### Usage

For details using the low-level, direct miniaudio API check the miniaudio documentation. To get started with the `AudioEngine`, see the example below:

```zig
pub fn main() !void {
    var engine = try AudioEngine.create(std.testing.allocator);
    defer engine.deinit();
    
    // basic fire-and-forget playback
    try engine.playOneShot("clang.wav");
    
    // stream a sound from disk, fading it in
    var music = try engine.createSoundWithOptions("clang-beat.wav", .{ .stream = true });
    defer music.destroy();
    
    music.setFadePointInMilliseconds(0, 0, 0.3, 0, 1000);
    music.start();
    
    // loop a sound quietly
    var snd = try engine.createSound("loop.wav");
    defer snd.destroy();
    
    snd.setLooping(true);
    snd.setVolume(0.3)
    snd.start();
}
```
