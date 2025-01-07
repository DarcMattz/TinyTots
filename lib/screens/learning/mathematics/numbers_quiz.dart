import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:tinytots/components/confetti_component.dart';
import 'package:tinytots/components/push_replacement.dart';
import 'package:tinytots/components/utils/nice_button.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/globals.dart';
import 'package:tinytots/helper/audio_service.dart';
import 'package:tinytots/helper/confetti_helper.dart';
import 'package:tinytots/models/mathematics/questions.dart';
import 'package:tinytots/models/vowels/questions.dart';
import 'package:tinytots/screens/learning/mathematics/mathematics.dart';
import 'package:tinytots/screens/learning/phonics/phonics.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tinytots/screens/learning/phonics/vowels.dart';

class NumbersQuizScreen extends StatelessWidget {
  const NumbersQuizScreen({super.key});

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
  late final List<MathQuestion> questions;

  int currentQuestionIndex = 0;
  List<int> randomizedIndices = [];
  List<int?> userAnswers = [];
  int? selectedAnswer;
  bool showResults = false;
  int score = 0;
  bool isCorrect = false;
  bool hasChecked = false;

  late ConfettiController _leftController;
  late ConfettiController _rightController;
  late ConfettiHelper _confettiHelper;

  @override
  void initState() {
    super.initState();
    _audioService.setOnComplete(() {});

    questions = [
      MathQuestion(
        imagePath: Assets.images.mathematics.quizNumber.one.path,
        options: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
        correctAnswerIndex: 0,
      ),
      MathQuestion(
        imagePath: Assets.images.mathematics.quizNumber.two.path,
        options: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
        correctAnswerIndex: 1,
      ),
      MathQuestion(
        imagePath: Assets.images.mathematics.quizNumber.three.path,
        options: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
        correctAnswerIndex: 2,
      ),
      MathQuestion(
        imagePath: Assets.images.mathematics.quizNumber.four.path,
        options: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
        correctAnswerIndex: 3,
      ),
      MathQuestion(
        imagePath: Assets.images.mathematics.quizNumber.five.path,
        options: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
        correctAnswerIndex: 4,
      ),
      MathQuestion(
        imagePath: Assets.images.mathematics.quizNumber.six.path,
        options: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
        correctAnswerIndex: 5,
      ),
      MathQuestion(
        imagePath: Assets.images.mathematics.quizNumber.seven.path,
        options: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
        correctAnswerIndex: 6,
      ),
      MathQuestion(
        imagePath: Assets.images.mathematics.quizNumber.eight.path,
        options: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
        correctAnswerIndex: 7,
      ),
      MathQuestion(
        imagePath: Assets.images.mathematics.quizNumber.nine.path,
        options: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
        correctAnswerIndex: 8,
      ),
      MathQuestion(
        imagePath: Assets.images.mathematics.quizNumber.ten.path,
        options: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
        correctAnswerIndex: 9,
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
      questions[currentQuestionIndex].options.length,
      (index) => index,
    );
    randomizedIndices.shuffle(Random());
  }

  void handleAnswer(int selectedIndex) {
    selectedAnswer = selectedIndex;
    setState(() {
      if (userAnswers.length <= currentQuestionIndex) {
        userAnswers.add(randomizedIndices[selectedIndex]);
      } else {
        userAnswers[currentQuestionIndex] = randomizedIndices[selectedIndex];
      }
    });
  }

  void checkAnswer(int selectedIndex) {
    // if (selectedAnswer != null) return;

    setState(() {
      if (userAnswers[currentQuestionIndex] ==
          questions[currentQuestionIndex].correctAnswerIndex) {
        isCorrect = true;
        print('tama');
        _audioService.playFromAssets('sounds/correct.wav');
      } else {
        isCorrect = false;
        print('mali');
        _audioService.playFromAssets('sounds/wrong.mp3');
      }
      Future.delayed(const Duration(seconds: 2), () {
        nextQuestion();
      });
      hasChecked = true;
    });
  }

  void nextQuestion() {
    isCorrect = false;
    hasChecked = false;
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
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers.length > i &&
          userAnswers[i] == questions[i].correctAnswerIndex) {
        score++;
      }
    }
    _audioService.playFromAssets('sounds/finish.mp3');
    if (score / questions.length * 100 < 50) {
      _audioService.playFromAssets('sounds/quiz/low_1.m4a');
    } else if (score / questions.length * 100 < 75) {
      _audioService.playFromAssets('sounds/quiz/low_2.m4a');
    } else if (score / questions.length * 100 < 100) {
      _audioService.playFromAssets('sounds/quiz/great.m4a');
    } else {
      _audioService.playFromAssets('sounds/quiz/perfect.m4a');
    }
    return score;
  }

  void close() {
    return Navigator.of(context).pop();
  }

  Widget buildResultsScreen() {
    final score = calculateScore();
    final percentage = (score / questions.length * 100).round();

    final highScore = prefs.getInt('numbers_high_score') ?? 0;

    if (percentage > highScore) {
      prefs.setInt('numbers_high_score', percentage);
    }

    Widget star;
    double height = 75;
    if (percentage < 25) {
      star = Assets.images.star0.image(height: height);
    } else if (percentage < 50) {
      star = Assets.images.star1.image(height: height);
    } else if (percentage < 100) {
      star = Assets.images.star2.image(height: height);
    } else {
      star = Assets.images.star3.image(height: height);
    }

    return Stack(
      children: [
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
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
                                  Text(
                                    percentage > highScore
                                        ? "New High Score!"
                                        : "score",
                                    style: const TextStyle(
                                      color: Color(0xff60CFFF),
                                      fontSize: 20,
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
                                  const Gap(12),
                                  const Text(
                                    'High Score',
                                    style: TextStyle(
                                      color: Color(0xFFFFB213),
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    highScore.toString(),
                                    style: const TextStyle(
                                      color: Color(0xFFFFB213),
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PushReplacement(
                                route: PageTransition(
                                    type: PageTransitionType.scale,
                                    alignment: Alignment.center,
                                    child: const MathematicsScreen()),
                                child: NiceButton(
                                  label: "OK",
                                  color: const Color(0xffC16DFE),
                                  shadowColor: Colors.yellow[800]!,
                                  icon: Icons.arrow_right,
                                  isIconRight: true,
                                  iconSize: 30,
                                  method: () {
                                    if (context.mounted) {
                                      Navigator.pushReplacement(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          alignment: Alignment.center,
                                          child: const MathematicsScreen(),
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
                      top: -150,
                      child: star,
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
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                percentage < 50
                                    ? "Good try!"
                                    : percentage < 75
                                        ? "Well done!"
                                        : "Amazing!",
                                style: const TextStyle(
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
              if (highScore < percentage)
                Assets.images.gif.snail.image(height: 250),
              if (highScore >= percentage) Spacer(),
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
    MathQuestion currentQuestion = questions[currentQuestionIndex];
    bool hasAnswered = userAnswers.length > currentQuestionIndex &&
        userAnswers[currentQuestionIndex] != null;

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                  Card(
                    color: Color(0xff95E9FF),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        widget.constraints.maxWidth * .04,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Image(
                                image: AssetImage(currentQuestion.imagePath),
                                height: widget.constraints.maxHeight * .2,
                                width: widget.constraints.maxWidth,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(widget.constraints.maxHeight * .02),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: List.generate(
                        currentQuestion.options.length,
                        (index) {
                          final isSelected = index == selectedAnswer;
                          return GestureDetector(
                            onTap: hasChecked
                                ? null
                                : () {
                                    handleAnswer(index);
                                  },
                            child: Container(
                              width: widget.constraints.maxWidth * .2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xff4CDAFE),
                                border: Border.all(
                                  color: hasChecked && isSelected
                                      ? (isCorrect ? Colors.green : Colors.red)
                                      : hasAnswered && isSelected
                                          ? Colors.amber
                                          : Colors.grey,
                                  width: widget.constraints.maxWidth * .01,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  currentQuestion
                                      .options[randomizedIndices[index]],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        widget.constraints.maxHeight * .020,
                                    height: 1.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Gap(widget.constraints.maxHeight * .02),
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
                        method: hasChecked
                            ? null
                            : () => checkAnswer(selectedAnswer!),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          const Spacer(),
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
