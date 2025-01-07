import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tinytots/components/push_replacement.dart';
import 'package:tinytots/components/utils/nice_button.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/globals.dart';
import 'package:tinytots/helper/audio_service.dart';
import 'package:tinytots/components/mathematics/add_subtract_card.dart';
import 'package:tinytots/models/mathematics/number_only.dart';
import 'package:gap/gap.dart';
import 'package:tinytots/screens/learning/mathematics/mathematics.dart';

class AddSubtractScreen extends StatefulWidget {
  const AddSubtractScreen({super.key});

  @override
  State<AddSubtractScreen> createState() => _AddSubtractScreenState();
}

class _AddSubtractScreenState extends State<AddSubtractScreen> {
  final AudioService _audioService = AudioService();
  int? _currentIndex = prefs.getInt('add_subtract_current_index') ?? 0;

  final CarouselSliderController _carCon = CarouselSliderController();

  final List<NumberOnly> _numbers = [
    NumberOnly(
        numberImage: Assets.images.mathematics.lesson3.lesson31.path,
        numberSound: "sounds/mathematics/1st_step.m4a"),
    NumberOnly(
        numberImage: Assets.images.mathematics.lesson3.lesson32.path,
        numberSound: "sounds/mathematics/2nd_step.m4a"),
    NumberOnly(
        numberImage: Assets.images.mathematics.lesson3.lesson33.path,
        numberSound: "sounds/mathematics/3rd_step.m4a"),
    NumberOnly(
        numberImage: Assets.images.mathematics.lesson3.lesson34.path,
        numberSound: "sounds/mathematics/4th_step.m4a"),
    NumberOnly(
        numberImage: Assets.images.mathematics.lesson3.lesson35.path,
        numberSound: "sounds/mathematics/5th_step.m4a"),
  ];

  @override
  void initState() {
    super.initState();
    _play("sounds/mathematics/1st_step.m4a");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _carCon.jumpToPage(_currentIndex!);
    });
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
                    type: PageTransitionType.scale,
                    alignment: Alignment.center,
                    child: const MathematicsScreen(),
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
                            child: const MathematicsScreen(),
                          ),
                        );
                      }
                    },
                  ),
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

                          prefs.setInt('add_subtract_current_index', index);
                          if (index == 4) {
                            prefs.setBool("add_subtract_quiz_unlocked", true);
                          }
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
