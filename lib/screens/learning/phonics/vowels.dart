import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tinytots/components/push_replacement.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/globals.dart';
import 'package:tinytots/helper/audio_service.dart';
import 'package:tinytots/dialogs/finish_module_dialog.dart';
import 'package:tinytots/components/utils/nice_button.dart';
import 'package:tinytots/components/phonics/vowel_card.dart';
import 'package:tinytots/models/vowels/vowel.dart';
import 'package:tinytots/screens/learning/phonics/phonics.dart';
import 'package:tinytots/screens/learning/phonics/vowels_quiz.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tinytots/screens/learning/phonics/vowels_quiz_start_two.dart';

class VowelsScreen extends StatefulWidget {
  const VowelsScreen({super.key});

  @override
  State<VowelsScreen> createState() => _VowelsScreenState();
}

class _VowelsScreenState extends State<VowelsScreen> {
  final AudioService _audioService = AudioService();
  final CarouselSliderController _mainCarCon = CarouselSliderController();

  int? colCurIndex = prefs.getInt('vowels_current_column_index') ?? 0;
  int? rowCurIndex = prefs.getInt('vowels_current_row_index') ?? 0;

  final List<List<Vowel>> vowels = [
    [
      Vowel(
        vowel: 'Fa',
        imagePath: Assets.images.phonics.vowels.fan.path,
        imageName: 'Fan',
        soundPath: 'sounds/vowels/fafan.m4a',
      ),
      Vowel(
        vowel: 'Ca',
        imagePath: Assets.images.phonics.vowels.cat.path,
        imageName: 'Cat',
        soundPath: 'sounds/vowels/cacat.m4a',
      ),
      Vowel(
        vowel: 'La',
        imagePath: Assets.images.phonics.vowels.lamp.path,
        imageName: 'Lamp',
        soundPath: 'sounds/vowels/lalamp.m4a',
      ),
      Vowel(
        vowel: 'Ma',
        imagePath: Assets.images.phonics.vowels.mat.path,
        imageName: 'Mat',
        soundPath: 'sounds/vowels/mamat.m4a',
      ),
      Vowel(
        vowel: 'Va',
        imagePath: Assets.images.phonics.vowels.van.path,
        imageName: 'Van',
        soundPath: 'sounds/vowels/vavan.m4a',
      ),
    ],
    [
      Vowel(
        vowel: 'Be',
        imagePath: Assets.images.phonics.vowels.bed.path,
        imageName: 'Bed',
        soundPath: 'sounds/vowels/bebed.m4a',
      ),
      Vowel(
        vowel: 'He',
        imagePath: Assets.images.phonics.vowels.hen.path,
        imageName: 'Hen',
        soundPath: 'sounds/vowels/hehen.m4a',
      ),
      Vowel(
        vowel: 'Pe',
        imagePath: Assets.images.phonics.vowels.pen.path,
        imageName: 'Pen',
        soundPath: 'sounds/vowels/pepen.m4a',
      ),
      Vowel(
        vowel: 'Ne',
        imagePath: Assets.images.phonics.vowels.net.path,
        imageName: 'Net',
        soundPath: 'sounds/vowels/nenet.m4a',
      ),
      Vowel(
        vowel: 'We',
        imagePath: Assets.images.phonics.vowels.web.path,
        imageName: 'Web',
        soundPath: 'sounds/vowels/weweb.m4a',
      ),
    ],
    [
      Vowel(
        vowel: 'Fi',
        imagePath: Assets.images.phonics.vowels.fish.path,
        imageName: 'Fish',
        soundPath: 'sounds/vowels/fifish.m4a',
      ),
      Vowel(
        vowel: 'Bi',
        imagePath: Assets.images.phonics.vowels.bib.path,
        imageName: 'Bib',
        soundPath: 'sounds/vowels/bibib.m4a',
      ),
      Vowel(
        vowel: 'Gi',
        imagePath: Assets.images.phonics.vowels.gift.path,
        imageName: 'Gift',
        soundPath: 'sounds/vowels/gigift.m4a',
      ),
      Vowel(
        vowel: 'Pi',
        imagePath: Assets.images.phonics.vowels.pig.path,
        imageName: 'Pig',
        soundPath: 'sounds/vowels/pipig.m4a',
      ),
      Vowel(
        vowel: 'Ri',
        imagePath: Assets.images.phonics.vowels.ring.path,
        imageName: 'Ring',
        soundPath: 'sounds/vowels/riring.m4a',
      ),
    ],
    [
      Vowel(
        vowel: 'Co',
        imagePath: Assets.images.phonics.vowels.cot.path,
        imageName: 'Cot',
        soundPath: 'sounds/vowels/cocot.m4a',
      ),
      Vowel(
        vowel: 'Do',
        imagePath: Assets.images.phonics.vowels.dog.path,
        imageName: 'Dog',
        soundPath: 'sounds/vowels/dodog.m4a',
      ),
      Vowel(
        vowel: 'Ho',
        imagePath: Assets.images.phonics.vowels.hog.path,
        imageName: 'Hog',
        soundPath: 'sounds/vowels/hohog.m4a',
      ),
      Vowel(
        vowel: 'Po',
        imagePath: Assets.images.phonics.vowels.pot.path,
        imageName: 'Pot',
        soundPath: 'sounds/vowels/popot.m4a',
      ),
      Vowel(
        vowel: 'To',
        imagePath: Assets.images.phonics.vowels.top.path,
        imageName: 'Top',
        soundPath: 'sounds/vowels/totop.m4a',
      ),
    ],
    [
      Vowel(
        vowel: 'Bu',
        imagePath: Assets.images.phonics.vowels.bus.path,
        imageName: 'Bus',
        soundPath: 'sounds/vowels/bubus.m4a',
      ),
      Vowel(
        vowel: 'Gu',
        imagePath: Assets.images.phonics.vowels.gum.path,
        imageName: 'Gum',
        soundPath: 'sounds/vowels/gugum.m4a',
      ),
      Vowel(
        vowel: 'Hu',
        imagePath: Assets.images.phonics.vowels.hut.path,
        imageName: 'Hut',
        soundPath: 'sounds/vowels/huhut.m4a',
      ),
      Vowel(
        vowel: 'Nu',
        imagePath: Assets.images.phonics.vowels.nut.path,
        imageName: 'Nut',
        soundPath: 'sounds/vowels/nunut.m4a',
      ),
      Vowel(
        vowel: 'Su',
        imagePath: Assets.images.phonics.vowels.sun.path,
        imageName: 'Sun',
        soundPath: 'sounds/vowels/susun.m4a',
      ),
    ],
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _mainCarCon.jumpToPage(colCurIndex!);
    });
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
                child: PushReplacement(
                  route: PageTransition(
                    type: PageTransitionType.fade,
                    alignment: Alignment.center,
                    child: const PhonicsScreen(),
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
                            child: const PhonicsScreen(),
                          ),
                        );
                      }
                    },
                  ),
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
                      prefs.setInt('vowels_current_column_index', index);
                      _stop();
                    },
                  ),
                  itemBuilder: (context, index, realIndex) {
                    final CarouselSliderController childCarCon =
                        CarouselSliderController();
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      childCarCon.jumpToPage(rowCurIndex!);
                    });

                    return CarouselSlider.builder(
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
                          prefs.setInt('vowels_current_row_index', index);
                          _stop();

                          if (colCurIndex == vowels.length - 1 &&
                              rowCurIndex == 4) {
                            prefs.setBool('vowels_quiz_unlocked', true);
                            log("Quiz Unlocked");
                          }
                        },
                      ),
                      itemBuilder: (context, sampleIndex, sampleRealIndex) {
                        return VowelCard(
                          vowel: vowels[index][sampleIndex],
                          nextCallback: () {
                            if (colCurIndex == vowels.length - 1 &&
                                sampleIndex == 4) {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => const FinishModuleDialog(
                                  route: VowelsQuizTwoStart(),
                                  oldRoute: PhonicsScreen(),
                                ),
                              );
                            } else if (sampleIndex == 4) {
                              _mainCarCon.nextPage();
                              childCarCon.animateToPage(0);
                            } else {
                              childCarCon.nextPage();
                            }
                          },
                          prevCallback: () {
                            if (sampleIndex == 0) {
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
