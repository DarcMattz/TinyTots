import 'package:flutter/material.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/helper/audio_service.dart';
import 'package:tinytots/components/start_card.dart';
import 'package:tinytots/components/top_bar.dart';
import 'package:tinytots/screens/learning/all_aboard/all_aboard.dart';
import 'package:tinytots/screens/learning/all_aboard/abc.dart';

class AbcStartScreen extends StatefulWidget {
  const AbcStartScreen({super.key});

  @override
  State<AbcStartScreen> createState() => _AbcStartScreenState();
}

class _AbcStartScreenState extends State<AbcStartScreen> {
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
    _audioService.playFromAssets("sounds/alphabet/learn_alphabet.m4a");
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
              TopBar(oldScreen: AllAboardScreen()),
              Expanded(
                child: StartCard(
                  imagePath: Assets.images.allAboard.letters.learnAbc.path,
                  route: const AbcScreen(),
                  oldRoute: const AllAboardScreen(),
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
