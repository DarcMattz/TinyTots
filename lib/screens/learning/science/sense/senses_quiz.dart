import 'dart:developer';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tinytots/components/confetti_component.dart';
import 'package:tinytots/components/push_replacement.dart';
import 'package:tinytots/components/utils/nice_button.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/globals.dart';
import 'package:tinytots/helper/audio_service.dart';
import 'package:tinytots/helper/confetti_helper.dart';
import 'package:tinytots/screens/learning/science/science.dart';

class SensesQuizScreen extends StatefulWidget {
  const SensesQuizScreen({super.key});

  @override
  State<SensesQuizScreen> createState() => _SensesQuizScreenState();
}

class _SensesQuizScreenState extends State<SensesQuizScreen> {
  final ConfettiController _leftController =
      ConfettiController(duration: const Duration(milliseconds: 1000));
  final ConfettiController _rightController =
      ConfettiController(duration: const Duration(milliseconds: 1000));
  late ConfettiHelper _confettiHelper;
  final AudioService _audioService = AudioService();

  String acceptedData = "";
  int mistakes = 0;
  bool isFinished = false;

  Map<String, bool> isDone = {
    "sight": false,
    "smell": false,
    "taste": false,
    "hear": false,
    "touch": false,
  };

  Map<String, String> imagePath = {
    "sight": Assets.images.science.senses.quiz.sight.path,
    "smell": Assets.images.science.senses.quiz.smell.path,
    "taste": Assets.images.science.senses.quiz.taste.path,
    "hear": Assets.images.science.senses.quiz.hear.path,
    "touch": Assets.images.science.senses.quiz.touch.path,
  };

  List<String> answers = ["sight", "smell", "taste", "hear", "touch"];

  Map<String, Color> targetColors = {
    "sight": const Color(0xff95E9FF),
    "smell": const Color(0xff95E9FF),
    "taste": const Color(0xff95E9FF),
    "hear": const Color(0xff95E9FF),
    "touch": const Color(0xff95E9FF),
  };

