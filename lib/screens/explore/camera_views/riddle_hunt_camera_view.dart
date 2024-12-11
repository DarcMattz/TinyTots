import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tinytots/components/push_replacement.dart';
import 'package:tinytots/components/utils/circle_button.dart';
import 'package:tinytots/helper/audio_service.dart';
import 'package:tinytots/screens/explore.dart';
import 'package:tinytots/screens/explore/camera_views/scan_controller.dart';
import 'package:get/get.dart';

class RiddleHuntCameraView extends StatefulWidget {
  const RiddleHuntCameraView({super.key});

  @override
  CameraViewState createState() => CameraViewState();
}

class CameraViewState extends State<RiddleHuntCameraView> {
  late final ScanController controller;
  final AudioService _audioService = AudioService();
  @override
  void initState() {
    super.initState();
    controller = Get.put(ScanController());
    controller.initializeCamera();
    controller.context = context;

    controller.isInfinite = false;
    controller.isTimeChase = false;
    controller.isRiddleHunt = true;

    // Shuffle questions and set the first question
    controller.questionsAnswers.shuffle();
    controller.question =
        controller.questionsAnswers[controller.questionIndex].question;
    controller.answer =
        controller.questionsAnswers[controller.questionIndex].answer;
    controller.questionSoundPath =
        controller.questionsAnswers[controller.questionIndex].questionSoundPath;
    controller.answerSoundPath =
        controller.questionsAnswers[controller.questionIndex].answerSoundPath;
    controller.questionIndex = 0;
    controller.maxIndex = 5;
  }

  @override
  void dispose() {
    controller.disposeCamera();
    controller.stopRoundTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF208DD5),
      body: GetBuilder<ScanController>(
        builder: (controller) {
          return controller.isCameraInitialized.value
              ? _buildCameraView()
              : _buildLoadingView();
        },
      ),
    );
  }

  Widget _buildCameraView() {
    return SafeArea(
      child: Column(
        children: [
          _buildTopBar(),
          _buildCameraPreview(),
          _buildVolumeSkipButton(),
          _buildQuestionText(),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PushReplacement(
            route: PageTransition(
              type: PageTransitionType.scale,
              alignment: Alignment.center,
              child: const ExploreListScreen(),
            ),
            child: CircleButton(
              color: const Color(0xFFFF8413),
              shadowColor: const Color(0xFFFF8413),
              icon: Icons.arrow_back,
              method: () => _navigateToExploreScreen(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
                '${controller.remainingRoundTime.value ~/ 60}:${(controller.remainingRoundTime.value % 60).toString().padLeft(2, '0')}',
                style: const TextStyle(color: Colors.white, fontSize: 24)),
          ),
        ],
      ),
    );
  }

  Widget _buildCameraPreview() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: const Color(0xFFFF8413), width: 4),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            child: CameraPreview(controller.cameraController),
          ),
        ),
      ),
    );
  }

  Widget _buildVolumeSkipButton() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleButton(
            color: Colors.purpleAccent,
            shadowColor: Colors.purple,
            icon: Icons.volume_up_rounded,
            method: () {
              String path = controller.questionSoundPath;
              log(path);
              _audioService.playFromAssets(path);
            },
          ),
          CircleButton(
            color: Colors.purpleAccent,
            shadowColor: Colors.purple,
            icon: Icons.arrow_forward,
            method: () {
              controller.skipQuestion();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Text(
        '${controller.question}',
        style: const TextStyle(color: Colors.white, fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildLoadingView() {
    return Center(
      child: LoadingAnimationWidget.beat(
        color: const Color(0xFFFFC107),
        size: 80,
      ),
    );
  }

  void _navigateToExploreScreen() {
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          child: const ExploreListScreen(),
        ),
      );
    }
  }
}
