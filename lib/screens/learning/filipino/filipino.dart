import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tinytots/components/modules.dart';
import 'package:tinytots/components/utils/nice_button.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/globals.dart';
import 'package:tinytots/screens/learning/filipino/abakada.dart';
import 'package:tinytots/screens/learning/filipino/filipino_start_quiz.dart';
import 'package:tinytots/screens/learning/filipino/filipino_start_lesson.dart';
import 'package:tinytots/screens/learning/filipino/hugis.dart';
import 'package:tinytots/screens/learning/filipino/kulay.dart';
import 'package:tinytots/screens/learning/filipino/pamilya.dart';

class FilipinoScreen extends StatefulWidget {
  const FilipinoScreen({super.key});

  @override
  State<FilipinoScreen> createState() => _FilipinoScreenState();
}

class _FilipinoScreenState extends State<FilipinoScreen> {
  int _currentIndex = 0;

  final int _abakadaScore = prefs.getInt('abakada_high_score') ?? 0;
  final int _pamilyaScore = prefs.getInt('pamilya_high_score') ?? 0;
  final int _kulayScore = prefs.getInt('kulay_high_score') ?? 0;
  final int _hugisScore = prefs.getInt('hugis_high_score') ?? 0;

  final bool _isAbakadaFinished =
      prefs.getBool('abakada_quiz_unlocked') ?? false;
  final bool _isPamilyaFinished =
      prefs.getBool('pamilya_quiz_unlocked') ?? false;
  final bool _isKulayFinished = prefs.getBool('kulay_quiz_unlocked') ?? false;
  final bool _isHugisFinished = prefs.getBool('hugis_quiz_unlocked') ?? false;

  @override
  Widget build(BuildContext context) {
    final List<Module> filipino = [
      Module(
          type: "lesson",
          imagePath: Assets.images.filipino.abakadaPic.path,
          score: _abakadaScore,
          route: FilipinoStartLessonScreen(
            imagePath: Assets.images.filipino.learnAbakada.path,
            route: const AbakadaScreen(
                quizScreen: FilipinoStartQuizScreen(
              route: Scaffold(
                body: Center(
                  child: Text("Quiz1"),
                ),
              ),
              title: "title1",
              instruction: "instruction1",
            )),
          )),
      Module(
          type: "quiz",
          imagePath: Assets.images.quizPic.path,
          isQuiz: true,
          isFinished: _isAbakadaFinished,
          score: _abakadaScore,
          route: const FilipinoStartQuizScreen(
            route: Scaffold(
              body: Center(
                child: Text("Quiz1"),
              ),
            ),
            title: "title1",
            instruction: "instruction1",
          )),
      Module(
          type: "lesson",
          imagePath: Assets.images.filipino.pamilyaPic.path,
          score: _pamilyaScore,
          route: FilipinoStartLessonScreen(
            imagePath: Assets.images.filipino.learnPamilya.path,
            route: const PamilyaScreen(
              quizScreen: FilipinoStartQuizScreen(
                route: Scaffold(
                  body: Center(
                    child: Text("Quiz2"),
                  ),
                ),
                title: "title2",
                instruction: "instruction2",
              ),
            ),
          )),
      Module(
          type: "quiz",
          imagePath: Assets.images.quizPic.path,
          isQuiz: true,
          isFinished: _isPamilyaFinished,
          score: _pamilyaScore,
          route: const FilipinoStartQuizScreen(
            route: Scaffold(
              body: Center(
                child: Text("Quiz2"),
              ),
            ),
            title: "title2",
            instruction: "instruction2",
          )),
      Module(
          type: "lesson",
          imagePath: Assets.images.filipino.kulayPic.path,
          score: _kulayScore,
          route: FilipinoStartLessonScreen(
            imagePath: Assets.images.filipino.learnKulay.path,
            route: const KulayScreen(
              quizScreen: FilipinoStartQuizScreen(
                route: Scaffold(
                  body: Center(
                    child: Text("Quiz3"),
                  ),
                ),
                title: "title3",
                instruction: "instruction3",
              ),
            ),
          )),
      Module(
        type: "quiz",
        imagePath: Assets.images.quizPic.path,
        isQuiz: true,
        isFinished: _isKulayFinished,
        score: _kulayScore,
        route: const FilipinoStartQuizScreen(
          route: Scaffold(
            body: Center(
              child: Text("Quiz3"),
            ),
          ),
          title: "title3",
          instruction: "instruction3",
        ),
      ),
      Module(
          type: "lesson",
          imagePath: Assets.images.filipino.hugisPic.path,
          score: _hugisScore,
          route: FilipinoStartLessonScreen(
            imagePath: Assets.images.filipino.learnHugis.path,
            route: const HugisScreen(
              quizScreen: FilipinoStartQuizScreen(
                route: Scaffold(
                  body: Center(
                    child: Text("Quiz4"),
                  ),
                ),
                title: "title4",
                instruction: "instruction4",
              ),
            ),
          )),
      Module(
        type: "quiz",
        imagePath: Assets.images.quizPic.path,
        isQuiz: true,
        isFinished: _isHugisFinished,
        score: _hugisScore,
        route: const FilipinoStartQuizScreen(
          route: Scaffold(
            body: Center(
              child: Text("Quiz4"),
            ),
          ),
          title: "title4",
          instruction: "instruction4",
        ),
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
                          itemCount: filipino.length,
                          itemBuilder: (context, index, realIndex) {
                            return ModuleCard(module: filipino[index]);
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(filipino.length, (index) {
                              return Container(
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
                        child: Assets.images.dog
                            .image(height: constraints.maxHeight * .2),
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
