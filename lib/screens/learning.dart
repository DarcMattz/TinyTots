import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tinytots/components/utils/nice_button.dart';
import 'package:tinytots/components/modules.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/screens/learning/all_aboard/all_aboard.dart';
import 'package:tinytots/screens/learning/filipino/filipino.dart';
import 'package:tinytots/screens/learning/mathematics/mathematics.dart';
import 'package:tinytots/screens/learning/phonics/phonics.dart';
import 'package:tinytots/screens/learning/science/science.dart';

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
      imagePath: Assets.images.allAboard.allaboardPic.path,
      route: const AllAboardScreen(),
    ),
    Module(
      type: "learning",
      imagePath: Assets.images.phonics.phonicsPic.path,
      route: const PhonicsScreen(),
    ),
    Module(
      type: "learning",
      imagePath: Assets.images.science.sciencePic.path,
      route: const ScienceHealthScreen(),
    ),
    Module(
      type: "learning",
      imagePath: Assets.images.mathematics.mathematicsPic.path,
      route: const MathematicsScreen(),
    ),
    Module(
      type: "learning",
      imagePath: Assets.images.filipino.filipinoPic.path,
      route: const FilipinoScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
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
                        child: Assets.images.gif.raccoon.image(height: 200),
                        // Image.asset(
                        //   'assets/images/panda.png',
                        //   width: 200,
                        //   height: 200,
                        // ),
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
