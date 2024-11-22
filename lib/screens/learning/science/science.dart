import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/modules.dart';
import 'package:flutter_application_1/components/utils/nice_button.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_application_1/globals.dart';
import 'package:flutter_application_1/screens/learning/science/body/body_quiz.dart';
import 'package:flutter_application_1/screens/learning/science/body/body_quiz_start.dart';
import 'package:flutter_application_1/screens/learning/science/body/body_start.dart';
import 'package:flutter_application_1/screens/learning/science/care/care_quiz.dart';
import 'package:flutter_application_1/screens/learning/science/care/care_start.dart';
import 'package:flutter_application_1/screens/learning/science/sense/senses_quiz.dart';
import 'package:flutter_application_1/screens/learning/science/sense/senses_quiz_start.dart';
import 'package:flutter_application_1/screens/learning/science/sense/senses_start.dart';

class ScienceHealthScreen extends StatefulWidget {
  const ScienceHealthScreen({super.key});

  @override
  State<ScienceHealthScreen> createState() => _ScienceHealthScreenState();
}

class _ScienceHealthScreenState extends State<ScienceHealthScreen> {
  int _currentIndex = 0;
  bool _isBodyFinished = prefs.getBool('body_quiz_unlocked') ?? false;
  int _bodyScore = prefs.getInt('body_high_score') ?? 0;
  bool _isSensesFinished = prefs.getBool('senses_quiz_unlocked') ?? false;
  int _sensesScore = prefs.getInt('senses_high_score') ?? 0;
  bool _isCareFinished = prefs.getBool('care_quiz_unlocked') ?? false;
  int _careScore = prefs.getInt('care_high_score') ?? 0;

  @override
  Widget build(BuildContext context) {
    final List<Module> science = [
      Module(
        type: "lesson",
        imagePath: Assets.images.science.bodyPic.path,
        route: const BodyStartScreen(),
      ),
      Module(
        type: "quiz",
        imagePath: Assets.images.quizPic.path,
        isQuiz: true,
        isFinished: _isBodyFinished,
        score: _bodyScore,
        route: const BodyQuizStart(),
      ),
      Module(
        type: "lesson",
        imagePath: Assets.images.science.sensesPic.path,
        route: const SensesStartScreen(),
      ),
      Module(
        type: "quiz",
        imagePath: Assets.images.quizPic.path,
        isQuiz: true,
        isFinished: _isSensesFinished,
        score: _sensesScore,
        route: const SensesQuizStart(),
      ),
      Module(
        type: "lesson",
        imagePath: Assets.images.science.carePic.path,
        route: const CareStartScreen(),
      ),
      Module(
        type: "quiz",
        imagePath: Assets.images.quizPic.path,
        isQuiz: true,
        isFinished: _isCareFinished,
        score: _careScore,
        route: const CareQuizScreen(),
      ),
    ];

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              image: DecorationImage(
                image: Assets.images.background.provider(),
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
                      icon: Icons.arrow_back,
                      iconSize: 30,
                      method: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CarouselSlider.builder(
                          options: CarouselOptions(
                            height: constraints.maxHeight * .4,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            initialPage: 0,
                            autoPlay: false,
                            viewportFraction: 0.7,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                          ),
                          itemCount: science.length,
                          itemBuilder: (context, index, realIndex) {
                            return ModuleCard(module: science[index]);
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(science.length, (index) {
                              return GestureDetector(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0, right: 30),
                        child: Assets.images.panda.image(height: 200),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
