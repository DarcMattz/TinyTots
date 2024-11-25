import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/confetti_component.dart';
import 'package:flutter_application_1/components/push_replacement.dart';
import 'package:flutter_application_1/components/utils/nice_button.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_application_1/globals.dart';
import 'package:flutter_application_1/helper/audio_service.dart';
import 'package:flutter_application_1/helper/confetti_helper.dart';
import 'package:flutter_application_1/models/all_aboard/question.dart';
import 'package:flutter_application_1/screens/learning/all_aboard/all_aboard.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class AbcQuizScreen extends StatelessWidget {
  const AbcQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return AndroidWelcome(
          constraints: constraints,
        );
      }),
    );
  }
}

class AndroidWelcome extends StatefulWidget {
  const AndroidWelcome({
    super.key,
    required this.constraints,
  });
  final BoxConstraints constraints;

  @override
  State<AndroidWelcome> createState() => _AndroidWelcomeState();
}

class _AndroidWelcomeState extends State<AndroidWelcome> {
  final AudioService _audioService = AudioService();
  final image = Assets.images.allAboard.letters.sample;
  late final List<AlphabetQuestion> questions;

  int currentQuestionIndex = 0;
  List<int> randomizedIndices = [];
  List<int?> userAnswers = [];
  bool showResults = false;

  late ConfettiController _leftController;
  late ConfettiController _rightController;
  late ConfettiHelper _confettiHelper;

