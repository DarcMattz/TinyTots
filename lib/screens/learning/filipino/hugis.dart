import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tinytots/components/push_replacement.dart';
import 'package:tinytots/components/utils/nice_button.dart';
import 'package:tinytots/dialogs/finish_module_dialog.dart';
import 'package:tinytots/components/lesson_card.dart';
import 'package:tinytots/components/top_bar.dart';
import 'package:tinytots/components/utils/circle_button.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/globals.dart';
import 'package:tinytots/models/filipino/hugis.dart';
import 'package:tinytots/screens/learning/filipino/filipino.dart';
import 'package:gap/gap.dart';

class HugisScreen extends StatefulWidget {
  final Widget quizScreen;
  const HugisScreen({super.key, required this.quizScreen});

  @override
  State<HugisScreen> createState() => _HugisScreenState();
}

class _HugisScreenState extends State<HugisScreen> {
  final CarouselSliderController parentCarCon = CarouselSliderController();
  int? currentIndex = prefs.getInt('hugis_current_index') ?? 0;

  final List<Hugis> hugisList = [
    Hugis(
        label: "Bilog",
        imagePath: Assets.images.filipino.hugis.hugisBilog.path,
        voicePath: ""),
    Hugis(
        label: "Parisukat",
        imagePath: Assets.images.filipino.hugis.hugisParisukat.path,
        voicePath: ""),
    Hugis(
        label: "Parihaba",
        imagePath: Assets.images.filipino.hugis.hugisParihaba.path,
        voicePath: ""),
    Hugis(
        label: "Oblong",
        imagePath: Assets.images.filipino.hugis.hugisOblong.path,
        voicePath: ""),
    Hugis(
        label: "Tatsulok",
        imagePath: Assets.images.filipino.hugis.hugisTatsulok.path,
        voicePath: ""),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      parentCarCon.jumpToPage(currentIndex!);
    });
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
                    child: const FilipinoScreen(),
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
                            child: const FilipinoScreen(),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
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

                          prefs.setInt('hugis_current_index', index);

                          if (hugisList.length - 1 == index) {
                            prefs.setBool('hugis_quiz_unlocked', true);
                          }
                        });
                      }),
                  itemBuilder: (context, index, cardRealIndex) {
                    return LessonCard(
                        content: pamilyaContent(hugisList[index]),
                        label: hugisList[index].label,
                        onNext: () {
                          if (hugisList.length - 1 == index) {
                            prefs.setInt('hugis_current_index', 0);
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
                    child: Image.asset(hugis.imagePath),
                  ))),
          const Gap(20)
        ],
      ),
    );
  }
}
