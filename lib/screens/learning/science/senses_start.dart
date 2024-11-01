import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/audio_service.dart';
import 'package:flutter_application_1/components/start_card.dart';
import 'package:flutter_application_1/components/top_bar.dart';
import 'package:flutter_application_1/screens/learning/science/senses.dart';

class SensesStartScreen extends StatefulWidget {
  const SensesStartScreen({super.key});

  @override
  State<SensesStartScreen> createState() => _SensesStartScreenState();
}

class _SensesStartScreenState extends State<SensesStartScreen> {
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
    _audioService.playFromAssets("sounds/science/senses/learn_senses.m4a");
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
                  imagePath: "assets/images/learn_senses.png",
                  route: SensesScreen(),
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
