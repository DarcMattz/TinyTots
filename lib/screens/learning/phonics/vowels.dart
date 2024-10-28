import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/audio_service.dart';
import 'package:flutter_application_1/components/finish_module_dialog.dart';
import 'package:flutter_application_1/components/utils/nice_button.dart';
import 'package:flutter_application_1/components/phonics/vowel_card.dart';
import 'package:flutter_application_1/models/vowels/vowel.dart';
import 'package:flutter_application_1/screens/learning/phonics/vowels_quiz.dart';
import 'package:gap/gap.dart';

class VowelsScreen extends StatefulWidget {
  const VowelsScreen({super.key});

  @override
  State<VowelsScreen> createState() => _VowelsScreenState();
}

class _VowelsScreenState extends State<VowelsScreen> {
  final AudioService _audioService = AudioService();
  final CarouselSliderController _mainCarCon = CarouselSliderController();
  int colCurIndex = 0;

  final List<List<Vowel>> vowels = [
    [
      Vowel(
        vowel: 'Fa',
        imagePath: 'assets/images/vowels/fan.png',
        imageName: 'Fan',
        soundPath: 'sounds/vowels/fafan.m4a',
      ),
      Vowel(
        vowel: 'Ca',
        imagePath: 'assets/images/vowels/cat.png',
        imageName: 'Cat',
        soundPath: 'sounds/vowels/cacat.m4a',
      ),
      Vowel(
        vowel: 'La',
        imagePath: 'assets/images/vowels/lamp.png',
        imageName: 'Lamp',
        soundPath: 'sounds/vowels/lalamp.m4a',
      ),
      Vowel(
        vowel: 'Ma',
        imagePath: 'assets/images/vowels/mat.png',
        imageName: 'Mat',
        soundPath: 'sounds/vowels/mamat.m4a',
      ),
      Vowel(
        vowel: 'Va',
        imagePath: 'assets/images/vowels/van.png',
        imageName: 'Van',
        soundPath: 'sounds/vowels/vavan.m4a',
      ),
    ],
    [
      Vowel(
        vowel: 'Be',
        imagePath: 'assets/images/vowels/bed.png',
        imageName: 'Bed',
        soundPath: 'sounds/vowels/bebed.m4a',
      ),
      Vowel(
        vowel: 'He',
        imagePath: 'assets/images/vowels/hen.png',
        imageName: 'Hen',
        soundPath: 'sounds/vowels/hehen.m4a',
      ),
      Vowel(
        vowel: 'Pe',
        imagePath: 'assets/images/vowels/pen.png',
        imageName: 'Pen',
        soundPath: 'sounds/vowels/pepen.m4a',
      ),
      Vowel(
        vowel: 'Ne',
        imagePath: 'assets/images/vowels/net.png',
        imageName: 'Net',
        soundPath: 'sounds/vowels/nenet.m4a',
      ),
      Vowel(
        vowel: 'We',
        imagePath: 'assets/images/vowels/web.png',
        imageName: 'Web',
        soundPath: 'sounds/vowels/weweb.m4a',
      ),
    ],
    [
      Vowel(
        vowel: 'Fi',
        imagePath: 'assets/images/vowels/fish.png',
        imageName: 'Fish',
        soundPath: 'sounds/vowels/fifish.m4a',
      ),
      Vowel(
        vowel: 'Bi',
        imagePath: 'assets/images/vowels/bib.png',
        imageName: 'Bib',
        soundPath: 'sounds/vowels/bibib.m4a',
      ),
      Vowel(
        vowel: 'Gi',
        imagePath: 'assets/images/vowels/gift.png',
        imageName: 'Gift',
        soundPath: 'sounds/vowels/gigift.m4a',
      ),
      Vowel(
        vowel: 'Pi',
        imagePath: 'assets/images/vowels/pig.png',
        imageName: 'Pig',
        soundPath: 'sounds/vowels/pipig.m4a',
      ),
      Vowel(
        vowel: 'Ri',
        imagePath: 'assets/images/vowels/ring.png',
        imageName: 'Ring',
        soundPath: 'sounds/vowels/riring.m4a',
      ),
    ],
    [
      Vowel(
        vowel: 'Co',
        imagePath: 'assets/images/vowels/cot.png',
        imageName: 'Cot',
        soundPath: 'sounds/vowels/cocot.m4a',
      ),
      Vowel(
        vowel: 'Do',
        imagePath: 'assets/images/vowels/dog.png',
        imageName: 'Dog',
        soundPath: 'sounds/vowels/dodog.m4a',
      ),
      Vowel(
        vowel: 'Ho',
        imagePath: 'assets/images/vowels/hog.png',
        imageName: 'Hog',
        soundPath: 'sounds/vowels/hohog.m4a',
      ),
      Vowel(
        vowel: 'Po',
        imagePath: 'assets/images/vowels/pot.png',
        imageName: 'Pot',
        soundPath: 'sounds/vowels/popot.m4a',
      ),
      Vowel(
        vowel: 'To',
        imagePath: 'assets/images/vowels/top.png',
        imageName: 'Top',
        soundPath: 'sounds/vowels/totop.m4a',
      ),
    ],
    [
      Vowel(
        vowel: 'Bu',
        imagePath: 'assets/images/vowels/bus.png',
        imageName: 'Bus',
        soundPath: 'sounds/vowels/bubus.m4a',
      ),
      Vowel(
        vowel: 'Gu',
        imagePath: 'assets/images/vowels/gum.png',
        imageName: 'Gum',
        soundPath: 'sounds/vowels/gugum.m4a',
      ),
      Vowel(
        vowel: 'Hu',
        imagePath: 'assets/images/vowels/hut.png',
        imageName: 'Hut',
        soundPath: 'sounds/vowels/huhut.m4a',
      ),
      Vowel(
        vowel: 'Nu',
        imagePath: 'assets/images/vowels/nut.png',
        imageName: 'Nut',
        soundPath: 'sounds/vowels/nunut.m4a',
      ),
      Vowel(
        vowel: 'Su',
        imagePath: 'assets/images/vowels/sun.png',
        imageName: 'Sun',
        soundPath: 'sounds/vowels/susun.m4a',
      ),
    ],
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
                  icon: Icons.arrow_back,
                  iconSize: 25,
                  method: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                child: CarouselSlider.builder(
                  carouselController: _mainCarCon,
                  itemCount: vowels.length,
                  options: CarouselOptions(
                    scrollDirection: Axis.vertical,
                    height: 500,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    initialPage: 0,
                    autoPlay: false,
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      colCurIndex = index;
                      _stop();
                    },
                  ),
                  itemBuilder: (context, index, realIndex) {
                    final CarouselSliderController childCarCon =
                        CarouselSliderController();
                    int rowCurIndex = 0;

                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                vowels[colCurIndex][index].imageName,
                                textAlign: TextAlign.center,
                              ),
                            );
                          },
                        );
                      },
                      child: CarouselSlider.builder(
                        carouselController: childCarCon,
                        itemCount: vowels[index].length,
                        options: CarouselOptions(
                          height: 400,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          initialPage: 0,
                          autoPlay: false,
                          viewportFraction: 0.8,
                          onPageChanged: (index, reason) {
                            rowCurIndex = index;
                            _stop();
                          },
                        ),
                        itemBuilder: (context, sampleIndex, sampleRealIndex) {
                          return VowelCard(
                            vowel: vowels[index][sampleIndex],
                            nextCallback: () {
                              if (colCurIndex == vowels.length - 1 &&
                                  rowCurIndex == 4) {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) =>
                                      const FinishModuleDialog(
                                    route: VowelsQuizScreen(),
                                  ),
                                );
                              } else if (rowCurIndex == 4) {
                                _mainCarCon.nextPage();
                                childCarCon.animateToPage(0);
                              } else {
                                childCarCon.nextPage();
                              }
                            },
                            prevCallback: () {
                              if (rowCurIndex == 0) {
                                _mainCarCon.previousPage();
                              } else {
                                childCarCon.previousPage();
                              }
                            },
                            soundCallback: () {
                              _play(vowels[index][sampleIndex].soundPath);
                            },
                          );
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
