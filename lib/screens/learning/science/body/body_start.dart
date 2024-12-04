import 'package:flutter/material.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/helper/audio_service.dart';
import 'package:tinytots/components/start_card.dart';
import 'package:tinytots/components/top_bar.dart';
import 'package:tinytots/screens/learning/science/science.dart';
import 'package:tinytots/screens/learning/science/body/body.dart';

class BodyStartScreen extends StatefulWidget {
  const BodyStartScreen({super.key});

  @override
  State<BodyStartScreen> createState() => _BodyStartScreenState();
}

class _BodyStartScreenState extends State<BodyStartScreen> {
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
    _audioService.playFromAssets("sounds/science/body/teach_human_body.m4a");
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
              TopBar(oldScreen: ScienceHealthScreen()),
              Expanded(
                child: StartCard(
                  imagePath: Assets.images.science.learnBody.path,
                  route: const BodyScreen(),
                  oldRoute: const ScienceHealthScreen(),
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
