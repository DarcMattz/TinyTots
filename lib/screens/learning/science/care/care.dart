import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tinytots/components/push_replacement.dart';
import 'package:tinytots/globals.dart';
import 'package:tinytots/helper/audio_service.dart';
import 'package:tinytots/dialogs/finish_module_dialog.dart';
import 'package:tinytots/components/science/care_card.dart';
import 'package:tinytots/components/utils/nice_button.dart';
import 'package:tinytots/models/science/care.dart';
import 'package:tinytots/screens/learning/science/science.dart';
import 'package:tinytots/screens/learning/science/care/care_quiz.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class CareScreen extends StatefulWidget {
  const CareScreen({super.key});

  @override
  State<CareScreen> createState() => _CareScreenState();
}

class _CareScreenState extends State<CareScreen> {
  final AudioService _audioService = AudioService();
  int colCurIndex = prefs.getInt('care_current_index') ?? 0;
  int _currentIndex = 0;
  final CarouselSliderController _carCon = CarouselSliderController();

  final List<Care> cares = [
    Care(
      description: 'Wake up early in the morning.',
      imagePath: 'assets/images/science/care/care_1.png',
      soundPath: 'sounds/science/care/wake_early.m4a',
    ),
    Care(
      description: 'Then, wash your face.',
      imagePath: 'assets/images/science/care/care_2.png',
      soundPath: 'sounds/science/care/wash_face.m4a',
    ),
    Care(
      description: 'Wash your hand before you eat.',
      imagePath: 'assets/images/science/care/care_3.png',
      soundPath: 'sounds/science/care/wash_hands.m4a',
    ),
    Care(
      description: 'Eat healthy food.',
      imagePath: 'assets/images/science/care/care_4.png',
      soundPath: 'sounds/science/care/eat_food.m4a',
    ),
    Care(
      description: 'Brush your teeth after you eat.',
      imagePath: 'assets/images/science/care/care_5.png',
      soundPath: 'sounds/science/care/brush_teeth.m4a',
    ),
    Care(
      description: 'Always take a bath.',
      imagePath: 'assets/images/science/care/care_6.png',
      soundPath: 'sounds/science/care/take_bath.m4a',
    ),
    Care(
      description: 'Brush your hair.',
      imagePath: 'assets/images/science/care/care_7.png',
      soundPath: 'sounds/science/care/brush_hair.m4a',
    ),
    Care(
      description: 'Clean your ears.',
      imagePath: 'assets/images/science/care/care_8.png',
      soundPath: 'sounds/science/care/clean_ears.m4a',
    ),
    Care(
      description: 'Sleep early.',
      imagePath: 'assets/images/science/care/care_9.png',
      soundPath: 'sounds/science/care/sleep_early.m4a',
    ),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _carCon.jumpToPage(colCurIndex);
    });
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
    if (_currentIndex == cares.length - 1) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const FinishModuleDialog(
          route: CareQuizScreen(),
          oldRoute: ScienceHealthScreen(),
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
                child: PushReplacement(
                  route: PageTransition(
                    type: PageTransitionType.scale,
                    alignment: Alignment.center,
                    child: const ScienceHealthScreen(),
                  ),
                  child: NiceButton(
                    label: "Back",
                    color: Colors.yellow,
                    shadowColor: Colors.yellow[800]!,
                    icon: Icons.close,
                    iconSize: 30,
                    method: () {
                      if (context.mounted) {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            alignment: Alignment.center,
                            child: const ScienceHealthScreen(),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                child: CarouselSlider.builder(
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
                      prefs.setInt('care_current_index', index);

                      if (index == cares.length - 1) {
                        prefs.setBool('care_quiz_unlocked', true);
                        prefs.setInt('care_current_index', 0);
                      }
                      _stop();
                    },
                  ),
                  itemCount: cares.length,
                  itemBuilder: (context, index, realIndex) {
                    return CareCard(
                      care: cares[index],
                      nextCallback: _nextCard,
                      prevCallback: _previousCard,
                      soundCallback: () {
                        _play(cares[index].soundPath);
                      },
                    );
                  },
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
