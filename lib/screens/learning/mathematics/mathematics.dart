import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tinytots/components/modules.dart';
import 'package:tinytots/components/utils/nice_button.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/globals.dart';
import 'package:tinytots/screens/learning/mathematics/numbers_quiz.dart';
import 'package:tinytots/screens/learning/mathematics/numbers_start_lesson_one.dart';
import 'package:tinytots/screens/learning/mathematics/numbers_start_lesson_two.dart';
import 'package:tinytots/screens/learning/mathematics/quiz_start.dart';

class MathematicsScreen extends StatefulWidget {
  const MathematicsScreen({super.key});

  @override
  State<MathematicsScreen> createState() => _MathematicsScreenState();
}

class _MathematicsScreenState extends State<MathematicsScreen> {
  int _currentIndex = 0;
  final int _numbersScore = prefs.getInt('numbers_high_score') ?? 0;
  final int _addSubtractScore = prefs.getInt('add_subtract_high_score') ?? 0;
  final bool _isNumbersFinished =
      prefs.getBool('numbers_quiz_unlocked') ?? false;
  final bool _isAddSubtractFinished =
      prefs.getBool('add_subtract_quiz_unlocked') ?? false;

  @override
  Widget build(BuildContext context) {
    final List<Module> math = [
      Module(
          type: "lesson",
          imagePath: Assets.images.mathematics.numbersPic.path,
          score: _numbersScore,
          route: const NumbersStartLessonOneScreen()),
      Module(
        type: "quiz",
        isQuiz: true,
        imagePath: Assets.images.quizPic.path,
        isFinished: _isNumbersFinished,
        score: _numbersScore,
        route: QuizStart(
          title: 'Recognizing Numbers',
          description: 'Choose the correct number for each set',
          image: Assets.images.mathematics.quizNumber.instruction.path,
          route: const NumbersQuizScreen(),
          soundPath: "",
        ),
      ),
      Module(
          type: "lesson",
          imagePath: Assets.images.mathematics.addsubtrPic.path,
          score: _addSubtractScore,
          route: const NumbersStartLessonTwoScreen()),
      Module(
          type: "quiz",
          imagePath: Assets.images.quizPic.path,
          isQuiz: true,
          isFinished: _isAddSubtractFinished,
          score: _addSubtractScore,
          route: const NumbersQuizScreen()),
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
                          itemCount: math.length,
                          itemBuilder: (context, index, realIndex) {
                            return ModuleCard(module: math[index]);
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(math.length, (index) {
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
