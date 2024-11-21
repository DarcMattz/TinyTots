import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/push_replacement.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_application_1/globals.dart';
import 'package:flutter_application_1/helper/audio_service.dart';
import 'package:flutter_application_1/components/all_aboard/letter_example_card.dart';
import 'package:flutter_application_1/components/all_aboard/letter_trace_card.dart';
import 'package:flutter_application_1/dialogs/finish_module_dialog.dart';
import 'package:flutter_application_1/components/all_aboard/letter_card.dart';
import 'package:flutter_application_1/components/utils/nice_button.dart';
import 'package:flutter_application_1/models/all_aboard/alphabet.dart';
import 'package:flutter_application_1/models/all_aboard/letter.dart';
import 'package:flutter_application_1/models/all_aboard/letter_example.dart';
import 'package:flutter_application_1/models/all_aboard/letter_trace.dart';
import 'package:flutter_application_1/screens/learning/all_aboard/all_aboard.dart';
import 'package:flutter_application_1/screens/learning/all_aboard/abc_quiz_start.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:scribble/scribble.dart';

class AbcScreen extends StatefulWidget {
  const AbcScreen({super.key});

  @override
  State<AbcScreen> createState() => _AbcScreenState();
}

class _AbcScreenState extends State<AbcScreen> {
  final AudioService _audioService = AudioService();
  final CarouselSliderController _mainCarCon = CarouselSliderController();
  int? colCurIndex = prefs.getInt('alphabets_current_column_index') ?? 0;
  int? rowCurIndex = prefs.getInt('alphabets_current_row_index') ?? 0;
  final List<Alphabet> alphabet = [
    Alphabet(
      letter: Letter(
        letter: "Aa",
        letterSoundPath: "sounds/alphabet/letters/Sound_A.mp3",
      ),
      letterSample: LetterExample(
        label: 'Apple',
        imagePath: Assets.images.allAboard.letters.sample.apple.path,
        sampleSoundPath: 'sounds/alphabet/example/apple.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.a.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Bb",
        letterSoundPath: "sounds/alphabet/letters/Sound_B.mp3",
      ),
      letterSample: LetterExample(
        label: 'Ball',
        imagePath: Assets.images.allAboard.letters.sample.ball.path,
        sampleSoundPath: 'sounds/alphabet/example/ball.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.b.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Cc",
        letterSoundPath: "sounds/alphabet/letters/Sound_C.mp3",
      ),
      letterSample: LetterExample(
        label: 'Cat',
        imagePath: Assets.images.allAboard.letters.sample.cat.path,
        sampleSoundPath: 'sounds/alphabet/example/cat.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.c.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Dd",
        letterSoundPath: "sounds/alphabet/letters/Sound_D.mp3",
      ),
      letterSample: LetterExample(
        label: 'Doll',
        imagePath: Assets.images.allAboard.letters.sample.doll.path,
        sampleSoundPath: 'sounds/alphabet/example/doll.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.d.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Ee",
        letterSoundPath: "sounds/alphabet/letters/Sound_E.mp3",
      ),
      letterSample: LetterExample(
        label: 'Egg',
        imagePath: Assets.images.allAboard.letters.sample.egg.path,
        sampleSoundPath: 'sounds/alphabet/example/egg.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.e.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Ff",
        letterSoundPath: "sounds/alphabet/letters/Sound_F.mp3",
      ),
      letterSample: LetterExample(
        label: 'Fan',
        imagePath: Assets.images.allAboard.letters.sample.fan.path,
        sampleSoundPath: 'sounds/alphabet/example/fan.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.f.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Gg",
        letterSoundPath: "sounds/alphabet/letters/Sound_G.mp3",
      ),
      letterSample: LetterExample(
        label: 'Goat',
        imagePath: Assets.images.allAboard.letters.sample.goat.path,
        sampleSoundPath: 'sounds/alphabet/example/goat.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.g.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Hh",
        letterSoundPath: "sounds/alphabet/letters/Sound_H.mp3",
      ),
      letterSample: LetterExample(
        label: 'Hand',
        imagePath: Assets.images.allAboard.letters.sample.hand.path,
        sampleSoundPath: 'sounds/alphabet/example/hand.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.h.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Ii",
        letterSoundPath: "sounds/alphabet/letters/Sound_I.mp3",
      ),
      letterSample: LetterExample(
        label: 'Ice',
        imagePath: Assets.images.allAboard.letters.sample.ice.path,
        sampleSoundPath: 'sounds/alphabet/example/ice.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.i.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Jj",
        letterSoundPath: "sounds/alphabet/letters/Sound_J.mp3",
      ),
      letterSample: LetterExample(
        label: 'Jam',
        imagePath: Assets.images.allAboard.letters.sample.jam.path,
        sampleSoundPath: 'sounds/alphabet/example/jam.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.j.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Kk",
        letterSoundPath: "sounds/alphabet/letters/Sound_K.mp3",
      ),
      letterSample: LetterExample(
        label: 'Kite',
        imagePath: Assets.images.allAboard.letters.sample.kite.path,
        sampleSoundPath: 'sounds/alphabet/example/kite.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.k.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Ll",
        letterSoundPath: "sounds/alphabet/letters/Sound_L.mp3",
      ),
      letterSample: LetterExample(
        label: 'Lamb',
        imagePath: Assets.images.allAboard.letters.sample.lamb.path,
        sampleSoundPath: 'sounds/alphabet/example/lamb.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.l.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Mm",
        letterSoundPath: "sounds/alphabet/letters/Sound_M.mp3",
      ),
      letterSample: LetterExample(
        label: 'Monkey',
        imagePath: Assets.images.allAboard.letters.sample.monkey.path,
        sampleSoundPath: 'sounds/alphabet/example/monkey.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.m.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Nn",
        letterSoundPath: "sounds/alphabet/letters/Sound_N.mp3",
      ),
      letterSample: LetterExample(
        label: 'Noodle',
        imagePath: Assets.images.allAboard.letters.sample.noodle.path,
        sampleSoundPath: 'sounds/alphabet/example/noodle.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.n.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Oo",
        letterSoundPath: "sounds/alphabet/letters/Sound_O.mp3",
      ),
      letterSample: LetterExample(
        label: 'Octopus',
        imagePath: Assets.images.allAboard.letters.sample.octopus.path,
        sampleSoundPath: 'sounds/alphabet/example/octopus.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.o.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Pp",
        letterSoundPath: "sounds/alphabet/letters/Sound_P.mp3",
      ),
      letterSample: LetterExample(
        label: 'Penguin',
        imagePath: Assets.images.allAboard.letters.sample.penguin.path,
        sampleSoundPath: 'sounds/alphabet/example/penguin.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.p.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Qq",
        letterSoundPath: "sounds/alphabet/letters/Sound_Q.mp3",
      ),
      letterSample: LetterExample(
        label: 'Queen',
        imagePath: Assets.images.allAboard.letters.sample.queen.path,
        sampleSoundPath: 'sounds/alphabet/example/queen.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.q.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Rr",
        letterSoundPath: "sounds/alphabet/letters/Sound_R.mp3",
      ),
      letterSample: LetterExample(
        label: 'Ramp',
        imagePath: Assets.images.allAboard.letters.sample.ramp.path,
        sampleSoundPath: 'sounds/alphabet/example/ramp.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.r.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Ss",
        letterSoundPath: "sounds/alphabet/letters/Sound_S.mp3",
      ),
      letterSample: LetterExample(
        label: 'Sun',
        imagePath: Assets.images.allAboard.letters.sample.sun.path,
        sampleSoundPath: 'sounds/alphabet/example/sun.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.s.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Tt",
        letterSoundPath: "sounds/alphabet/letters/Sound_T.mp3",
      ),
      letterSample: LetterExample(
        label: 'Tail',
        imagePath: Assets.images.allAboard.letters.sample.tail.path,
        sampleSoundPath: 'sounds/alphabet/example/tiger.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.t.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Uu",
        letterSoundPath: "sounds/alphabet/letters/Sound_U.mp3",
      ),
      letterSample: LetterExample(
        label: 'Umbrella',
        imagePath: Assets.images.allAboard.letters.sample.umbrella.path,
        sampleSoundPath: 'sounds/alphabet/example/umbrella.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.u.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Vv",
        letterSoundPath: "sounds/alphabet/letters/Sound_V.mp3",
      ),
      letterSample: LetterExample(
        label: 'Vase',
        imagePath: Assets.images.allAboard.letters.sample.vase.path,
        sampleSoundPath: 'sounds/alphabet/example/van.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.v.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Ww",
        letterSoundPath: "sounds/alphabet/letters/Sound_W.mp3",
      ),
      letterSample: LetterExample(
        label: 'Wagon',
        imagePath: Assets.images.allAboard.letters.sample.wagon.path,
        sampleSoundPath: 'sounds/alphabet/example/whale.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.w.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Xx",
        letterSoundPath: "sounds/alphabet/letters/Sound_X.mp3",
      ),
      letterSample: LetterExample(
        label: 'Xylophone',
        imagePath: Assets.images.allAboard.letters.sample.xylophone.path,
        sampleSoundPath: 'sounds/alphabet/example/xylophone.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.x.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Yy",
        letterSoundPath: "sounds/alphabet/letters/Sound_Y.mp3",
      ),
      letterSample: LetterExample(
        label: 'Yarn',
        imagePath: Assets.images.allAboard.letters.sample.yarn.path,
        sampleSoundPath: 'sounds/alphabet/example/yak.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.y.path,
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Zz",
        letterSoundPath: "sounds/alphabet/letters/Sound_Z.mp3",
      ),
      letterSample: LetterExample(
        label: 'Zoo',
        imagePath: Assets.images.allAboard.letters.sample.zoo.path,
        sampleSoundPath: 'sounds/alphabet/example/zebra.m4a',
      ),
      traceImage: Trace(
        imagePath: Assets.images.allAboard.letters.guide.z.path,
      ),
    ),
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

  void _nextCard(index, childCarCon, rowIndex) {
    if (colCurIndex == alphabet.length - 1 &&
        rowIndex == alphabet[index].length - 1) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const FinishModuleDialog(
          route: AbcQuizStart(),
          oldRoute: AllAboardScreen(),
        ),
      );
    } else if (rowIndex == 2) {
      _mainCarCon.nextPage();
      childCarCon.animateToPage(0);
    } else {
      childCarCon.nextPage();
    }
  }

  void _previousCard(childCarCon, rowIndex) {
    if (rowIndex == 0) {
      _mainCarCon.previousPage();
    } else {
      childCarCon.previousPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
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
                child: PushReplacement(
                  route: PageTransition(
                    type: PageTransitionType.scale,
                    alignment: Alignment.center,
                    child: const AllAboardScreen(),
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
                  carouselController: _mainCarCon,
                  itemCount: alphabet.length,
                  options: CarouselOptions(
                    scrollDirection: Axis.vertical,
                    height: 400,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    initialPage: 0,
                    autoPlay: false,
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      colCurIndex = index;
                      prefs.setInt('alphabets_current_column_index', index);

                      log(colCurIndex.toString());
                      _stop();
                    },
                  ),
                  itemBuilder: (context, index, realIndex) {
                    final CarouselSliderController childCarCon =
                        CarouselSliderController();
                    final ScribbleNotifier scribbleNotifier =
                        ScribbleNotifier();
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      childCarCon.jumpToPage(rowCurIndex!);
                    });

                    return CarouselSlider.builder(
                      carouselController: childCarCon,
                      itemCount: alphabet[index].length,
                      options: CarouselOptions(
                        height: 400,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        initialPage: 0,
                        autoPlay: false,
                        viewportFraction: 0.8,
                        onPageChanged: (index, reason) {
                          rowCurIndex = index;
                          prefs.setInt('alphabets_current_row_index', index);

                          if (colCurIndex == alphabet.length - 1 &&
                              index == 2) {
                            prefs.setBool('alphabets_quiz_unlocked', true);
                          }

                          _stop();
                        },
                      ),
                      itemBuilder: (context, sampleIndex, sampleRealIndex) {
                        if (sampleIndex == 0) {
                          return LetterCard(
                            letter: alphabet[index].letter,
                            nextCallback: () =>
                                _nextCard(index, childCarCon, sampleIndex),
                            prevCallback: () =>
                                _previousCard(childCarCon, sampleIndex),
                            isFirst: (index == 0)
                                ? ((sampleIndex == 0) ? true : false)
                                : false,
                            soundCallback: () {
                              _play(alphabet[index].letter.letterSoundPath);
                            },
                          );
                        } else if (sampleIndex == 1) {
                          return LetterExampleCard(
                            nextCallback: () =>
                                _nextCard(index, childCarCon, sampleIndex),
                            prevCallback: () =>
                                _previousCard(childCarCon, sampleIndex),
                            letterExample: alphabet[index].letterSample,
                            soundCallback: () {
                              _play(
                                  alphabet[index].letterSample.sampleSoundPath);
                            },
                          );
                        } else {
                          return LetterTraceCard(
                            nextCallback: () =>
                                _nextCard(index, childCarCon, sampleIndex),
                            prevCallback: () =>
                                _previousCard(childCarCon, sampleIndex),
                            scribbleNotifier: scribbleNotifier,
                            trace: alphabet[index].traceImage,
                          );
                        }
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
