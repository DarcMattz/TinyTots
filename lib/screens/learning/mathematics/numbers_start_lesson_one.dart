import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/learning/mathematics/numbers.dart';
import '../../../audioplayer/audio_service.dart';
import '../../../components/start_card.dart';
import '../../../components/top_bar.dart';

class NumbersStartLessonOneScreen extends StatefulWidget {
  const NumbersStartLessonOneScreen({super.key});

  @override
  State<NumbersStartLessonOneScreen> createState() => _NumbersStartLessonOneScreenState();
}

class _NumbersStartLessonOneScreenState extends State<NumbersStartLessonOneScreen> {
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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBar(),
              const Expanded(
                child: StartCard(
                  imagePath: "assets/images/mathematics/math_start_mascot.png",
                  route: NumbersScreen(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 60.0),
                    child: Image.asset(
                      'assets/images/rabbit.png',
                      height: 170,
                    ),
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
