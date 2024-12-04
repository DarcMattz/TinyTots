import 'dart:developer';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:tinytots/components/confetti_component.dart';
import 'package:tinytots/components/push_replacement.dart';
import 'package:tinytots/components/utils/nice_button.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/globals.dart';
import 'package:tinytots/helper/confetti_helper.dart';
import 'package:tinytots/screens/learning/science/science.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class BodyQuizScreen extends StatefulWidget {
  const BodyQuizScreen({super.key});

  @override
  State<BodyQuizScreen> createState() => _BodyQuizState();
}

class _BodyQuizState extends State<BodyQuizScreen> {
  final ConfettiController _leftController =
      ConfettiController(duration: const Duration(milliseconds: 1000));
  final ConfettiController _rightController =
      ConfettiController(duration: const Duration(milliseconds: 1000));
  late ConfettiHelper _confettiHelper;

  String acceptedData = "";
  int mistakes = 0;
  bool isFinished = false;

  Map<String, bool> isDone = {
    "eye": false,
    "left_ear": false,
    "right_ear": false,
    "mouth": false,
    "eyebrow": false,
  };

  Map<String, Color> targetColors = {
    "eye": Colors.grey,
    "left_ear": Colors.grey,
    "right_ear": Colors.grey,
    "mouth": Colors.grey,
    "eyebrow": Colors.grey,
  };

  @override
  void initState() {
    _confettiHelper = ConfettiHelper(_leftController, _rightController);
    super.initState();
  }

  int calculateScore() {
    if (mistakes == 0) {
      return 100; // 3 stars for no mistakes
    } else if (mistakes == 1) {
      return 50; // 2 stars for 1 mistake
    } else {
      return 25; // 1 star for 2 or more mistakes
    }
  }

  void _wrong(String target) async {
    mistakes += 1;
    // Change color to red
    setState(() {
      targetColors[target] = Colors.red;
    });

    // Wait for 0.5 seconds
    await Future.delayed(const Duration(milliseconds: 700));

    // Change color back to grey
    setState(() {
      targetColors[target] = Colors.grey;
    });
  }