  @override
  void initState() {
    super.initState();
    _audioService.setOnComplete(() {});

    questions = [
      AlphabetQuestion(
        questionText: "Aa",
        imageOptions: [
          image.apple.path,
          image.zoo.path,
          image.cat.path,
          image.kite.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/apple.m4a",
          "sounds/alphabet/example/zoo.m4a",
          "sounds/alphabet/example/cat.m4a",
          "sounds/alphabet/example/kite.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Bb",
        imageOptions: [
          image.ball.path,
          image.sun.path,
          image.doll.path,
          image.hand.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/ball.m4a",
          "sounds/alphabet/example/sun.m4a",
          "sounds/alphabet/example/doll.m4a",
          "sounds/alphabet/example/hand.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Cc",
        imageOptions: [
          image.cat.path,
          image.noodle.path,
          image.queen.path,
          image.vase.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/cat.m4a",
          "sounds/alphabet/example/noodle.m4a",
          "sounds/alphabet/example/queen.m4a",
          "sounds/alphabet/example/vase.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Dd",
        imageOptions: [
          image.doll.path,
          image.umbrella.path,
          image.jam.path,
          image.tail.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/doll.m4a",
          "sounds/alphabet/example/umbrella.m4a",
          "sounds/alphabet/example/jam.m4a",
          "sounds/alphabet/example/tail.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Ee",
        imageOptions: [
          image.egg.path,
          image.monkey.path,
          image.wagon.path,
          image.penguin.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/egg.m4a",
          "sounds/alphabet/example/monkey.m4a",
          "sounds/alphabet/example/wagon.m4a",
          "sounds/alphabet/example/penguin.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Ff",
        imageOptions: [
          image.fan.path,
          image.cat.path,
          image.noodle.path,
          image.xylophone.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/fan.m4a",
          "sounds/alphabet/example/cat.m4a",
          "sounds/alphabet/example/noodle.m4a",
          "sounds/alphabet/example/xylophone.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Gg",
        imageOptions: [
          image.goat.path,
          image.zoo.path,
          image.kite.path,
          image.tail.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/goat.m4a",
          "sounds/alphabet/example/zoo.m4a",
          "sounds/alphabet/example/kite.m4a",
          "sounds/alphabet/example/tail.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Hh",
        imageOptions: [
          image.hand.path,
          image.ramp.path,
          image.yarn.path,
          image.lamb.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/hand.m4a",
          "sounds/alphabet/example/ramp.m4a",
          "sounds/alphabet/example/yarn.m4a",
          "sounds/alphabet/example/lamb.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Ii",
        imageOptions: [
          image.ice.path,
          image.vase.path,
          image.monkey.path,
          image.umbrella.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/ice.m4a",
          "sounds/alphabet/example/vase.m4a",
          "sounds/alphabet/example/monkey.m4a",
          "sounds/alphabet/example/umbrella.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Jj",
        imageOptions: [
          image.jam.path,
          image.apple.path,
          image.xylophone.path,
          image.noodle.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/jam.m4a",
          "sounds/alphabet/example/apple.m4a",
          "sounds/alphabet/example/xylophone.m4a",
          "sounds/alphabet/example/noodle.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Kk",
        imageOptions: [
          image.kite.path,
          image.penguin.path,
          image.cat.path,
          image.fan.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/kite.m4a",
          "sounds/alphabet/example/penguin.m4a",
          "sounds/alphabet/example/cat.m4a",
          "sounds/alphabet/example/fan.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Ll",
        imageOptions: [
          image.lamb.path,
          image.sun.path,
          image.ball.path,
          image.wagon.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/lamb.m4a",
          "sounds/alphabet/example/sun.m4a",
          "sounds/alphabet/example/ball.m4a",
          "sounds/alphabet/example/wagon.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Mm",
        imageOptions: [
          image.monkey.path,
          image.vase.path,
          image.doll.path,
          image.hand.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/monkey.m4a",
          "sounds/alphabet/example/vase.m4a",
          "sounds/alphabet/example/doll.m4a",
          "sounds/alphabet/example/hand.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Nn",
        imageOptions: [
          image.noodle.path,
          image.apple.path,
          image.ramp.path,
          image.goat.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/noodle.m4a",
          "sounds/alphabet/example/apple.m4a",
          "sounds/alphabet/example/ramp.m4a",
          "sounds/alphabet/example/goat.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Oo",
        imageOptions: [
          image.octopus.path,
          image.zoo.path,
          image.tail.path,
          image.ice.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/octopus.m4a",
          "sounds/alphabet/example/zoo.m4a",
          "sounds/alphabet/example/tail.m4a",
          "sounds/alphabet/example/ice.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Pp",
        imageOptions: [
          image.penguin.path,
          image.yarn.path,
          image.jam.path,
          image.lamb.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/penguin.m4a",
          "sounds/alphabet/example/yarn.m4a",
          "sounds/alphabet/example/jam.m4a",
          "sounds/alphabet/example/lamb.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Qq",
        imageOptions: [
          image.queen.path,
          image.cat.path,
          image.fan.path,
          image.xylophone.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/queen.m4a",
          "sounds/alphabet/example/cat.m4a",
          "sounds/alphabet/example/fan.m4a",
          "sounds/alphabet/example/xylophone.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Rr",
        imageOptions: [
          image.ramp.path,
          image.monkey.path,
          image.umbrella.path,
          image.doll.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/ramp.m4a",
          "sounds/alphabet/example/monkey.m4a",
          "sounds/alphabet/example/umbrella.m4a",
          "sounds/alphabet/example/doll.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Ss",
        imageOptions: [
          image.sun.path,
          image.wagon.path,
          image.kite.path,
          image.zoo.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/sun.m4a",
          "sounds/alphabet/example/wagon.m4a",
          "sounds/alphabet/example/kite.m4a",
          "sounds/alphabet/example/zoo.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Tt",
        imageOptions: [
          image.tail.path,
          image.jam.path,
          image.apple.path,
          image.queen.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/tail.m4a",
          "sounds/alphabet/example/jam.m4a",
          "sounds/alphabet/example/apple.m4a",
          "sounds/alphabet/example/queen.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Uu",
        imageOptions: [
          image.umbrella.path,
          image.penguin.path,
          image.ramp.path,
          image.lamb.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/umbrella.m4a",
          "sounds/alphabet/example/penguin.m4a",
          "sounds/alphabet/example/ramp.m4a",
          "sounds/alphabet/example/lamb.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Vv",
        imageOptions: [
          image.vase.path,
          image.doll.path,
          image.hand.path,
          image.ice.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/vase.m4a",
          "sounds/alphabet/example/doll.m4a",
          "sounds/alphabet/example/hand.m4a",
          "sounds/alphabet/example/ice.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Ww",
        imageOptions: [
          image.wagon.path,
          image.sun.path,
          image.tail.path,
          image.cat.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/wagon.m4a",
          "sounds/alphabet/example/sun.m4a",
          "sounds/alphabet/example/tail.m4a",
          "sounds/alphabet/example/cat.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Xx",
        imageOptions: [
          image.xylophone.path,
          image.octopus.path,
          image.kite.path,
          image.yarn.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/xylophone.m4a",
          "sounds/alphabet/example/octopus.m4a",
          "sounds/alphabet/example/kite.m4a",
          "sounds/alphabet/example/yarn.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Yy",
        imageOptions: [
          image.yarn.path,
          image.apple.path,
          image.noodle.path,
          image.penguin.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/yarn.m4a",
          "sounds/alphabet/example/apple.m4a",
          "sounds/alphabet/example/noodle.m4a",
          "sounds/alphabet/example/penguin.m4a",
        ],
        correctAnswerIndex: 0,
      ),
      AlphabetQuestion(
        questionText: "Zz",
        imageOptions: [
          image.zoo.path,
          image.queen.path,
          image.monkey.path,
          image.vase.path,
        ],
        audioOptions: [
          "sounds/alphabet/example/zoo.m4a",
          "sounds/alphabet/example/queen.m4a",
          "sounds/alphabet/example/monkey.m4a",
          "sounds/alphabet/example/vase.m4a",
        ],
        correctAnswerIndex: 0,
      ),
    ];

    randomizeCurrentQuestion();

    _leftController =
        ConfettiController(duration: const Duration(milliseconds: 1000));
    _rightController =
        ConfettiController(duration: const Duration(milliseconds: 1000));
    _confettiHelper = ConfettiHelper(_leftController, _rightController);
  }

  void _play(soundPath) async {
    await _audioService.playFromAssets(soundPath);
  }

  void _stop() async {
    await _audioService.stop();
  }

  @override
  void dispose() {
    _audioService.dispose();
    _confettiHelper.stopConfettiLoop(); // Stop the loop
    _confettiHelper.dispose(); // Dispose of controllers
    super.dispose();
  }

  void randomizeCurrentQuestion() {
    randomizedIndices = List.generate(
      questions[currentQuestionIndex].imageOptions.length,
      (index) => index,
    );
    randomizedIndices.shuffle(Random());
  }

  void handleAnswer(int selectedIndex) {
    setState(() {
      if (userAnswers.length <= currentQuestionIndex) {
        userAnswers.add(randomizedIndices[selectedIndex]);
      } else {
        userAnswers[currentQuestionIndex] = randomizedIndices[selectedIndex];
      }
    });
  }

  void nextQuestion() {
    _stop();
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        randomizeCurrentQuestion();
      });
    } else if (userAnswers.length == questions.length) {
      _confettiHelper
          .startConfettiLoop(); // Start confetti loop when results are shown
      setState(() {
        showResults = true;
      });
    }
  }

  int calculateScore() {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers.length > i &&
          userAnswers[i] == questions[i].correctAnswerIndex) {
        score++;
      }
    }
    return score;
  }

  void restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      userAnswers.clear();
      showResults = false;
      randomizeCurrentQuestion();
      _confettiHelper.stopConfettiLoop(); // Stop confetti when restarting
    });
  }

  void close() {
    return Navigator.of(context).pop();
  }

  Widget buildResultsScreen() {
    final score = calculateScore();
    final percentage = (score / questions.length * 100).round();

    final highScore = prefs.getInt('alphabets_high_score') ?? 0;

    if (percentage > highScore) {
      prefs.setInt('alphabets_high_score', percentage);
    }

    return Stack(
      children: [
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Gap(30),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const Text(
                                    "score",
                                    style: TextStyle(
                                      color: Color(0xff60CFFF),
                                      fontSize: 26,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffC2FDFF),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    width: 120,
                                    child: Text(
                                      percentage.toString(),
                                      style: const TextStyle(
                                        color: Color(0xff228AED),
                                        fontSize: 28,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Gap(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // NiceButton(
                              //   label: "Restart",
                              //   color: Colors.yellow,
                              //   shadowColor: Colors.yellow[800]!,
                              //   icon: Icons.check_rounded,
                              //   iconSize: 30,
                              //   width: 120,
                              //   method: restartQuiz,
                              // ),
                              PushReplacement(
                                route: PageTransition(
                                    type: PageTransitionType.scale,
                                    alignment: Alignment.center,
                                    child: const AllAboardScreen()),
                                child: NiceButton(
                                  label: "OK",
                                  color: const Color(0xffC16DFE),
                                  shadowColor: Colors.yellow[800]!,
                                  icon: Icons.check_rounded,
                                  isIconRight: true,
                                  iconSize: 30,
                                  method: () {
                                    if (context.mounted) {
                                      Navigator.pushReplacement(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          alignment: Alignment.center,
                                          child: const AllAboardScreen(),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: -50,
                      child: Container(
                        width: 500,
                        height: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/ribbon.png'),
                          ),
                        ),
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                "Congratulations",
                                style: TextStyle(
                                  fontSize: 27,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      color: Color(0xffB20D78),
                                      offset: Offset(1, 3),
                                      blurRadius: 3,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Center-left confetti
        if (percentage > highScore)
          Align(
            alignment: Alignment.centerLeft,
            child: ConfettiComponent(
              controller: _leftController,
              blastDirection: -3.14 / 4, // Default direction for left
            ),
          ),
        // Center-right confetti
        if (percentage > highScore)
          Align(
            alignment: Alignment.centerRight,
            child: ConfettiComponent(
              controller: _rightController,
              blastDirection: -3.14 * 3 / 4, // Default direction for right
            ),
          ),
      ],
    );
  }

  Widget buildQuizScreen() {
    AlphabetQuestion currentQuestion = questions[currentQuestionIndex];
    bool hasAnswered = userAnswers.length > currentQuestionIndex &&
        userAnswers[currentQuestionIndex] != null;

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const TopBar(),
          const Spacer(),
          Card(
            margin: EdgeInsets.symmetric(
              horizontal: widget.constraints.maxWidth * .10,
              vertical: widget.constraints.maxHeight * .02,
            ),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                widget.constraints.maxWidth * .04,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(widget.constraints.maxWidth * .03),
              child: Column(
                children: [
                  Text(
                    currentQuestion.questionText,
                    style: TextStyle(
                      color: const Color(0xff6F53FD),
                      fontSize: widget.constraints.maxHeight * .15,
                      height: 1.0,
                    ),
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: List.generate(
                      currentQuestion.imageOptions.length,
                      (index) => GestureDetector(
                        onTap: () {
                          _stop();
                          _play(currentQuestion
                              .audioOptions[randomizedIndices[index]]);
                          handleAnswer(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff95E9FF),
                            border: Border.all(
                              color: hasAnswered &&
                                      randomizedIndices[index] ==
                                          userAnswers[currentQuestionIndex]
                                  ? Colors.amber
                                  : Colors.grey,
                              width: hasAnswered &&
                                      randomizedIndices[index] ==
                                          userAnswers[currentQuestionIndex]
                                  ? 4
                                  : 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              currentQuestion
                                  .imageOptions[randomizedIndices[index]],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  LayoutBuilder(builder: (context, constraints) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NiceButton(
                        width: constraints.maxWidth * .9,
                        isIconRight: true,
                        label: currentQuestionIndex == questions.length - 1
                            ? 'Finish'
                            : 'Next',
                        color: const Color.fromARGB(255, 87, 210, 91),
                        shadowColor: Colors.green[800]!,
                        icon: Icons.arrow_forward,
                        iconSize: 30,
                        enabled: hasAnswered,
                        method: hasAnswered ? nextQuestion : null,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          // const Spacer(),

          const Spacer(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(bottom: 20.0, right: 50),
          //       child: Image.asset(
          //         'assets/images/dog.png',
          //         height: widget.constraints.maxHeight * 0.17,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        image: DecorationImage(
          image: Assets.images.background.provider(),
          fit: BoxFit.cover,
        ),
      ),
      child: showResults ? buildResultsScreen() : buildQuizScreen(),
    );
  }
}
