import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:tinytots/components/confetti_component.dart';
import 'package:tinytots/components/push_replacement.dart';
import 'package:tinytots/components/utils/nice_button.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/globals.dart';
import 'package:tinytots/helper/audio_service.dart';
import 'package:tinytots/helper/confetti_helper.dart';
import 'package:tinytots/models/vowels/questions.dart';
import 'package:tinytots/screens/learning/phonics/phonics.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class VowelsQuizScreen extends StatelessWidget {
  const VowelsQuizScreen({super.key});

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
  late final List<VowelsQuestion> questions;

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
      // Questions for 'a'
      VowelsQuestion(
        imagePath: Assets.images.phonics.vowels.cat.path,
        questionText: "c_t",
        audioPath: "sounds/vowels/cacat.m4a",
        options: [
          'a',
          'o',
          'e',
        ],
        correctAnswerIndex: 0,
      ),
      VowelsQuestion(
        imagePath: Assets.images.phonics.vowels.mat.path,
        questionText: "m_t",
        audioPath: "sounds/vowels/mamat.m4a",
        options: [
          'a',
          'i',
          'u',
        ],
        correctAnswerIndex: 0,
      ),
      VowelsQuestion(
        imagePath: Assets.images.phonics.vowels.lamp.path,
        questionText: "l_mp",
        audioPath: "sounds/vowels/lalamp.m4a",
        options: [
          'a',
          'e',
          'o',
        ],
        correctAnswerIndex: 0,
      ),

      // Questions for 'e'
      VowelsQuestion(
        imagePath: Assets.images.phonics.vowels.bed.path,
        questionText: "b_d",
        audioPath: "sounds/vowels/bebed.m4a",
        options: [
          'e',
          'i',
          'a',
        ],
        correctAnswerIndex: 0,
      ),
      VowelsQuestion(
        imagePath: Assets.images.phonics.vowels.net.path,
        questionText: "n_t",
        audioPath: "sounds/vowels/nenet.m4a",
        options: [
          'e',
          'o',
          'u',
        ],
        correctAnswerIndex: 0,
      ),
      VowelsQuestion(
        imagePath: Assets.images.phonics.vowels.pen.path,
        questionText: "p_n",
        audioPath: "sounds/vowels/pepen.m4a",
        options: [
          'e',
          'a',
          'i',
        ],
        correctAnswerIndex: 0,
      ),

      // Questions for 'i'
      VowelsQuestion(
        imagePath: Assets.images.phonics.vowels.bib.path,
        questionText: "b_b",
        audioPath: "sounds/vowels/bibib.m4a",
        options: [
          'i',
          'e',
          'o',
        ],
        correctAnswerIndex: 0,
      ),
      VowelsQuestion(
        imagePath: Assets.images.phonics.vowels.pig.path,
        questionText: "p_g",
        audioPath: "sounds/vowels/pipig.m4a",
        options: [
          'i',
          'u',
          'a',
        ],
        correctAnswerIndex: 0,
      ),
      VowelsQuestion(
        imagePath: Assets.images.phonics.vowels.gift.path,
        questionText: "g_ft",
        audioPath: "sounds/vowels/gigift.m4a",
        options: [
          'i',
          'e',
          'o',
        ],
        correctAnswerIndex: 0,
      ),

      // Questions for 'o'
      VowelsQuestion(
        imagePath: Assets.images.phonics.vowels.dog.path,
        questionText: "d_g",
        audioPath: "sounds/vowels/dodog.m4a",
        options: [
          'o',
          'a',
          'e',
        ],
        correctAnswerIndex: 0,
      ),
      VowelsQuestion(
        imagePath: Assets.images.phonics.vowels.hog.path,
        questionText: "h_g",
        audioPath: "sounds/vowels/hohog.m4a",
        options: [
          'o',
          'u',
          'i',
        ],
        correctAnswerIndex: 0,
      ),
      VowelsQuestion(
        imagePath: Assets.images.phonics.vowels.cot.path,
        questionText: "c_t",
        audioPath: "sounds/vowels/cocot.m4a",
        options: [
          'o',
          'a',
          'e',
        ],
        correctAnswerIndex: 0,
      ),

      // Questions for 'u'
      VowelsQuestion(
        imagePath: Assets.images.phonics.vowels.bus.path,
        questionText: "b_s",
        audioPath: "sounds/vowels/bubus.m4a",
        options: [
          'u',
          'i',
          'o',
        ],
        correctAnswerIndex: 0,
      ),
      VowelsQuestion(
        imagePath: Assets.images.phonics.vowels.sun.path,
        questionText: "s_n",
        audioPath: "sounds/vowels/susun.m4a",
        options: [
          'u',
          'a',
          'e',
        ],
        correctAnswerIndex: 0,
      ),
      VowelsQuestion(
        imagePath: Assets.images.phonics.vowels.hut.path,
        questionText: "h_t",
        audioPath: "sounds/vowels/huhut.m4a",
        options: [
          'u',
          'o',
          'a',
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
      questions[currentQuestionIndex].options.length,
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

  // void restartQuiz() {
  //   setState(() {
  //     currentQuestionIndex = 0;
  //     userAnswers.clear();
  //     showResults = false;
  //     randomizeCurrentQuestion();
  //     _confettiHelper.stopConfettiLoop(); // Stop confetti when restarting
  //   });
  // }

  void close() {
    return Navigator.of(context).pop();
  }

  Widget buildResultsScreen() {
    final score = calculateScore();
    final percentage = (score / questions.length * 100).round();

    final highScore = prefs.getInt('vowels_high_score') ?? 0;

    if (percentage > highScore) {
      prefs.setInt('vowels_high_score', percentage);
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
                                    child: const PhonicsScreen()),
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
                                          child: const PhonicsScreen(),
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
    VowelsQuestion currentQuestion = questions[currentQuestionIndex];
    bool hasAnswered = userAnswers.length > currentQuestionIndex &&
        userAnswers[currentQuestionIndex] != null;

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TopBar(),
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
                  GestureDetector(
                    onTap: () {
                      _play(currentQuestion.audioPath);
                    },
                    child: Card(
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
                                Text(
                                  currentQuestion.questionText!,
                                  style: TextStyle(
                                    color: const Color(0xffA659FE),
                                    fontSize:
                                        widget.constraints.maxHeight * .05,
                                    height: 1.0,
                                  ),
                                )
                              ],
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Icon(Icons.volume_up_rounded),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      spacing: 10, // Horizontal spacing between children
                      // runSpacing: 10, // Vertical spacing between rows
                      children: List.generate(
                        currentQuestion.options.length,
                        (index) => GestureDetector(
                          onTap: () {
                            handleAnswer(index);
                          },
                          child: Container(
                            width: widget.constraints.maxWidth * .2,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color(0xff4CDAFE),
                                border: Border.all(
                                  color: hasAnswered &&
                                          randomizedIndices[index] ==
                                              userAnswers[currentQuestionIndex]
                                      ? Colors.amber
                                      : Colors.white,
                                  width: widget.constraints.maxWidth * .01,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  hasAnswered &&
                                          randomizedIndices[index] ==
                                              userAnswers[currentQuestionIndex]
                                      ? BoxShadow(
                                          color: Colors.amber.withOpacity(0.5),
                                          offset: const Offset(0, 3),
                                        )
                                      : BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          offset: const Offset(0, 3),
                                        ),
                                ]),
                            child: Text(
                              currentQuestion.options[randomizedIndices[index]],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: widget.constraints.maxHeight * .05,
                                height: 1.0,
                              ),
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