  void _correct(String target) async {
    isDone[target] = true;

    // Change color to green
    setState(() {
      targetColors[target] = Colors.green;
    });

    // Wait for 0.5 seconds
    await Future.delayed(const Duration(milliseconds: 700));

    // Change color back to transparent
    setState(() {
      targetColors[target] = Colors.transparent;
    });

    for (var entry in isDone.values) {
      if (!entry) {
        isFinished = false;
        log('not yet');
        break;
      } else {
        isFinished = true;
      }
    }

    if (isFinished) {
      log('tapos na');
      log("mistakes: ${mistakes.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: Assets.images.background.provider(),
        )),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: LayoutBuilder(builder: (context, constraints) {
              return isFinished ? buildResultsScreen() : buildQuizScreen();
            }),
          ),
        ),
      ),
    );
  }

  Widget buildQuizScreen() {
    return Card(
      elevation: 4,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff95E9FF),
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: Assets.images.science.body.quiz.head.provider(),
                  ),
                ),
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.7,
                child: Stack(
                  children: [
                    Positioned(
                      left: constraints.maxWidth * .21,
                      top: constraints.maxHeight * .329,
                      child: DragTarget<String>(
                        builder: (BuildContext context, List<dynamic> accepted,
                            List<dynamic> rejected) {
                          return Container(
                            height: constraints.maxHeight * .085,
                            width: constraints.maxWidth * .19,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: targetColors['eye'],
                            ),
                          );
                        },
                        onWillAcceptWithDetails: (details) =>
                            details.data != '' && isDone['eye'] == false,
                        onAcceptWithDetails:
                            (DragTargetDetails<String> details) {
                          if (details.data != 'eye') {
                            _wrong('eye');
                            log(details.data);
                          } else {
                            setState(() {
                              _correct('eye');
                              log('correct');
                            });
                          }
                        },
                      ),
                    ),
                    Positioned(
                      top: constraints.maxHeight * .345,
                      child: DragTarget<String>(
                        builder: (BuildContext context, List<dynamic> accepted,
                            List<dynamic> rejected) {
                          return Container(
                            height: constraints.maxHeight * .08,
                            width: constraints.maxWidth * .19,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: targetColors['left_ear'],
                            ),
                          );
                        },
                        onWillAcceptWithDetails: (details) =>
                            details.data != '' && isDone['left_ear'] == false,
                        onAcceptWithDetails:
                            (DragTargetDetails<String> details) {
                          if (details.data != 'left_ear') {
                            _wrong('left_ear');
                            log(details.data);
                          } else {
                            setState(() {
                              _correct('left_ear');
                              log('correct');
                            });
                          }
                        },
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: constraints.maxHeight * .345,
                      child: DragTarget<String>(
                        builder: (BuildContext context, List<dynamic> accepted,
                            List<dynamic> rejected) {
                          return Container(
                            height: constraints.maxHeight * .08,
                            width: constraints.maxWidth * .19,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: targetColors['right_ear'],
                            ),
                          );
                        },
                        onWillAcceptWithDetails: (details) =>
                            details.data != '' && isDone['right_ear'] == false,
                        onAcceptWithDetails:
                            (DragTargetDetails<String> details) {
                          if (details.data != 'right_ear') {
                            _wrong('right_ear');
                            log(details.data);
                          } else {
                            setState(() {
                              _correct('right_ear');
                              log('correct');
                            });
                          }
                        },
                      ),
                    ),
                    Positioned(
                      right: constraints.maxWidth * .21,
                      top: constraints.maxHeight * .28,
                      child: DragTarget<String>(
                        builder: (BuildContext context, List<dynamic> accepted,
                            List<dynamic> rejected) {
                          return Container(
                            height: constraints.maxHeight * .05,
                            width: constraints.maxWidth * .19,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: targetColors['eyebrow'],
                            ),
                          );
                        },
                        onWillAcceptWithDetails: (details) =>
                            details.data != '' && isDone['eyebrow'] == false,
                        onAcceptWithDetails:
                            (DragTargetDetails<String> details) {
                          if (details.data != 'eyebrow') {
                            _wrong('eyebrow');
                            log(details.data);
                          } else {
                            setState(() {
                              _correct('eyebrow');
                              log('correct');
                            });
                          }
                        },
                      ),
                    ),
                    Positioned(
                      right: constraints.maxWidth * .37,
                      left: constraints.maxWidth * .37,
                      top: constraints.maxHeight * .425,
                      bottom: constraints.maxHeight * .215,
                      child: DragTarget<String>(
                        builder: (BuildContext context, List<dynamic> accepted,
                            List<dynamic> rejected) {
                          return Container(
                            height: constraints.maxHeight * .09,
                            width: constraints.maxWidth * .19,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: targetColors['mouth'],
                            ),
                          );
                        },
                        onWillAcceptWithDetails: (details) =>
                            details.data != '' && isDone['mouth'] == false,
                        onAcceptWithDetails:
                            (DragTargetDetails<String> details) {
                          if (details.data != 'mouth') {
                            _wrong('mouth');
                            log(details.data);
                          } else {
                            setState(() {
                              _correct('mouth');
                              log('correct');
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight * 0.25,
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  isDone['eye']!
                      ? const SizedBox(
                          height: 100,
                          width: 100,
                        )
                      : Draggable<String>(
                          data: "eye",
                          feedback: SizedBox(
                            height: 100,
                            width: 100,
                            child: Assets.images.science.body.quiz.eye.image(),
                          ),
                          childWhenDragging: const SizedBox(
                            height: 100.0,
                            width: 100.0,
                          ),
                          child: SizedBox(
                            height: 100.0,
                            width: 100.0,
                            child: Center(
                              child:
                                  Assets.images.science.body.quiz.eye.image(),
                            ),
                          ),
                        ),
                  isDone['mouth']!
                      ? const SizedBox(
                          height: 100,
                          width: 100,
                        )
                      : Draggable<String>(
                          data: "mouth",
                          feedback: SizedBox(
                            height: 100,
                            width: 100,
                            child:
                                Assets.images.science.body.quiz.mouth.image(),
                          ),
                          childWhenDragging: const SizedBox(
                            height: 100.0,
                            width: 100.0,
                          ),
                          child: SizedBox(
                            height: 100.0,
                            width: 100.0,
                            child: Center(
                              child:
                                  Assets.images.science.body.quiz.mouth.image(),
                            ),
                          ),
                        ),
                  isDone['eyebrow']!
                      ? const SizedBox(
                          height: 100,
                          width: 100,
                        )
                      : Draggable<String>(
                          data: "eyebrow",
                          feedback: SizedBox(
                            height: 100,
                            width: 100,
                            child:
                                Assets.images.science.body.quiz.eyebrow.image(),
                          ),
                          childWhenDragging: const SizedBox(
                            height: 100.0,
                            width: 100.0,
                          ),
                          child: SizedBox(
                            height: 100.0,
                            width: 100.0,
                            child: Center(
                              child: Assets.images.science.body.quiz.eyebrow
                                  .image(),
                            ),
                          ),
                        ),
                  isDone['left_ear']!
                      ? const SizedBox(
                          height: 100,
                          width: 100,
                        )
                      : Draggable<String>(
                          data: "left_ear",
                          feedback: SizedBox(
                            height: 100,
                            width: 100,
                            child:
                                Assets.images.science.body.quiz.leftEar.image(),
                          ),
                          childWhenDragging: const SizedBox(
                            height: 100.0,
                            width: 100.0,
                          ),
                          child: SizedBox(
                            height: 100.0,
                            width: 100.0,
                            child: Center(
                              child: Assets.images.science.body.quiz.leftEar
                                  .image(),
                            ),
                          ),
                        ),
                  isDone['right_ear']!
                      ? const SizedBox(
                          height: 100,
                          width: 100,
                        )
                      : Draggable<String>(
                          data: "right_ear",
                          feedback: SizedBox(
                            height: 100,
                            width: 100,
                            child: Assets.images.science.body.quiz.rightEar
                                .image(),
                          ),
                          childWhenDragging: const SizedBox(
                            height: 100.0,
                            width: 100.0,
                          ),
                          child: SizedBox(
                            height: 100.0,
                            width: 100.0,
                            child: Center(
                              child: Assets.images.science.body.quiz.rightEar
                                  .image(),
                            ),
                          ),
                        ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }

  Widget buildResultsScreen() {
    final percentage = calculateScore();

    final highScore = prefs.getInt('body_high_score') ?? 0;

    if (percentage > highScore) {
      prefs.setInt('body_high_score', percentage);
      _confettiHelper.startConfettiLoop();
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
                          const Gap(20),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PushReplacement(
                                route: PageTransition(
                                    type: PageTransitionType.scale,
                                    alignment: Alignment.center,
                                    child: const ScienceHealthScreen()),
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
                                          child: const ScienceHealthScreen(),
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
}
