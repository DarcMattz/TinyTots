import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/utils/nice_button.dart';
import 'package:flutter_application_1/components/modules.dart';
import 'package:flutter_application_1/screens/learning/all_aboard.dart';
import 'package:flutter_application_1/screens/learning/filipino/filipino.dart';
import 'package:flutter_application_1/screens/learning/mathematics/mathematics.dart';
import 'package:flutter_application_1/screens/learning/phonics.dart';
import 'package:flutter_application_1/screens/learning/science.dart';

class LearningListScreen extends StatefulWidget {
  const LearningListScreen({super.key});

  @override
  State<LearningListScreen> createState() => _LearningListScreenState();
}

class _LearningListScreenState extends State<LearningListScreen> {
  int _currentIndex = 0;

  final List<Module> modules = [
    Module(
        type: "learning",
        imagePath: 'assets/images/all_aboard.png',
        route: const AllAboardScreen()),
    Module(
        type: "learning",
        imagePath: 'assets/images/phonics.png',
        route: const PhonicsScreen()),
    Module(
        type: "learning",
        imagePath: 'assets/images/science_and_health.png',
        route: const ScienceHealthScreen()),
    Module(
        type: "learning",
        imagePath: 'assets/images/mathematics/mathematics.png',
        route: const MathematicsScreen()),
    Module(
        type: "learning",
        imagePath: 'assets/images/filipino/filipino.png',
        route: const FilipinoScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.lightBlueAccent,
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
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
                        height: 320,
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
                      itemCount: modules.length,
                      itemBuilder: (context, index, realIndex) {
                        return ModuleCard(module: modules[index]);
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(modules.length, (index) {
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
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, right: 30),
                    child: Image.asset(
                      'assets/images/panda.png',
                      width: 200,
                      height: 200,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
