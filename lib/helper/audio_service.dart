import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioService {
  static final AudioService _instance = AudioService._privateConstructor();
  AudioService._privateConstructor();
  factory AudioService() => _instance;

  final AudioPlayer _audioPlayer = AudioPlayer();
  final AudioPlayer _bgAudioPlayer = AudioPlayer();

  /// Play
  Future<void> playFromAssets(String assetPath) async {
    try {
      await _audioPlayer.play(AssetSource(assetPath));
      _audioPlayer.setReleaseMode(ReleaseMode.stop); // Explicit stop mode
    } catch (e) {
      debugPrint('Error playing audio: $e');
    }
  }

  /// Check if bg audio is playing
  bool get isPlaying => _bgAudioPlayer.state == PlayerState.playing;

  Future<void> playBG() async {
    try {
      await _bgAudioPlayer.play(AssetSource('sounds/bg_song.mp3'));
      _bgAudioPlayer.setReleaseMode(ReleaseMode.loop);
    } catch (e) {
      debugPrint('Error playing background audio: $e');
    }
  }

  /// Pause
  Future<void> pauseBG() async {
    try {
      await _bgAudioPlayer.pause();
    } catch (e) {
      debugPrint('Error pausing background audio: $e');
    }
  }

  /// Stop
  Future<void> stop() async {
    try {
      await _audioPlayer.stop();
    } catch (e) {
      debugPrint('Error stopping audio: $e');
    }
  }

  Future<void> stopBG() async {
    try {
      await _bgAudioPlayer.stop();
    } catch (e) {
      debugPrint('Error stopping background audio: $e');
    }
  }

  /// Resume
  Future<void> resumeBG() async {
    try {
      await _bgAudioPlayer.resume();
    } catch (e) {
      debugPrint('Error resuming background audio: $e');
    }
  }

  /// Callback when audio finishes
  void setOnComplete(VoidCallback onComplete) {
    _audioPlayer.onPlayerComplete.listen((event) {
      onComplete();
    });
  }

  void dispose() {
    _audioPlayer.dispose();
    _bgAudioPlayer.dispose();
  }
}
