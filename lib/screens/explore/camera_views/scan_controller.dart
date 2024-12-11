import 'dart:async';
import 'dart:developer';
import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tinytots/components/push_replacement.dart';
import 'package:tinytots/components/utils/circle_button.dart';
import 'package:tinytots/dialogs/explore_finish_dialog.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/globals.dart';
import 'package:tinytots/helper/audio_service.dart';
import 'package:tinytots/models/obj_qa.dart';
import 'package:tinytots/screens/explore.dart';

class ScanController extends GetxController {
  // Camera-related variables
  late CameraController cameraController;
  late List<CameraDescription> cameras;
  final AudioService _audioService = AudioService();
  late BuildContext context;

  // Game Type
  bool isInfinite = true;
  bool isTimeChase = false;
  bool isRiddleHunt = false;

  // Question and answer data
  final List questionsAnswers = questionAnswers;
  String question = "";
  String answer = "";
  String answerSoundPath = "";
  String questionSoundPath = "";

  // Object detection variables
  var isCameraInitialized = false.obs;
  var cameraCount = 0;
  String label = "";
  String objectDetected = "";

  // Scoring and progress tracking
  int maxIndex = 0;
  int questionIndex = 0;
  int score = 0;

  // Timer variables
  Timer? gameTimer;
  // final int maxRoundTime = 300; // Maximum round time in seconds (5 minutes)
  final int maxRoundTime =
      150; // Maximum round time in seconds (2 minutes, 30 seconds)
  // var remainingRoundTime = 300.obs;
  var remainingRoundTime = 150.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeGame();
  }

  // ---------------- Timer Methods ----------------

  void startRoundTimer() {
    stopRoundTimer(); // Stop any existing timer
    remainingRoundTime.value = maxRoundTime;
    gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingRoundTime.value > 0) {
        remainingRoundTime.value--;
        update();
      } else {
        _audioService.playFromAssets('sounds/timesup.mp3');
        stopRoundTimer();
        pauseCamera();
        endGame(); // End the game when time runs out
      }
    });
  }

  void stopRoundTimer() {
    gameTimer?.cancel();
    gameTimer = null;
  }

  void endGame() {
    log("Game Over! Score: $score");
    showGameOverPopup();
  }

  void showGameOverPopup() {
    int maxscore = (maxIndex * 10) + maxRoundTime;
    int itemPoints = score * 10;
    int timeBonus = remainingRoundTime.value;
    log("Item Points: $itemPoints | Time Bonus: $timeBonus | remainingRoundTime: $remainingRoundTime");
    int finalScore = itemPoints + timeBonus;

    log("Final Score: $finalScore");

    int highScore = 0;
    isTimeChase
        ? highScore = prefs.getInt('time_chase_high_score') ?? 0
        : highScore = prefs.getInt('riddle_hunt_high_score') ?? 0;

    if (finalScore > highScore) {
      if (isTimeChase) {
        prefs.setInt('time_chase_high_score', finalScore);
      }
      if (isRiddleHunt) {
        prefs.setInt('riddle_hunt_high_score', finalScore);
      }
    }

    Widget star;
    String path;

    if (finalScore >= 160) {
      // 3 Stars: 80%-100%
      star = Assets.images.star3.image();
      path = 'sounds/quiz/perfect.m4a';
    } else if (finalScore >= 100) {
      // 2 Stars: 50%-79%
      star = Assets.images.star2.image();
      path = 'sounds/quiz/great.m4a';
    } else if (finalScore >= 67) {
      // 1 Star: 33%-49%
      star = Assets.images.star1.image();
      path = 'sounds/quiz/low_2.m4a';
    } else {
      // 0 Stars: <33%
      star = Assets.images.star0.image();
      path = 'sounds/quiz/low_1.m4a';
    }

    AudioPlayer audioPlayer = AudioPlayer();
    audioPlayer.play(AssetSource(path));

    if (context.mounted) {
      showDialog(
        barrierDismissible: false,
        context: Navigator.of(context, rootNavigator: true).context,
        builder: (context) => ExploreFinishDialog(
          replay: () => _restartGame(),
          score: finalScore,
          star: star,
          highscore: highScore,
          remainingTime: remainingRoundTime.value,
        ),
      );
    }
  }

  void _restartGame() {
    questionsAnswers.shuffle();
    questionIndex = 0;
    score = 0;
    question = questionsAnswers[questionIndex].question;
    answer = questionsAnswers[questionIndex].answer;
    questionSoundPath = questionsAnswers[questionIndex].questionSoundPath;
    answerSoundPath = questionsAnswers[questionIndex].answerSoundPath;
    startRoundTimer();
    resumeCamera();
    update();
  }

  // ---------------- Initialization Methods ----------------

  Future<void> _initializeGame() async {
    // Shuffle questions and set the first question and answer
    questionsAnswers.shuffle();
    maxIndex = questionsAnswers.length;
    question = questionsAnswers[questionIndex].question;
    answer = questionsAnswers[questionIndex].answer;
    questionSoundPath = questionsAnswers[questionIndex].questionSoundPath;
    answerSoundPath = questionsAnswers[questionIndex].answerSoundPath;

    log("Questions loaded: $questionsAnswers");
    await _initializeTflite();
    if (!isInfinite) {
      startRoundTimer();
    } // Only start round timer if not infinite
  }

  Future<void> _initializeTflite() async {
    try {
      await Tflite.loadModel(
        model: "assets/models/model_unquant.tflite",
        labels: "assets/models/labels.txt",
        isAsset: true,
        numThreads: 1,
        useGpuDelegate: false,
      );
    } catch (e) {
      log("Error loading TFLite model: $e");
    }
  }

  Future<void> initializeCamera() async {
    if (await Permission.camera.request().isGranted) {
      try {
        cameras = await availableCameras();
        cameraController = CameraController(cameras[0], ResolutionPreset.max);
        await cameraController.initialize();
        isCameraInitialized(true);
        startImageStream();

        if (!isInfinite) {
          startRoundTimer();
        } // Only start round timer if not infinite

        update();
      } catch (e) {
        log("Error initializing camera: $e");
      }
    } else {
      log("Camera permission denied");
    }
  }

  // ---------------- Camera Control Methods ----------------

  void startImageStream() {
    cameraController.startImageStream((image) {
      cameraCount++;
      if (cameraCount % 10 == 0) {
        cameraCount = 0;
        _detectObject(image);
      }
    });
  }

  void stopImageStream() {
    if (cameraController.value.isStreamingImages) {
      cameraController.stopImageStream();
    }
  }

  void pauseCamera() {
    stopImageStream();
    log("Camera paused.");
  }

  Future<void> resumeCamera() async {
    if (!cameraController.value.isInitialized) {
      await initializeCamera();
    } else {
      startImageStream();
    }
    log("Camera resumed.");
  }

  // ---------------- Object Detection ----------------

  Future<void> _detectObject(CameraImage image) async {
    log('time left: $remainingRoundTime');
    try {
      final results = await Tflite.runModelOnFrame(
        bytesList: image.planes.map((e) => e.bytes).toList(),
        imageHeight: image.height,
        imageWidth: image.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        numResults: 2,
        threshold: 0.5,
      );

      if (results != null && results.isNotEmpty) {
        _handleDetectionResults(results);
      } else {
        objectDetected = "";
        update();
      }
    } catch (e) {
      log("Error during object detection: $e");
    }
  }

  void _handleDetectionResults(List<dynamic> results) {
    log(answer);
    log("Results: $results");
    log("Question Index: $questionIndex/$maxIndex");

    final detectedObject = results.first;
    final confidence = detectedObject['confidence'] ?? 0;

    if (confidence > 0.95) {
      label = (detectedObject['label'] as String)
          .replaceAll(RegExp(r'\d'), '')
          .toLowerCase()
          .trim();

      if (label.contains(answer)) {
        _handleCorrectAnswer();
        log('same');
      }
    }
  }

  // ---------------- Gameplay Logic ----------------

  void _handleCorrectAnswer() {
    score++;

    if (questionIndex + 1 < maxIndex) {
      _showCorrectAnswerPopup();
      _audioService.playFromAssets('sounds/correct.wav');
      questionIndex++;
      question = questionsAnswers[questionIndex].question;
      answer = questionsAnswers[questionIndex].answer;
      questionSoundPath = questionsAnswers[questionIndex].questionSoundPath;
      answerSoundPath = questionsAnswers[questionIndex].answerSoundPath;
    } else if (isInfinite) {
      _showCorrectAnswerPopup();
      _audioService.playFromAssets('sounds/correct.wav');
      questionsAnswers.shuffle();
      questionIndex = 0;
      question = questionsAnswers[questionIndex].question;
      answer = questionsAnswers[questionIndex].answer;
      questionSoundPath = questionsAnswers[questionIndex].questionSoundPath;
      answerSoundPath = questionsAnswers[questionIndex].answerSoundPath;
      log('index reset');
    } else {
      _audioService.playFromAssets('sounds/finish.mp3');
      stopRoundTimer();
      pauseCamera();
      endGame();
    }

    update();
  }

  void skipQuestion() {
    remainingRoundTime.value -= 30;
    log('deducted 30 seconds');
    if (questionIndex + 1 < maxIndex) {
      questionIndex++;
      question = questionsAnswers[questionIndex].question;
      answer = questionsAnswers[questionIndex].answer;
      questionSoundPath = questionsAnswers[questionIndex].questionSoundPath;
      answerSoundPath = questionsAnswers[questionIndex].answerSoundPath;
      _audioService.playFromAssets('sounds/wrong.mp3');
    } else {
      if (isInfinite) {
        questionIndex = 0;
      } else {
        _audioService.playFromAssets('sounds/finish.mp3');
        if (remainingRoundTime.value < 0) {
          remainingRoundTime.value = 0;
        }
        stopRoundTimer();
        pauseCamera();
        endGame();
      }
    }
    update();
  }

  void _showCorrectAnswerPopup() {
    if (context.mounted) {
      // Ensure the context is valid
      showDialog(
        context: Navigator.of(context, rootNavigator: true)
            .context, // Use root navigator context
        builder: (context) => Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/correct.png',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Correct!",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      // Automatically dismiss the dialog after a delay
      Future.delayed(const Duration(milliseconds: 600), () {
        if (context.mounted) {
          Navigator.of(context, rootNavigator: true).pop();
          log('correct answer popup dismissed');
        }
      });
    }
  }

  // ---------------- Cleanup Methods ----------------

  void disposeCamera() {
    stopImageStream();
    if (cameraController.value.isInitialized) {
      cameraController.dispose();
    }
    isCameraInitialized(false);
    update();
  }

  @override
  void dispose() {
    disposeCamera();
    stopRoundTimer();
    Tflite.close();
    super.dispose();
  }
}
