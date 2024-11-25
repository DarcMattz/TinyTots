import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/dialogs/finish_module_dialog.dart';
import 'package:flutter_application_1/components/lesson_card.dart';
// import 'package:flutter_application_1/components/letter_card.dart';
// import 'package:flutter_application_1/components/nice_button.dart';
// import 'package:flutter_application_1/components/shape_card.dart';
import 'package:flutter_application_1/components/top_bar.dart';
import 'package:flutter_application_1/components/utils/circle_button.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_application_1/models/filipino/pamilya.dart';
import 'package:flutter_application_1/screens/learning/filipino/filipino.dart';
import 'package:gap/gap.dart';

class PamilyaScreen extends StatefulWidget {
  final Widget quizScreen;
  const PamilyaScreen({super.key, required this.quizScreen});

  @override
  State<PamilyaScreen> createState() => _PamilyaScreenState();
}

class _PamilyaScreenState extends State<PamilyaScreen> {
  final CarouselSliderController parentCarCon = CarouselSliderController();
  int currentIndex = 0;

  final List<Pamilya> pamilyaList = [
    Pamilya(
        label: "NANAY",
        imagePath: Assets.images.filipino.pamilya.pamilyaNanay.path,
        voicePath: ""),
    Pamilya(
        label: "TATAY",
        imagePath: Assets.images.filipino.pamilya.pamilyaTatay.path,
        voicePath: ""),
    Pamilya(
        label: "ATE",
        imagePath: Assets.images.filipino.pamilya.pamilyaAte.path,
        voicePath: ""),
    Pamilya(
        label: "KUYA",
        imagePath: Assets.images.filipino.pamilya.pamilyaKuya.path,
        voicePath: ""),
    Pamilya(
        label: "LOLO",
        imagePath: Assets.images.filipino.pamilya.pamilyaLolo.path,
        voicePath: ""),
    Pamilya(
        label: "LOLA",
        imagePath: Assets.images.filipino.pamilya.pamilyaLola.path,
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
                  itemCount: pamilyaList.length,
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
                        content: pamilyaContent(pamilyaList[index]),
                        label: pamilyaList[index].label,
                        onNext: () {
                          if (pamilyaList.length - 1 == index) {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => FinishModuleDialog(
                                route: widget.quizScreen,
                                oldRoute: const FilipinoScreen(),
                              ),
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
                  children: List.generate(pamilyaList.length, (index) {
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
                      'assets/images/giraffe.png',
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

  Widget pamilyaContent(Pamilya pamilya) {
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
            margin: const EdgeInsets.only(top: 5, right: 5),
            child: CircleButton(
                color: Colors.purpleAccent,
                shadowColor: Colors.purple,
                icon: Icons.volume_up_rounded,
                method: () {
                  print("Volume Clicked!");
                }),
          ),
          Expanded(
              child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Image.asset(pamilya.imagePath),
                  ))),
          const Gap(20)
        ],
      ),
    );
  }
}
