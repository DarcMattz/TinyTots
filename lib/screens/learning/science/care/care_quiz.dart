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

class CareQuizScreen extends StatefulWidget {
  const CareQuizScreen({super.key});

  @override
  State<CareQuizScreen> createState() => _CareQuizScreenState();
}

class _CareQuizScreenState extends State<CareQuizScreen> {
  final ConfettiController _leftController =
      ConfettiController(duration: const Duration(milliseconds: 1000));
  final ConfettiController _rightController =
      ConfettiController(duration: const Duration(milliseconds: 1000));
  late ConfettiHelper _confettiHelper;

  String acceptedData = "";
  int mistakes = 0;
  bool isFinished = false;

  Map<String, bool> isDone = {
    "item_1": false,
    "item_2": false,
    "item_3": false,
    "item_4": false,
    "item_5": false,
    "item_6": false,
    "item_7": false,
    "item_8": false,
  };

  List<String> answers = ['item_1', 'item_2', 'item_3', 'item_4', 'item_5'];

  Map<String, String> items = {
    "item_1": Assets.images.science.care.quiz.item1.path,
    "item_2": Assets.images.science.care.quiz.item2.path,
    "item_3": Assets.images.science.care.quiz.item3.path,
    "item_4": Assets.images.science.care.quiz.item4.path,
    "item_5": Assets.images.science.care.quiz.item5.path,
    "item_6": Assets.images.science.care.quiz.item6.path,
    "item_7": Assets.images.science.care.quiz.item7.path,
    "item_8": Assets.images.science.care.quiz.item8.path
  };

  @override
  void initState() {
    super.initState();
    List<MapEntry<String, String>> entries = items.entries.toList();
    entries.shuffle();
    Map<String, String> shuffledItems = Map.fromEntries(entries);
    items = shuffledItems;
    _confettiHelper = ConfettiHelper(_leftController, _rightController);
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
    const size = 80.0;

    return Card(
      elevation: 4,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => showBasket(),
                  );
                },
                child: DragTarget<String>(
                  builder: (BuildContext context, List<dynamic> accepted,
                      List<dynamic> rejected) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: Assets.images.science.care.quiz.basketBack
                              .provider(),
                        ),
                      ),
                      width: constraints.maxWidth,
                      height: constraints.maxHeight * 0.35,
                    );
                  },
                  onWillAcceptWithDetails: (details) => details.data != '',
                  onAcceptWithDetails: (DragTargetDetails<String> details) {
                    setState(() {
                      acceptedData = details.data;
                      log(acceptedData);
                      if (!answers.contains(acceptedData)) {
                        mistakes++;
                        showDialog(
                            context: context,
                            builder: (context) => showMistake(acceptedData));
                        log('mistakes: $mistakes');
                      } else {
                        isDone[acceptedData] = true;
                        log("isDone: ${isDone[acceptedData]}");
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff95E9FF),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.blue, // Border color
                    width: 3.0, // Border width
                  ),
                ),
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.45,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: constraints.maxHeight * 0.03),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: constraints.maxWidth * 0.03,
                    runSpacing: constraints.maxHeight * 0.03,
                    children: List.of(
                      items.entries.map(
                        (entry) => buildDraggableItem(
                            key: entry.key, assetPath: entry.value, size: size),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget buildDraggableItem({
    required String key,
    required String assetPath,
    required double size,
  }) {
    return isDone[key]!
        ? SizedBox(height: size, width: size)
        : Draggable<String>(
            data: key,
            feedback: SizedBox(
              height: size,
              width: size,
              child: Image.asset(assetPath),
            ),
            childWhenDragging: SizedBox(height: size, width: size),
            child: SizedBox(
              height: size,
              width: size,
              child: Center(child: Image.asset(assetPath)),
            ),
          );
  }

  Dialog showMistake(item) {
    const size = 80.0;
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
                    color: Color(0xff7B3309),
                    fontSize: constraints.maxWidth * 0.08,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "This item cannot help you take care of yourself. Try again!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: constraints.maxWidth * 0.06,
                  ),
                ),
                Image.asset(items[item]!, height: size),
              ],
            ),
          ),
        );
      }),
    );
  }

  Dialog showBasket() {
    const size = 80.0;
    return Dialog(
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
                  "Basket",
                  style: TextStyle(
                    color: Color(0xff7B3309),
                    fontSize: constraints.maxWidth * 0.08,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (isDone.values.every((value) => !value))
                  const Text(
                    "The basket is empty!",
                    style: TextStyle(color: Colors.white),
                  ),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: constraints.maxWidth * 0.05,
                  children: List.of(
                    isDone.entries.map((entry) {
                      if (entry.value) {
                        return Image.asset(items[entry.key]!, height: size);
                      }
                      return Container();
                    }),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget buildResultsScreen() {
    final percentage = calculateScore();

    final highScore = prefs.getInt('care_high_score') ?? 0;

    if (percentage > highScore) {
      prefs.setInt('care_high_score', percentage);
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
