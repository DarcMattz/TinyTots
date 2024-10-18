import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/audioplayer/audio_service.dart';
import 'package:flutter_application_1/components/finish_module_dialog.dart';
import 'package:flutter_application_1/components/utils/nice_button.dart';
import 'package:flutter_application_1/components/science/sense_card.dart';
import 'package:flutter_application_1/models/science/sense.dart';
import 'package:flutter_application_1/screens/learning/science/senses_quiz.dart';
import 'package:gap/gap.dart';

class SensesScreen extends StatefulWidget {
  const SensesScreen({super.key});

  @override
  State<SensesScreen> createState() => _SensesScreenState();
}

class _SensesScreenState extends State<SensesScreen> {
  final AudioService _audioService = AudioService();
  int _currentIndex = 0;
  final CarouselSliderController _carCon = CarouselSliderController();

  final List<Sense> senses = [
    Sense(
      label: 'Sense of Sight',
      imagePath: 'assets/images/science/senses/sense_1.png',
      soundPath: 'sounds/science/senses/sight.m4a',
    ),
    Sense(
      label: 'Sense of Smell',
      imagePath: 'assets/images/science/senses/sense_2.png',
      soundPath: 'sounds/science/senses/smell.m4a',
    ),
    Sense(
      label: 'Sense of Taste',
      imagePath: 'assets/images/science/senses/sense_3.png',
      soundPath: 'sounds/science/senses/taste.m4a',
    ),
    Sense(
      label: 'Sense of Hearing',
      imagePath: 'assets/images/science/senses/sense_4.png',
      soundPath: 'sounds/science/senses/hearing.mp3',
    ),
    Sense(
      label: 'Sense of Touch',
      imagePath: 'assets/images/science/senses/sense_5.png',
      soundPath: 'sounds/science/senses/touch.m4a',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _audioService.setOnComplete(() {});
  }

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }

  void _play(soundPath) async {
    await _audioService.playFromAssets(soundPath);
  }

  void _stop() async {
    await _audioService.stop();
  }

  void _nextCard() {
    if (_currentIndex == senses.length - 1) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const FinishModuleDialog(
          route: SensesQuizScreen(),
        ),
      );
    } else {
      _carCon.nextPage();
    }
  }

  void _previousCard() {
    _carCon.previousPage();
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: NiceButton(
                  label: "Back",
                  color: Colors.yellow,
                  shadowColor: Colors.yellow[800]!,
                  icon: Icons.close,
                  iconSize: 30,
                  method: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CarouselSlider.builder(
                      carouselController: _carCon,
                      options: CarouselOptions(
                        height: 400,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        initialPage: 0,
                        autoPlay: false,
                        viewportFraction: 0.8,
                        onPageChanged: (index, reason) {
                          _currentIndex = index;
                          _stop();
                        },
                      ),
                      itemCount: senses.length,
                      itemBuilder: (context, index, realIndex) {
                        return SenseCard(
                          sense: senses[index],
                          nextCallback: _nextCard,
                          prevCallback: _previousCard,
                          soundCallback: () {
                            _play(senses[index].soundPath);
                          },
                        );
                      },
                    ),
                    const Gap(30),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(senses.length, (index) {
                          return GestureDetector(
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentIndex == index
                                    ? Colors.blueAccent
                                    : Colors.grey,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 60.0),
                    child: Image.asset(
                      'assets/images/dog.png',
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
