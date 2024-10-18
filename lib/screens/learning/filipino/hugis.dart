import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/finish_module_dialog.dart';
import 'package:flutter_application_1/components/lesson_card.dart';
import 'package:flutter_application_1/components/top_bar.dart';
import 'package:flutter_application_1/components/utils/circle_button.dart';
import 'package:gap/gap.dart';

class Hugis {
  final String imagePath;
  final String label;
  final String voicePath;

  Hugis({
    required this.label,
    required this.imagePath,
    required this.voicePath,
  });
}

class HugisScreen extends StatefulWidget {
  final Widget quizScreen;
  const HugisScreen({super.key, required this.quizScreen});

  @override
  State<HugisScreen> createState() => _HugisScreenState();
}

class _HugisScreenState extends State<HugisScreen> {
  final CarouselSliderController parentCarCon = CarouselSliderController();
  int currentIndex = 0;

  final List<Hugis> hugisList = [
    Hugis(
        label: "Bilog",
        imagePath: "assets/images/filipino/hugis_bilog.png",
        voicePath: ""),
    Hugis(
        label: "Parisukat",
        imagePath: "assets/images/filipino/hugis_parisukat.png",
        voicePath: ""),
    Hugis(
        label: "Parihaba",
        imagePath: "assets/images/filipino/hugis_parihaba.png",
        voicePath: ""),
    Hugis(
        label: "Oblong",
        imagePath: "assets/images/filipino/hugis_oblong.png",
        voicePath: ""),
    Hugis(
        label: "Tatsulok",
        imagePath: "assets/images/filipino/hugis_tatsulok.png",
        voicePath: ""),
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
              const TopBar(),
              Expanded(
                child: CarouselSlider.builder(
                  carouselController: parentCarCon,
                  itemCount: hugisList.length,
                  options: CarouselOptions(
                      scrollDirection: Axis.horizontal,
                      height: 400,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      initialPage: 0,
                      autoPlay: false,
                      viewportFraction: 0.8,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      }),
                  itemBuilder: (context, index, cardRealIndex) {
                    return LessonCard(
                        content: pamilyaContent(hugisList[index]),
                        label: hugisList[index].label,
                        onNext: () {
                          if (hugisList.length - 1 == index) {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) =>
                                  FinishModuleDialog(route: widget.quizScreen),
                            );
                          } else {
                            parentCarCon.nextPage();
                          }
                        },
                        onPrevious: () {
                          parentCarCon.previousPage();
                        },
                        btnColor: 0xFFB169FA,
                        btnShadowColor: 0xFF782EFB,
                        showPrevBtn: index > 0);
                  },
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(hugisList.length, (index) {
                    return GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentIndex == index
                              ? Colors.blueAccent
                              : Colors.grey,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 60.0),
                    child: Image.asset(
                      'assets/images/rabbit.png',
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

  Widget pamilyaContent(Hugis hugis) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10.0,
        left: 10.0,
        right: 10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(top: 5, right: 5),
            child: CircleButton(
                color: Colors.purpleAccent,
                shadowColor: Colors.purple,
                icon: Icons.volume_up_rounded,
                method: () {
                  print("Volume Clicked!");
                }),
          ),
          Expanded(
              child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Image.asset(hugis
                    .imagePath),
                  ))),
          Gap(20)
        ],
      ),
    );
  }
}
