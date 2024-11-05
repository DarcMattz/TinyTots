import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_application_1/helper/audio_service.dart';
import 'package:flutter_application_1/components/science/body_card.dart';
import 'package:flutter_application_1/components/finish_module_dialog.dart';
import 'package:flutter_application_1/components/utils/nice_button.dart';
import 'package:flutter_application_1/models/science/body.dart';
import 'package:flutter_application_1/screens/learning/science/body_quiz.dart';

class BodyScreen extends StatefulWidget {
  const BodyScreen({super.key});

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  final AudioService _audioService = AudioService();
  final CarouselSliderController _mainCarCon = CarouselSliderController();
  int colCurIndex = 0;

  final List<List<Body>> body = [
    [
      Body(
        label: '',
        imagePath: Assets.images.science.body.partsOfBody.path,
        soundPath: 'sounds/science/body/parts_of_the_body.m4a',
      ),
      Body(
        label: 'Human Body',
        imagePath: Assets.images.science.body.body1.path,
        soundPath: 'sounds/science/body/human_body.m4a',
      ),
      Body(
        label: 'Head',
        imagePath: Assets.images.science.body.body2.path,
        soundPath: 'sounds/science/body/head.m4a',
      ),
      Body(
        label: 'Neck',
        imagePath: Assets.images.science.body.body3.path,
        soundPath: 'sounds/science/body/neck.m4a',
      ),
      Body(
        label: 'Stomach',
        imagePath: Assets.images.science.body.body4.path,
        soundPath: 'sounds/science/body/stomach.m4a',
      ),
      Body(
        label: 'Hands',
        imagePath: Assets.images.science.body.body5.path,
        soundPath: 'sounds/science/body/hands.m4a',
      ),
      Body(
        label: 'Knee',
        imagePath: Assets.images.science.body.body6.path,
        soundPath: 'sounds/science/body/knee.m4a',
      ),
      Body(
        label: 'Feet',
        imagePath: Assets.images.science.body.body7.path,
        soundPath: 'sounds/science/body/feet.m4a',
      ),
    ],
    [
      Body(
        label: '',
        imagePath: Assets.images.science.face.partsOfFace.path,
        soundPath: 'sounds/science/face/parts_of_face.m4a',
      ),
      Body(
        label: 'Human Face',
        imagePath: Assets.images.science.body.body2.path,
        soundPath: 'sounds/science/face/human_face.m4a',
      ),
      Body(
        label: 'Ears',
        imagePath: Assets.images.science.face.face1.path,
        soundPath: 'sounds/science/face/ears.m4a',
      ),
      Body(
        label: 'Eyebrows',
        imagePath: Assets.images.science.face.face2.path,
        soundPath: 'sounds/science/face/eyebrows.m4a',
      ),
      Body(
        label: 'Eyes',
        imagePath: Assets.images.science.face.face3.path,
        soundPath: 'sounds/science/face/eyes.m4a',
      ),
      Body(
        label: 'Nose',
        imagePath: Assets.images.science.face.face4.path,
        soundPath: 'sounds/science/face/nose.m4a',
      ),
      Body(
        label: 'Lips and Teeth',
        imagePath: Assets.images.science.face.face5.path,
        soundPath: 'sounds/science/face/lips_teeth.m4a',
      ),
      Body(
        label: 'Tongue',
        imagePath: Assets.images.science.face.face6.path,
        soundPath: 'sounds/science/face/tongue.m4a',
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
                  itemCount: body.length,
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

                    return CarouselSlider.builder(
                      carouselController: childCarCon,
                      itemCount: body[index].length,
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
                        return BodyCard(
                          body: body[index][sampleIndex],
                          nextCallback: () {
                            if (colCurIndex == body.length - 1 &&
                                rowCurIndex == body[index].length - 1) {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => const FinishModuleDialog(
                                  route: BodyQuizScreen(),
                                ),
                              );
                            } else if (rowCurIndex == body[index].length - 1) {
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
                            _play(body[index][sampleIndex].soundPath);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
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
