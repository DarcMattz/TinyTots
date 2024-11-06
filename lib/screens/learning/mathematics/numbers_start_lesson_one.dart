import 'package:flutter/material.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_application_1/screens/learning/mathematics/mathematics.dart';
import 'package:flutter_application_1/screens/learning/mathematics/numbers.dart';
import '../../../helper/audio_service.dart';
import '../../../components/start_card.dart';
import '../../../components/top_bar.dart';

class NumbersStartLessonOneScreen extends StatefulWidget {
  const NumbersStartLessonOneScreen({super.key});

  @override
  State<NumbersStartLessonOneScreen> createState() =>
      _NumbersStartLessonOneScreenState();
}

class _NumbersStartLessonOneScreenState
    extends State<NumbersStartLessonOneScreen> {
  final AudioService _audioService = AudioService();

  @override
  void initState() {
    super.initState();
    _play();
  }

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }

  void _play() {
    _audioService.playFromAssets("sounds/mathematics/numbers_intro.m4a");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.background.provider(),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBar(),
              Expanded(
                child: StartCard(
                  imagePath: Assets.images.mathematics.learnNumbers.path,
                  route: const NumbersScreen(),
                  oldRoute: const MathematicsScreen(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 60.0),
                    child: Assets.images.rabbit.image(height: 170),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
