import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tinytots/components/push_replacement.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/globals.dart';
import 'package:tinytots/helper/audio_service.dart';
import 'package:tinytots/dialogs/finish_module_dialog.dart';
import 'package:tinytots/components/utils/nice_button.dart';
import 'package:tinytots/components/shape_card.dart';
import 'package:tinytots/models/all_aboard/shape.dart';
import 'package:tinytots/screens/learning/all_aboard/all_aboard.dart';
import 'package:tinytots/screens/learning/all_aboard/shapes_quiz_start.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class ShapesScreen extends StatefulWidget {
  const ShapesScreen({
    super.key,
  });

  @override
  State<ShapesScreen> createState() => _ShapesScreenState();
}

class _ShapesScreenState extends State<ShapesScreen> {
  final AudioService _audioService = AudioService();
  final CarouselSliderController _carCon = CarouselSliderController();
  int? _currentIndex = prefs.getInt('shapes_current_index');
  // int _currentIndex = 0;

  final List<Shape> shapes = [
    Shape(
      label: 'Circle',
      imagePath: Assets.images.allAboard.shapes.circle.path,
      soundPath: 'sounds/shapes/circle.m4a',
    ),
    Shape(
      label: 'Square',
      imagePath: Assets.images.allAboard.shapes.square.path,
      soundPath: 'sounds/shapes/square.m4a',
    ),
    Shape(
      label: 'Triangle',
      imagePath: Assets.images.allAboard.shapes.triangle.path,
      soundPath: 'sounds/shapes/triangle.m4a',
    ),
    Shape(
      label: 'Star',
      imagePath: Assets.images.allAboard.shapes.star.path,
      soundPath: 'sounds/shapes/star.m4a',
    ),
    Shape(
      label: 'Rectangle',
      imagePath: Assets.images.allAboard.shapes.rectangle.path,
      soundPath: 'sounds/shapes/rectangle.m4a',
    ),
    Shape(
      label: 'Oval',
      imagePath: Assets.images.allAboard.shapes.oval.path,
      soundPath: 'sounds/shapes/oval.m4a',
    ),
  ];

  @override
  void initState() {
    super.initState();
    print(_currentIndex);

    _audioService.setOnComplete(() {});
  }

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }

  void _play(soundPath) async {
    await _audioService.playFromAssets(soundPath);
  }

  void _stop() async {
    await _audioService.stop();
  }

  void _nextCard() {
    if (_currentIndex == shapes.length - 1) {
      prefs.setInt('shapes_current_index', 0);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => FinishModuleDialog(
          route: ShapesQuizStart(),
          oldRoute: AllAboardScreen(),
        ),
      );
    } else {
      _carCon.nextPage();
    }
  }

  void _previousCard() {
    _carCon.previousPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
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
                child: PushReplacement(
                  route: PageTransition(
                    type: PageTransitionType.fade,
                    alignment: Alignment.center,
                    child: AllAboardScreen(),
                  ),
                  child: NiceButton(
                    label: "Back",
                    color: Colors.yellow,
                    shadowColor: Colors.yellow[800]!,
                    icon: Icons.close,
                    iconSize: 30,
                    method: () {
                      if (context.mounted) {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            alignment: Alignment.center,
                            child: const AllAboardScreen(),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                child: CarouselSlider.builder(
                  carouselController: _carCon,
                  options: CarouselOptions(
                    height: 400,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    initialPage: _currentIndex ?? 0,
                    autoPlay: false,
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                        _stop();

                        prefs.setInt('shapes_current_index', index);
                        log(prefs.getInt('shapes_current_index').toString());

                        if (_currentIndex == shapes.length - 1) {
                          prefs.setBool('shapes_quiz_unlocked', true);
                          log("Quiz Unlocked");
                        }
                      });
                    },
                  ),
                  itemCount: shapes.length,
                  itemBuilder: (context, index, realIndex) {
                    return ShapeCard(
                      shape: shapes[index],
                      nextCallback: _nextCard,
                      prevCallback: _previousCard,
                      soundCallback: () => _play(shapes[index].soundPath),
                      isFirst: index == 0 ? true : false,
                    );
                  },
                ),
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 60.0),
                    child: Image.asset(
                      'assets/images/dog.png',
                      height: 170,
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
