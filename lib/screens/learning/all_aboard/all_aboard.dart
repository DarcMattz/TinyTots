import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/modules.dart';
import 'package:flutter_application_1/components/utils/nice_button.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_application_1/globals.dart';
import 'package:flutter_application_1/screens/learning/all_aboard/abc_quiz_start.dart';
import 'package:flutter_application_1/screens/learning/all_aboard/abc_start.dart';
import 'package:flutter_application_1/screens/learning/all_aboard/shapes_quiz_start.dart';
import 'package:flutter_application_1/screens/learning/all_aboard/shapes_start.dart';

class AllAboardScreen extends StatefulWidget {
  const AllAboardScreen({super.key});

  @override
  State<AllAboardScreen> createState() => _AllAboardScreenState();
}

class _AllAboardScreenState extends State<AllAboardScreen> {
  int _currentIndex = 0;
  final int _shapesScore = prefs.getInt('shapes_high_score') ?? 0;
  final int _alphabetScore = prefs.getInt('alphabets_high_score') ?? 0;
  final bool _isShapesFinished = prefs.getBool('shapes_quiz_unlocked') ?? false;
  final bool _isAlphabetFinished =
      prefs.getBool('alphabets_quiz_unlocked') ?? false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Module> allAboard = [
      Module(
        type: "lesson",
        imagePath: Assets.images.allAboard.shapesPic.path,
        score: _shapesScore,
        route: const ShapesStartScreen(),
      ),
      Module(
        type: "quiz",
        imagePath: Assets.images.quizPic.path,
        isQuiz: true,
        isFinished: _isShapesFinished,
        score: _shapesScore,
        route: const ShapesQuizStart(),
      ),
      Module(
        type: "lesson",
        imagePath: Assets.images.allAboard.alphabetPic.path,
        route: const AbcStartScreen(),
      ),
      Module(
        type: "quiz",
        imagePath: Assets.images.quizPic.path,
        isQuiz: true,
        isFinished: _isAlphabetFinished,
        score: _alphabetScore,
        route: const AbcQuizStart(),
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
                          itemCount: allAboard.length,
                          itemBuilder: (context, index, realIndex) {
                            return ModuleCard(module: allAboard[index]);
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(allAboard.length, (index) {
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