  @override
  void initState() {
    _confettiHelper = ConfettiHelper(_leftController, _rightController);
    super.initState();
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
            padding: const EdgeInsets.all(14),
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
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  isDone['sight']!
                      ? const SizedBox(
                          height: 50,
                          width: 100,
                        )
                      : Draggable<String>(
                          data: "sight",
                          feedback: Material(
                            color: Colors.transparent,
                            child: Card(
                              color: const Color(0xffFFDD17),
                              child: Container(
                                height: 50,
                                width: 100,
                                child: const Center(
                                  child: Text(
                                    'SIGHT',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          childWhenDragging: const Card(
                            elevation: 0,
                            child: SizedBox(
                              height: 50,
                              width: 100,
                            ),
                          ),
                          child: Card(
                            clipBehavior: Clip.hardEdge,
                            color: const Color(0xffFFDD17),
                            child: Container(
                              color: Colors.transparent,
                              height: 50,
                              width: 100,
                              child: const Center(
                                child: Text(
                                  'SIGHT',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                  isDone['smell']!
                      ? const SizedBox(
                          height: 50,
                          width: 100,
                        )
                      : Draggable<String>(
                          data: "smell",
                          feedback: Material(
                            color: Colors.transparent,
                            child: Card(
                              color: const Color(0xffA77DFE),
                              child: Container(
                                height: 50,
                                width: 100,
                                child: const Center(
                                  child: Text(
                                    'SMELL',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          childWhenDragging: const Card(
                            elevation: 0,
                            child: SizedBox(
                              height: 50,
                              width: 100,
                            ),
                          ),
                          child: Card(
                            clipBehavior: Clip.hardEdge,
                            color: const Color(0xffA77DFE),
                            child: Container(
                              color: Colors.transparent,
                              height: 50,
                              width: 100,
                              child: const Center(
                                child: Text(
                                  'SMELL',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                  isDone['taste']!
                      ? const SizedBox(
                          height: 50,
                          width: 100,
                        )
                      : Draggable<String>(
                          data: "taste",
                          feedback: Material(
                            color: Colors.transparent,
                            child: Card(
                              color: const Color(0xff3ECEFE),
                              child: Container(
                                height: 50,
                                width: 100,
                                child: const Center(
                                  child: Text(
                                    'TASTE',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          childWhenDragging: const Card(
                            elevation: 0,
                            child: SizedBox(
                              height: 50,
                              width: 100,
                            ),
                          ),
                          child: Card(
                            clipBehavior: Clip.hardEdge,
                            color: const Color(0xff3ECEFE),
                            child: Container(
                              color: Colors.transparent,
                              height: 50,
                              width: 100,
                              child: const Center(
                                child: Text(
                                  'TASTE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                  isDone['hear']!
                      ? const SizedBox(
                          height: 50,
                          width: 100,
                        )
                      : Draggable<String>(
                          data: "hear",
                          feedback: Material(
                            color: Colors.transparent,
                            child: Card(
                              color: const Color(0xff67EB00),
                              child: Container(
                                height: 50,
                                width: 100,
                                child: const Center(
                                  child: Text(
                                    'HEAR',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          childWhenDragging: const Card(
                            elevation: 0,
                            child: SizedBox(
                              height: 50,
                              width: 100,
                            ),
                          ),
                          child: Card(
                            clipBehavior: Clip.hardEdge,
                            color: const Color(0xff67EB00),
                            child: Container(
                              color: Colors.transparent,
                              height: 50,
                              width: 100,
                              child: const Center(
                                child: Text(
                                  'HEAR',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                  isDone['touch']!
                      ? const SizedBox(
                          height: 50,
                          width: 100,
                        )
                      : Draggable<String>(
                          data: "touch",
                          feedback: Material(
                            color: Colors.transparent,
                            child: Card(
                              color: const Color(0xffFF8413),
                              child: Container(
                                height: 50,
                                width: 100,
                                child: const Center(
                                  child: Text(
                                    'TOUCH',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          childWhenDragging: const Card(
                            elevation: 0,
                            child: SizedBox(
                              height: 50,
                              width: 100,
                            ),
                          ),
                          child: Card(
                            clipBehavior: Clip.hardEdge,
                            color: const Color(0xffFF8413),
                            child: Container(
                              color: Colors.transparent,
                              height: 50,
                              width: 100,
                              child: const Center(
                                child: Text(
                                  'TOUCH',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DragTarget(
                    builder: (BuildContext context, List<dynamic> accepted,
                        List<dynamic> rejected) {
                      return Card(
                        color: isDone['sight']!
                            ? Color(0xff67EB00)
                            : targetColors['sight'],
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Assets.images.science.senses.quiz.sight
                              .image(fit: BoxFit.contain),
                        ),
                      );
                    },
                    onWillAcceptWithDetails: (details) =>
                        details.data != '' && isDone['sight'] == false,
                    onAcceptWithDetails: (DragTargetDetails<String> details) {
                      setState(() {
                        acceptedData = details.data;
                        log(acceptedData);
                        if (acceptedData != 'sight') {
                          _audioService.playFromAssets('sounds/wrong.mp3');
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => showMistake(
                                  acceptedData, imagePath['sight']));
                          log('mistakes: $mistakes');
                        } else {
                          _audioService.playFromAssets('sounds/correct.wav');
                          isDone[acceptedData] = true;
                          log("isDone: ${isDone[acceptedData]}");
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => showCorrect(acceptedData));
                          if (answers
                              .every((element) => isDone[element] == true)) {
                            setState(() {
                              isFinished = true;
                            });
                          }
                        }
                      });
                    },
                  ),
                  DragTarget(
                    builder: (BuildContext context, List<dynamic> accepted,
                        List<dynamic> rejected) {
                      return Card(
                        color: isDone['taste']!
                            ? Color(0xff67EB00)
                            : targetColors['taste'],
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Assets.images.science.senses.quiz.taste
                              .image(fit: BoxFit.contain),
                        ),
                      );
                    },
                    onWillAcceptWithDetails: (details) =>
                        details.data != '' && isDone['taste'] == false,
                    onAcceptWithDetails: (DragTargetDetails<String> details) {
                      setState(() {
                        acceptedData = details.data;
                        log(acceptedData);
                        if (acceptedData != 'taste') {
                          _audioService.playFromAssets('sounds/wrong.mp3');
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => showMistake(
                                  acceptedData, imagePath['taste']));
                          log('mistakes: $mistakes');
                        } else {
                          _audioService.playFromAssets('sounds/correct.wav');
                          isDone[acceptedData] = true;
                          log("isDone: ${isDone[acceptedData]}");
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => showCorrect(acceptedData));
                          if (answers
                              .every((element) => isDone[element] == true)) {
                            setState(() {
                              isFinished = true;
                            });
                          }
                        }
                      });
                    },
                  ),
                  DragTarget(
                    builder: (BuildContext context, List<dynamic> accepted,
                        List<dynamic> rejected) {
                      return Card(
                        color: isDone['hear']!
                            ? Color(0xff67EB00)
                            : targetColors['hear'],
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Assets.images.science.senses.quiz.hear
                              .image(fit: BoxFit.contain),
                        ),
                      );
                    },
                    onWillAcceptWithDetails: (details) =>
                        details.data != '' && isDone['hear'] == false,
                    onAcceptWithDetails: (DragTargetDetails<String> details) {
                      setState(() {
                        acceptedData = details.data;
                        log(acceptedData);
                        if (acceptedData != 'hear') {
                          _audioService.playFromAssets('sounds/wrong.mp3');
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) =>
                                  showMistake(acceptedData, imagePath['hear']));
                          log('mistakes: $mistakes');
                        } else {
                          _audioService.playFromAssets('sounds/correct.wav');
                          isDone[acceptedData] = true;
                          log("isDone: ${isDone[acceptedData]}");
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => showCorrect(acceptedData));
                        }
                      });
                    },
                  ),
                  DragTarget(
                    builder: (BuildContext context, List<dynamic> accepted,
                        List<dynamic> rejected) {
                      return Card(
                        color: isDone['touch']!
                            ? Color(0xff67EB00)
                            : targetColors['touch'],
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Assets.images.science.senses.quiz.touch
                              .image(fit: BoxFit.contain),
                        ),
                      );
                    },
                    onWillAcceptWithDetails: (details) =>
                        details.data != '' && isDone['touch'] == false,
                    onAcceptWithDetails: (DragTargetDetails<String> details) {
                      setState(() {
                        acceptedData = details.data;
                        log(acceptedData);
                        if (acceptedData != 'touch') {
                          _audioService.playFromAssets('sounds/wrong.mp3');
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => showMistake(
                                  acceptedData, imagePath['touch']));
                          log('mistakes: $mistakes');
                        } else {
                          _audioService.playFromAssets('sounds/correct.wav');
                          isDone[acceptedData] = true;
                          log("isDone: ${isDone[acceptedData]}");
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => showCorrect(acceptedData));
                          if (answers
                              .every((element) => isDone[element] == true)) {
                            setState(() {
                              isFinished = true;
                            });
                          }
                        }
                      });
                    },
                  ),
                  DragTarget(
                    builder: (BuildContext context, List<dynamic> accepted,
                        List<dynamic> rejected) {
                      return Card(
                        color: isDone['smell']!
                            ? Color(0xff67EB00)
                            : targetColors['smell'],
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Assets.images.science.senses.quiz.smell
                              .image(fit: BoxFit.contain),
                        ),
                      );
                    },
                    onWillAcceptWithDetails: (details) =>
                        details.data != '' && isDone['smell'] == false,
                    onAcceptWithDetails: (DragTargetDetails<String> details) {
                      setState(() {
                        acceptedData = details.data;
                        log(acceptedData);
                        if (acceptedData != 'smell') {
                          _audioService.playFromAssets('sounds/wrong.mp3');
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => showMistake(
                                  acceptedData, imagePath['smell']));
                          log('mistakes: $mistakes');
                        } else {
                          _audioService.playFromAssets('sounds/correct.wav');
                          isDone[acceptedData] = true;
                          log("isDone: ${isDone[acceptedData]}");
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => showCorrect(acceptedData));
                          if (answers
                              .every((element) => isDone[element] == true)) {
                            setState(() {
                              isFinished = true;
                            });
                          }
                        }
                      });
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Dialog showMistake(item, imagePath) {
    const size = 80.0;
    mistakes++;
    log('mistakes: $mistakes');
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pop();
    });
    return Dialog(
      backgroundColor: Colors.redAccent,
      child: LayoutBuilder(builder: (context, constraints) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          color: const Color(0xffEC9B5E),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Oops!",
                  style: TextStyle(
                    color: const Color(0xff7B3309),
                    fontSize: constraints.maxWidth * 0.08,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sense of ${item} is not the right sense for this image. Try again!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: constraints.maxWidth * 0.06,
                  ),
                ),
                Image.asset(imagePath, height: size),
              ],
            ),
          ),
        );
      }),
    );
  }

  Dialog showCorrect(item) {
    const size = 80.0;
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pop();
      if (answers.every((element) => isDone[element] == true)) {
        setState(() {
          isFinished = true;
        });
      }
    });
    return Dialog(
      backgroundColor: Colors.greenAccent,
      child: LayoutBuilder(builder: (context, constraints) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          color: const Color(0xffEC9B5E),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Great!",
                  style: TextStyle(
                    color: const Color(0xff7B3309),
                    fontSize: constraints.maxWidth * 0.08,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sense of ${item} is the right sense for this image! Good job!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: constraints.maxWidth * 0.06,
                  ),
                ),
                Image.asset(imagePath[item]!, height: size),
              ],
            ),
          ),
        );
      }),
    );
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

  Widget buildResultsScreen() {
    final percentage = calculateScore();

    final highScore = prefs.getInt('senses_high_score') ?? 0;

    if (percentage > highScore) {
      prefs.setInt('senses_high_score', percentage);
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
