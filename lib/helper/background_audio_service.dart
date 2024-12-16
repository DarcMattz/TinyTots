import 'package:audioplayers/audioplayers.dart';

class BackgroundAudioService {
  static final BackgroundAudioService _instance =
      BackgroundAudioService._privateConstructor();
  BackgroundAudioService._privateConstructor();
  factory BackgroundAudioService() => _instance;

  final AudioPlayer _backgroundAudioPlayer = AudioPlayer();

  /// Check if bg audio is playing
  bool get isPlaying => _backgroundAudioPlayer.state == PlayerState.playing;

  /// Play
  Future<void> playBackroundMusic() async {
    _backgroundAudioPlayer.setVolume(0.5);
    _backgroundAudioPlayer.setReleaseMode(ReleaseMode.loop);
    await _backgroundAudioPlayer.play(AssetSource("sounds/bg_song.mp3"));
  }

  /// Pause
  Future<void> pause() async {
    await _backgroundAudioPlayer.pause();
  }

  /// Stop
  Future<void> stop() async {
    await _backgroundAudioPlayer.stop();
  }

  /// Resume
  Future<void> resume() async {
    await _backgroundAudioPlayer.resume();
  }

  void dispose() {
    _backgroundAudioPlayer.dispose();
  }
}
