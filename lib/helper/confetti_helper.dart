import 'package:confetti/confetti.dart';
import 'dart:async';

class ConfettiHelper {
  final ConfettiController leftController;
  final ConfettiController rightController;
  Timer? confettiTimer;
  bool isConfettiRunning = false;

  ConfettiHelper(this.leftController, this.rightController);

  void startConfettiLoop() {
    if (confettiTimer == null || !confettiTimer!.isActive) {
      confettiTimer =
          Timer.periodic(const Duration(milliseconds: 3000), (timer) {
        leftController.play();
        rightController.play();
      });
      isConfettiRunning = true;
    }
  }

  void stopConfettiLoop() {
    confettiTimer?.cancel();
    isConfettiRunning = false;
  }

  void dispose() {
    confettiTimer?.cancel();
    leftController.dispose();
    rightController.dispose();
  }
}
