import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/audio_service.dart';
import 'package:flutter_application_1/components/mathematics/add_subtract_card.dart';
import 'package:flutter_application_1/models/mathematics/number_only.dart';
import 'package:gap/gap.dart';
import '../../../components/utils/nice_button.dart';

class AddSubtractScreen extends StatefulWidget {
  const AddSubtractScreen({super.key});

  @override
  State<AddSubtractScreen> createState() => _AddSubtractScreenState();
}

class _AddSubtractScreenState extends State<AddSubtractScreen> {
  final AudioService _audioService = AudioService();

  @override
  void initState() {
    super.initState();
    _play("sounds/mathematics/1st_step.m4a");
  }

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }

  void _play(numberSound) {
    _audioService.playFromAssets(numberSound);
  }

  void _stop() async {
    _audioService.stop();
  }

  int _currentIndex = 0;
  final CarouselSliderController _carCon = CarouselSliderController();

  final List<NumberOnly> _numbers = [
    NumberOnly(
        numberImage: 'assets/images/mathematics/lesson_3-1.png',
        numberSound: "sounds/mathematics/1st_step.m4a"),
    NumberOnly(
        numberImage: 'assets/images/mathematics/lesson_3-2.png',
        numberSound: "sounds/mathematics/2nd_step.m4a"),
    NumberOnly(
        numberImage: 'assets/images/mathematics/lesson_3-3.png',
        numberSound: "sounds/mathematics/3rd_step.m4a"),
    NumberOnly(
        numberImage: 'assets/images/mathematics/lesson_3-4.png',
        numberSound: "sounds/mathematics/4th_step.m4a"),
    NumberOnly(
        numberImage: 'assets/images/mathematics/lesson_3-5.png',
        numberSound: "sounds/mathematics/5th_step.m4a"),
  ];

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CarouselSlider.builder(
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
                          });

                          _stop();

                          _play(_numbers[index].numberSound);
                        },
                      ),
                      itemCount: _numbers.length,
                      itemBuilder: (context, index, realIndex) {
                        return NumbersLessonThreeCard(
                          number: _numbers[index],
                          currentIndex: index,
                          totalNumbers: _numbers.length,
                          carCon: _carCon,
                        );
                      },
                    ),
                    const Gap(30),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(_numbers.length, (index) {
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
