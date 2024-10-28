import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/audio_service.dart';
import 'package:flutter_application_1/components/finish_module_dialog.dart';
import 'package:flutter_application_1/components/utils/nice_button.dart';
import 'package:flutter_application_1/components/shape_card.dart';
import 'package:flutter_application_1/models/all_aboard/shape.dart';
import 'package:flutter_application_1/screens/learning/all_aboard/shapes_quiz.dart';
import 'package:gap/gap.dart';

class ShapesScreen extends StatefulWidget {
  const ShapesScreen({super.key});

  @override
  State<ShapesScreen> createState() => _ShapesScreenState();
}

class _ShapesScreenState extends State<ShapesScreen> {
  final AudioService _audioService = AudioService();
  int _currentIndex = 0;
  final CarouselSliderController _carCon = CarouselSliderController();

  final List<Shape> shapes = [
    Shape(
      label: 'Circle',
      imagePath: 'assets/images/circle.png',
      soundPath: 'sounds/shapes/circle.m4a',
    ),
    Shape(
      label: 'Square',
      imagePath: 'assets/images/square.png',
      soundPath: 'sounds/shapes/square.m4a',
    ),
    Shape(
      label: 'Triangle',
      imagePath: 'assets/images/triangle.png',
      soundPath: 'sounds/shapes/triangle.m4a',
    ),
    Shape(
      label: 'Star',
      imagePath: 'assets/images/star.png',
      soundPath: 'sounds/shapes/star.m4a',
    ),
    Shape(
      label: 'Rectangle',
      imagePath: 'assets/images/rectangle.png',
      soundPath: 'sounds/shapes/rectangle.m4a',
    ),
    Shape(
      label: 'Oval',
      imagePath: 'assets/images/oval.png',
      soundPath: 'sounds/shapes/oval.m4a',
    ),
  ];

  @override
  void initState() {
    super.initState();
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
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const FinishModuleDialog(
          route: ShapesQuizScreen(),
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
                child: NiceButton(
                  label: "Back",
                  color: Colors.yellow,
                  shadowColor: Colors.yellow[800]!,
                  icon: Icons.close,
                  iconSize: 30,
                  method: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                child: CarouselSlider.builder(
                  carouselController: _carCon,
                  options: CarouselOptions(
                    height: 400,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    initialPage: 0,
                    autoPlay: false,
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                        _stop();
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
