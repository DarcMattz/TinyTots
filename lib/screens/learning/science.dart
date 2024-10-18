import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/building.dart';
import 'package:flutter_application_1/components/utils/nice_button.dart';
import 'package:flutter_application_1/screens/learning/science/body_quiz.dart';
import 'package:flutter_application_1/screens/learning/science/body_start.dart';
import 'package:flutter_application_1/screens/learning/science/care_quiz.dart';
import 'package:flutter_application_1/screens/learning/science/care_start.dart';
import 'package:flutter_application_1/screens/learning/science/senses_quiz.dart';
import 'package:flutter_application_1/screens/learning/science/senses_start.dart';

class ScienceHealthScreen extends StatefulWidget {
  const ScienceHealthScreen({super.key});

  @override
  State<ScienceHealthScreen> createState() => _ScienceHealthScreenState();
}

class _ScienceHealthScreenState extends State<ScienceHealthScreen> {
  int _currentIndex = 0;

  final List<Building> buildings = [
    const Building(
        module: "science",
        imagePath: 'assets/images/body.png',
        route: BodyStartScreen()),
    const Building(
        module: "science",
        imagePath: 'assets/images/quiz_lock.png',
        route: BodyQuizScreen()),
    const Building(
        module: "science",
        imagePath: 'assets/images/senses.png',
        route: SensesStartScreen()),
    const Building(
        module: "science ",
        imagePath: 'assets/images/quiz.png',
        route: SensesQuizScreen()),
    const Building(
        module: "science",
        imagePath: 'assets/images/care.png',
        route: CareStartScreen()),
    const Building(
        module: "science",
        imagePath: 'assets/images/quiz.png',
        route: CareQuizScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.lightBlueAccent,
          image: DecorationImage(
            image: AssetImage('assets/images/background_road.png'),
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 290,
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
                      itemCount: buildings.length,
                      itemBuilder: (context, index, realIndex) {
                        return buildings[index];
                      },
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(buildings.length, (index) {
                          return GestureDetector(
                            child: Container(
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
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
