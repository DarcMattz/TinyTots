import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/helper/audio_service.dart';
import 'package:tinytots/components/mathematics/number_card.dart';
import 'package:tinytots/components/mathematics/number_with_example_card.dart';
import 'package:tinytots/models/mathematics/number_example.dart';
import 'package:tinytots/models/mathematics/number_only.dart';
import 'package:gap/gap.dart';
import '../../../components/utils/nice_button.dart';

class NumbersScreen extends StatefulWidget {
  const NumbersScreen({super.key});

  @override
  State<NumbersScreen> createState() => _NumbersScreenState();
}

class _NumbersScreenState extends State<NumbersScreen> {
  final AudioService _audioService = AudioService();
  final CarouselSliderController _parentCarCon = CarouselSliderController();

  final List<List> number = [
    [
      NumberExample(
        numberImage: Assets.images.mathematics.numbers.a1.path,
        numberExample: Assets.images.mathematics.sample.a1Example.path,
        numberSound: "sounds/mathematics/1.m4a",
        numberSampleSound: "sounds/mathematics/1_sample.m4a",
      ),
      NumberOnly(numberImage: Assets.images.mathematics.guides.trace1.path),
    ],
    [
      NumberExample(
        numberImage: Assets.images.mathematics.numbers.a2.path,
        numberExample: Assets.images.mathematics.sample.a2Example.path,
        numberSound: 'sounds/mathematics/2.m4a',
        numberSampleSound: 'sounds/mathematics/2_sample.m4a',
      ),
      NumberOnly(numberImage: Assets.images.mathematics.guides.trace2.path),
    ],
    [
      NumberExample(
        numberImage: Assets.images.mathematics.numbers.a3.path,
        numberExample: Assets.images.mathematics.sample.a3Example.path,
        numberSound: 'sounds/mathematics/3.m4a',
        numberSampleSound: 'sounds/mathematics/3_sample.m4a',
      ),
      NumberOnly(numberImage: Assets.images.mathematics.guides.trace3.path),
    ],
    [
      NumberExample(
        numberImage: Assets.images.mathematics.numbers.a4.path,
        numberExample: Assets.images.mathematics.sample.a4Example.path,
        numberSound: 'sounds/mathematics/4.m4a',
        numberSampleSound: 'sounds/mathematics/4_sample.m4a',
      ),
      NumberOnly(numberImage: Assets.images.mathematics.guides.trace4.path),
    ],
    [
      NumberExample(
        numberImage: Assets.images.mathematics.numbers.a5.path,
        numberExample: Assets.images.mathematics.sample.a5Example.path,
        numberSound: 'sounds/mathematics/5.m4a',
        numberSampleSound: 'sounds/mathematics/5_sample.m4a',
      ),
      NumberOnly(numberImage: Assets.images.mathematics.guides.trace5.path),
    ],
    [
      NumberExample(
        numberImage: Assets.images.mathematics.numbers.a6.path,
        numberExample: Assets.images.mathematics.sample.a6Example.path,
        numberSound: 'sounds/mathematics/6.m4a',
        numberSampleSound: 'sounds/mathematics/6_sample.m4a',
      ),
      NumberOnly(numberImage: Assets.images.mathematics.guides.trace6.path),
    ],
    [
      NumberExample(
        numberImage: Assets.images.mathematics.numbers.a7.path,
        numberExample: Assets.images.mathematics.sample.a7Example.path,
        numberSound: 'sounds/mathematics/7.m4a',
        numberSampleSound: 'sounds/mathematics/7_sample.m4a',
      ),
      NumberOnly(numberImage: Assets.images.mathematics.guides.trace7.path),
    ],
    [
      NumberExample(
        numberImage: Assets.images.mathematics.numbers.a8.path,
        numberExample: Assets.images.mathematics.sample.a8Example.path,
        numberSound: 'sounds/mathematics/8.m4a',
        numberSampleSound: 'sounds/mathematics/8_sample.m4a',
      ),
      NumberOnly(numberImage: Assets.images.mathematics.guides.trace8.path),
    ],
    [
      NumberExample(
        numberImage: Assets.images.mathematics.numbers.a9.path,
        numberExample: Assets.images.mathematics.sample.a9Example.path,
        numberSound: 'sounds/mathematics/9.m4a',
        numberSampleSound: 'sounds/mathematics/9_sample.m4a',
      ),
      NumberOnly(numberImage: Assets.images.mathematics.guides.trace9.path),
    ],
    [
      NumberExample(
        numberImage: Assets.images.mathematics.numbers.a10.path,
        numberExample: Assets.images.mathematics.sample.a10Example.path,
        numberSound: 'sounds/mathematics/10.m4a',
        numberSampleSound: 'sounds/mathematics/10_sample.m4a',
      ),
      NumberOnly(numberImage: Assets.images.mathematics.guides.trace10.path),
    ],
    [
      NumberOnly(
        numberImage: Assets.images.mathematics.numbers.a11.path,
        numberSound: 'sounds/mathematics/11.m4a',
      ),
      NumberOnly(
        numberImage: Assets.images.mathematics.numbers.a12.path,
        numberSound: 'sounds/mathematics/12.m4a',
      ),
      NumberOnly(
        numberImage: Assets.images.mathematics.numbers.a13.path,
        numberSound: 'sounds/mathematics/13.m4a',
      ),
      NumberOnly(
        numberImage: Assets.images.mathematics.numbers.a14.path,
        numberSound: 'sounds/mathematics/14.m4a',
      ),
      NumberOnly(
        numberImage: Assets.images.mathematics.numbers.a15.path,
        numberSound: 'sounds/mathematics/15.m4a',
      ),
      NumberOnly(
        numberImage: Assets.images.mathematics.numbers.a16.path,
        numberSound: 'sounds/mathematics/16.m4a',
      ),
      NumberOnly(
        numberImage: Assets.images.mathematics.numbers.a17.path,
        numberSound: 'sounds/mathematics/17.m4a',
      ),
      NumberOnly(
        numberImage: Assets.images.mathematics.numbers.a18.path,
        numberSound: 'sounds/mathematics/18.m4a',
      ),
      NumberOnly(
        numberImage: Assets.images.mathematics.numbers.a19.path,
        numberSound: 'sounds/mathematics/19.m4a',
      ),
      NumberOnly(
        numberImage: Assets.images.mathematics.numbers.a20.path,
        numberSound: 'sounds/mathematics/20.m4a',
      ),
    ],
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }

