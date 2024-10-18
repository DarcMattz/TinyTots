import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/audioplayer/audio_service.dart';
import 'package:flutter_application_1/components/all_aboard/letter_example_card.dart';
import 'package:flutter_application_1/components/all_aboard/letter_trace_card.dart';
import 'package:flutter_application_1/components/finish_module_dialog.dart';
import 'package:flutter_application_1/components/all_aboard/letter_card.dart';
import 'package:flutter_application_1/components/utils/nice_button.dart';
import 'package:flutter_application_1/models/all_aboard/alphabet.dart';
import 'package:flutter_application_1/models/all_aboard/letter.dart';
import 'package:flutter_application_1/models/all_aboard/letter_example.dart';
import 'package:flutter_application_1/models/all_aboard/letter_trace.dart';
import 'package:flutter_application_1/screens/learning/all_aboard/abc_quiz.dart';
import 'package:gap/gap.dart';

class AbcScreen extends StatefulWidget {
  const AbcScreen({super.key});

  @override
  State<AbcScreen> createState() => _AbcScreenState();
}

class _AbcScreenState extends State<AbcScreen> {
  final AudioService _audioService = AudioService();
  final CarouselSliderController _mainCarCon = CarouselSliderController();
  int colCurIndex = 0;

  final List<Alphabet> alphabet = [
    Alphabet(
      letter: Letter(
        letter: "Aa",
        letterSoundPath: "sounds/alphabet/letters/Sound_A.mp3",
      ),
      letterSample: LetterExample(
        label: 'Apple',
        imagePath: 'assets/images/letters/sample/LETTER_A.png',
        sampleSoundPath: 'sounds/alphabet/example/apple.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/A.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Bb",
        letterSoundPath: "sounds/alphabet/letters/Sound_B.mp3",
      ),
      letterSample: LetterExample(
        label: 'Ball',
        imagePath: 'assets/images/letters/sample/LETTER_B.png',
        sampleSoundPath: 'sounds/alphabet/example/ball.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/B.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Cc",
        letterSoundPath: "sounds/alphabet/letters/Sound_C.mp3",
      ),
      letterSample: LetterExample(
        label: 'Cat',
        imagePath: 'assets/images/letters/sample/LETTER_C.png',
        sampleSoundPath: 'sounds/alphabet/example/cat.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/C.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Dd",
        letterSoundPath: "sounds/alphabet/letters/Sound_D.mp3",
      ),
      letterSample: LetterExample(
        label: 'Doll',
        imagePath: 'assets/images/letters/sample/LETTER_D.png',
        sampleSoundPath: 'sounds/alphabet/example/doll.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/D.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Ee",
        letterSoundPath: "sounds/alphabet/letters/Sound_E.mp3",
      ),
      letterSample: LetterExample(
        label: 'Egg',
        imagePath: 'assets/images/letters/sample/LETTER_E.png',
        sampleSoundPath: 'sounds/alphabet/example/egg.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/E.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Ff",
        letterSoundPath: "sounds/alphabet/letters/Sound_F.mp3",
      ),
      letterSample: LetterExample(
        label: 'Fan',
        imagePath: 'assets/images/letters/sample/LETTER_F.png',
        sampleSoundPath: 'sounds/alphabet/example/fan.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/F.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Gg",
        letterSoundPath: "sounds/alphabet/letters/Sound_G.mp3",
      ),
      letterSample: LetterExample(
        label: 'Goat',
        imagePath: 'assets/images/letters/sample/LETTER_G.png',
        sampleSoundPath: 'sounds/alphabet/example/goat.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/G.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Hh",
        letterSoundPath: "sounds/alphabet/letters/Sound_H.mp3",
      ),
      letterSample: LetterExample(
        label: 'Hand',
        imagePath: 'assets/images/letters/sample/LETTER_H.png',
        sampleSoundPath: 'sounds/alphabet/example/hand.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/H.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Ii",
        letterSoundPath: "sounds/alphabet/letters/Sound_I.mp3",
      ),
      letterSample: LetterExample(
        label: 'Ice',
        imagePath: 'assets/images/letters/sample/LETTER_I.png',
        sampleSoundPath: 'sounds/alphabet/example/ice.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/I.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Jj",
        letterSoundPath: "sounds/alphabet/letters/Sound_J.mp3",
      ),
      letterSample: LetterExample(
        label: 'Jam',
        imagePath: 'assets/images/letters/sample/LETTER_J.png',
        sampleSoundPath: 'sounds/alphabet/example/jam.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/J.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Kk",
        letterSoundPath: "sounds/alphabet/letters/Sound_K.mp3",
      ),
      letterSample: LetterExample(
        label: 'Kite',
        imagePath: 'assets/images/letters/sample/LETTER_K.png',
        sampleSoundPath: 'sounds/alphabet/example/kite.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/K.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Ll",
        letterSoundPath: "sounds/alphabet/letters/Sound_L.mp3",
      ),
      letterSample: LetterExample(
        label: 'Lamb',
        imagePath: 'assets/images/letters/sample/LETTER_L.png',
        sampleSoundPath: 'sounds/alphabet/example/lamb.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/L.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Mm",
        letterSoundPath: "sounds/alphabet/letters/Sound_M.mp3",
      ),
      letterSample: LetterExample(
        label: 'Monkey',
        imagePath: 'assets/images/letters/sample/LETTER_M.png',
        sampleSoundPath: 'sounds/alphabet/example/monkey.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/M.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Nn",
        letterSoundPath: "sounds/alphabet/letters/Sound_N.mp3",
      ),
      letterSample: LetterExample(
        label: 'Noodle',
        imagePath: 'assets/images/letters/sample/LETTER_N.png',
        sampleSoundPath: 'sounds/alphabet/example/noodle.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/N.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Oo",
        letterSoundPath: "sounds/alphabet/letters/Sound_O.mp3",
      ),
      letterSample: LetterExample(
        label: 'Octopus',
        imagePath: 'assets/images/letters/sample/LETTER_O.png',
        sampleSoundPath: 'sounds/alphabet/example/octopus.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/O.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Pp",
        letterSoundPath: "sounds/alphabet/letters/Sound_P.mp3",
      ),
      letterSample: LetterExample(
        label: 'Penguin',
        imagePath: 'assets/images/letters/sample/LETTER_P.png',
        sampleSoundPath: 'sounds/alphabet/example/penguin.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/P.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Qq",
        letterSoundPath: "sounds/alphabet/letters/Sound_Q.mp3",
      ),
      letterSample: LetterExample(
        label: 'Queen',
        imagePath: 'assets/images/letters/sample/LETTER_Q.png',
        sampleSoundPath: 'sounds/alphabet/example/queen.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/Q.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Rr",
        letterSoundPath: "sounds/alphabet/letters/Sound_R.mp3",
      ),
      letterSample: LetterExample(
        label: 'Ramp',
        imagePath: 'assets/images/letters/sample/LETTER_R.png',
        sampleSoundPath: 'sounds/alphabet/example/ramp.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/R.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Ss",
        letterSoundPath: "sounds/alphabet/letters/Sound_S.mp3",
      ),
      letterSample: LetterExample(
        label: 'Sun',
        imagePath: 'assets/images/letters/sample/LETTER_S.png',
        sampleSoundPath: 'sounds/alphabet/example/sun.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/S.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Tt",
        letterSoundPath: "sounds/alphabet/letters/Sound_T.mp3",
      ),
      letterSample: LetterExample(
        label: 'Tail',
        imagePath: 'assets/images/letters/sample/LETTER_T.png',
        sampleSoundPath: 'sounds/alphabet/example/tail.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/T.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Uu",
        letterSoundPath: "sounds/alphabet/letters/Sound_U.mp3",
      ),
      letterSample: LetterExample(
        label: 'Umbrella',
        imagePath: 'assets/images/letters/sample/LETTER_U.png',
        sampleSoundPath: 'sounds/alphabet/example/umbrella.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/U.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Vv",
        letterSoundPath: "sounds/alphabet/letters/Sound_V.mp3",
      ),
      letterSample: LetterExample(
        label: 'Vase',
        imagePath: 'assets/images/letters/sample/LETTER_V.png',
        sampleSoundPath: 'sounds/alphabet/example/vase.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/V.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Ww",
        letterSoundPath: "sounds/alphabet/letters/Sound_W.mp3",
      ),
      letterSample: LetterExample(
        label: 'Wagon',
        imagePath: 'assets/images/letters/sample/LETTER_W.png',
        sampleSoundPath: 'sounds/alphabet/example/wagon.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/W.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Xx",
        letterSoundPath: "sounds/alphabet/letters/Sound_X.mp3",
      ),
      letterSample: LetterExample(
        label: 'Xylophone',
        imagePath: 'assets/images/letters/sample/LETTER_X.png',
        sampleSoundPath: 'sounds/alphabet/example/xylophone.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/X.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Yy",
        letterSoundPath: "sounds/alphabet/letters/Sound_Y.mp3",
      ),
      letterSample: LetterExample(
        label: 'Yarn',
        imagePath: 'assets/images/letters/sample/LETTER_Y.png',
        sampleSoundPath: 'sounds/alphabet/example/yarn.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/Y.png',
      ),
    ),
    Alphabet(
      letter: Letter(
        letter: "Zz",
        letterSoundPath: "sounds/alphabet/letters/Sound_Z.mp3",
      ),
      letterSample: LetterExample(
        label: 'Zoo',
        imagePath: 'assets/images/letters/sample/LETTER_Z.png',
        sampleSoundPath: 'sounds/alphabet/example/zoo.m4a',
      ),
      traceImage: Trace(
        imagePath: 'assets/images/letters/guide/Z.png',
      ),
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

  void _nextCard(index, childCarCon, rowCurIndex) {
    if (colCurIndex == alphabet.length - 1 &&
        rowCurIndex == alphabet[index].length - 1) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const FinishModuleDialog(
          route: AbcQuizStart(),
        ),
      );
    } else if (rowCurIndex == 2) {
      _mainCarCon.nextPage();
      childCarCon.animateToPage(0);
    } else {
      childCarCon.nextPage();
    }
  }

  void _previousCard(childCarCon, rowCurIndex) {
    if (rowCurIndex == 0) {
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
                      _stop();
                    },
                  ),
                  itemBuilder: (context, index, realIndex) {
                    final CarouselSliderController childCarCon =
                        CarouselSliderController();
                    int rowCurIndex = 0;

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
                          _stop();
                        },
                      ),
                      itemBuilder: (context, sampleIndex, sampleRealIndex) {
                        if (sampleIndex == 0) {
                          return LetterCard(
                            letter: alphabet[index].letter,
                            nextCallback: () =>
                                _nextCard(index, childCarCon, rowCurIndex),
                            prevCallback: () =>
                                _previousCard(childCarCon, rowCurIndex),
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
                                _nextCard(index, childCarCon, rowCurIndex),
                            prevCallback: () =>
                                _previousCard(childCarCon, rowCurIndex),
                            letterExample: alphabet[index].letterSample,
                            soundCallback: () {
                              _play(
                                  alphabet[index].letterSample.sampleSoundPath);
                            },
                          );
                        } else {
                          return LetterTraceCard(
                            nextCallback: () =>
                                _nextCard(index, childCarCon, rowCurIndex),
                            prevCallback: () =>
                                _previousCard(childCarCon, rowCurIndex),
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
