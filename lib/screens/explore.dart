import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tinytots/components/utils/nice_button.dart';
import 'package:tinytots/components/modules.dart';
import 'package:tinytots/screens/explore/find_shapes.dart';

class ExploreListScreen extends StatefulWidget {
  const ExploreListScreen({super.key});

  @override
  State<ExploreListScreen> createState() => _ExploreListScreenState();
}

class _ExploreListScreenState extends State<ExploreListScreen> {
  int _currentIndex = 0;

  final List<Module> modules = [
    Module(
        type: "explore",
        imagePath: 'assets/images/play.png',
        route: const FindShapes()),
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