  void _playOneSound(numberSound) async {
    await _audioService.playFromAssets(numberSound);
  }

  void _playTwoSounds(numberSound, numberSampleSound) async {
    await _audioService.playFromAssets(numberSound);

    _audioService.setOnComplete(() async {
      await _audioService.playFromAssets(numberSampleSound);

      _audioService.setOnComplete(() async {
        _audioService.stop();
      });
    });

    print(numberSound);
  }

  void _stop() async {
    await _audioService.stop();
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
                  carouselController: _parentCarCon,
                  itemCount: number.length,
                  options: CarouselOptions(
                      scrollDirection: Axis.vertical,
                      height: 500,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      initialPage: 0,
                      autoPlay: false,
                      viewportFraction: 0.8,
                      onPageChanged: (index, reason) {
                        _stop();
                      }),
                  itemBuilder: (context, colIndex, realIndex) {
                    final CarouselSliderController childCarCon =
                        CarouselSliderController();

                    return GestureDetector(
                      onTap: () {},
                      child: CarouselSlider.builder(
                        carouselController: childCarCon,
                        itemCount: number[colIndex].length,
                        options: CarouselOptions(
                            height: 400,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            initialPage: 0,
                            autoPlay: false,
                            viewportFraction: 0.8,
                            onPageChanged: (index, reason) {
                              _stop();
                            }),
                        itemBuilder: (context, rowIndex, cardRealIndex) {
                          if (colIndex <= 9 && rowIndex == 0) {
                            return NumberWithExampleCard(
                              number: number[colIndex][rowIndex],
                              colCurIndex: colIndex,
                              rowCurIndex: rowIndex,
                              parentCarCon: _parentCarCon,
                              childCarCon: childCarCon,
                              sound: () {
                                _playTwoSounds(
                                    number[colIndex][rowIndex].numberSound,
                                    number[colIndex][rowIndex]
                                        .numberSampleSound);
                              },
                            );
                          } else if (colIndex <= 9 && rowIndex > 0) {
                            return NumberCard(
                              number: number[colIndex][rowIndex],
                              withSound: false,
                              sound: () {},
                              colCurIndex: colIndex,
                              rowCurIndex: rowIndex,
                              parentCarCon: _parentCarCon,
                              childCarCon: childCarCon,
                            );
                          } else {
                            return NumberCard(
                              number: number[colIndex][rowIndex],
                              withSound: true,
                              sound: () {
                                _playOneSound(
                                    number[colIndex][rowIndex].numberSound);
                              },
                              colCurIndex: colIndex,
                              rowCurIndex: rowIndex,
                              parentCarCon: _parentCarCon,
                              childCarCon: childCarCon,
                            );
                          }
                        },
                      ),
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
