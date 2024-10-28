import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioService {
  final AudioPlayer _audioPlayer = AudioPlayer();

  /// Play
  Future<void> playFromAssets(String assetPath) async {
    await _audioPlayer.play(AssetSource(assetPath));
  }

  /// Pause
  // Future<void> pause() async {
  //   await _audioPlayer.pause();
  // }

  /// Stop
  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  /// Resume
  // Future<void> resume() async {
  //   await _audioPlayer.resume();
  // }

  /// Callback when audio finish
  void setOnComplete(VoidCallback onComplete) {
    _audioPlayer.onPlayerComplete.listen((event) {
      onComplete();
    });
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}
