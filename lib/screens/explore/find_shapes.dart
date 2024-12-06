import 'package:flutter/material.dart';
import 'package:tinytots/components/start_card.dart';
import 'package:tinytots/components/top_bar.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/helper/audio_service.dart';
import 'package:tinytots/screens/explore.dart';
import 'package:tinytots/screens/explore/camera_view.dart';
import 'package:tinytots/screens/learning/all_aboard/all_aboard.dart';

class FindShapes extends StatefulWidget {
  const FindShapes({super.key});

  @override
  State<FindShapes> createState() => _FindShapesState();
}

class _FindShapesState extends State<FindShapes> {
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
    // _audioService.playFromAssets("sounds/alphabet/learn_alphabet.m4a");
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
              TopBar(oldScreen: const FindShapes()),
              Expanded(
                child: StartCard(
                  imagePath: Assets.images.explore.letsPlay.path,
                  route: const CameraView(),
                  oldRoute: const ExploreListScreen(),
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
