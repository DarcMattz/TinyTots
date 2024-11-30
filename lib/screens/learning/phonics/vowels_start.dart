import 'package:flutter/material.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_application_1/helper/audio_service.dart';
import 'package:flutter_application_1/components/start_card.dart';
import 'package:flutter_application_1/components/top_bar.dart';
import 'package:flutter_application_1/screens/learning/phonics/phonics.dart';
import 'package:flutter_application_1/screens/learning/phonics/vowels.dart';

class VowelsStartScreen extends StatefulWidget {
  const VowelsStartScreen({super.key});

  @override
  State<VowelsStartScreen> createState() => _VowelsStartScreenState();
}

class _VowelsStartScreenState extends State<VowelsStartScreen> {
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
    _audioService.playFromAssets("sounds/vowels/learn_vowels.m4a");
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
              TopBar(oldScreen: PhonicsScreen()),
              Expanded(
                child: StartCard(
                  imagePath: Assets.images.phonics.learnVowels.path,
                  route: const VowelsScreen(),
                  oldRoute: const PhonicsScreen(),
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
