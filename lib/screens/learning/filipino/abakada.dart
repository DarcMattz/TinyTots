import 'dart:developer';

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
import 'package:tinytots/models/filipino/abakada.dart';
import 'package:tinytots/screens/learning/filipino/filipino.dart';
import 'package:gap/gap.dart';

class AbakadaScreen extends StatefulWidget {
  final Widget quizScreen;
  const AbakadaScreen({super.key, required this.quizScreen});

  @override
  State<AbakadaScreen> createState() => _AbakadaScreenState();
}

class _AbakadaScreenState extends State<AbakadaScreen> {
  final CarouselSliderController parentCarCon = CarouselSliderController();
  int? curIndex = prefs.getInt('abakada_current_index') ?? 0;

  final List<List<Abakada>> abakadaList = [
    [
      Abakada(imagePath: "", label: "", mainContent: "Aa", voicePath: ""),
      Abakada(
          imagePath: Assets.images.filipino.abakada.abakadaAa.path,
          label: "A-so",
          mainContent: "",
          voicePath: "",
          subContent: ["a", "e", "i", "o", "u"]),
    ],
    [
      Abakada(imagePath: "", label: "", mainContent: "Ba", voicePath: ""),
      Abakada(
          imagePath: Assets.images.filipino.abakada.abakadaBa.path,
          label: "Ba-ka",
          mainContent: "",
          voicePath: "",
          subContent: ["Ba", "Be", "Bi", "Bo", "Bu"]),
    ],
    [
      Abakada(imagePath: "", label: "", mainContent: "Ka", voicePath: ""),
      Abakada(
          imagePath: Assets.images.filipino.abakada.abakadaKa.path,
          label: "Ka-bayo",
          mainContent: "",
          voicePath: "",
          subContent: ["Ka", "Ke", "Ki", "Ko", "Ku"]),
    ],
    [
      Abakada(imagePath: "", label: "", mainContent: "Da", voicePath: ""),
      Abakada(
          imagePath: Assets.images.filipino.abakada.abakadaDa.path,
          label: "Da-ga",
          mainContent: "",
          voicePath: "",
          subContent: ["Da", "De", "Di", "Do", "Du"]),
    ],
    [
      Abakada(imagePath: "", label: "", mainContent: "Ga", voicePath: ""),
      Abakada(
          imagePath: Assets.images.filipino.abakada.abakadaGa.path,
          label: "Ga-gamba",
          mainContent: "",
          voicePath: "",
          subContent: ["Ga", "Ge", "Gi", "Go", "Gu"]),
    ],
    [
      Abakada(imagePath: "", label: "", mainContent: "Ha", voicePath: ""),
      Abakada(
          imagePath: Assets.images.filipino.abakada.abakadaHa.path,
          label: "Ha-laman",
          mainContent: "",
          voicePath: "",
          subContent: ["Ha", "He", "Hi", "Ho", "Hu"]),
    ],
    [
      Abakada(imagePath: "", label: "", mainContent: "La", voicePath: ""),
      Abakada(
          imagePath: Assets.images.filipino.abakada.abakadaLa.path,
          label: "La-pis",
          mainContent: "",
          voicePath: "",
          subContent: ["La", "Le", "Li", "Lo", "Lu"]),
    ],
    [
      Abakada(imagePath: "", label: "", mainContent: "Ma", voicePath: ""),
      Abakada(
          imagePath: Assets.images.filipino.abakada.abakadaMa.path,
          label: "Ma-ta",
          mainContent: "",
          voicePath: "",
          subContent: ["Ma", "Me", "Mi", "Mo", "Mu"]),
    ],
    [
      Abakada(imagePath: "", label: "", mainContent: "Na", voicePath: ""),
      Abakada(
          imagePath: Assets.images.filipino.abakada.abakadaNa.path,
          label: "Na-nay",
          mainContent: "",
          voicePath: "",
          subContent: ["Na", "Ne", "Ni", "No", "Nu"]),
    ],
    [
      Abakada(imagePath: "", label: "", mainContent: "Nga", voicePath: ""),
      Abakada(
          imagePath: Assets.images.filipino.abakada.abakadaNga.path,
          label: "Ngi-pin",
          mainContent: "",
          voicePath: "",
          subContent: ["Nga", "Nge", "Ngi", "Ngo", "Ngu"]),
    ],
    [
      Abakada(imagePath: "", label: "", mainContent: "Pa", voicePath: ""),
      Abakada(
          imagePath: Assets.images.filipino.abakada.abakadaPa.path,
          label: "Pa-paya",
          mainContent: "",
          voicePath: "",
          subContent: ["Pa", "Pe", "Pi", "Po", "Pu"]),
    ],
    [
      Abakada(imagePath: "", label: "", mainContent: "Ra", voicePath: ""),
      Abakada(
          imagePath: Assets.images.filipino.abakada.abakadaRa.path,
          label: "Ra-dyo",
          mainContent: "",
          voicePath: "",
          subContent: ["Ra", "Re", "Ri", "Ro", "Ru"]),
    ],
    [
      Abakada(imagePath: "", label: "", mainContent: "Sa", voicePath: ""),
      Abakada(
          imagePath: Assets.images.filipino.abakada.abakadaSa.path,
          label: "Sa-ging",
          mainContent: "",
          voicePath: "",
          subContent: ["Sa", "Se", "Si", "So", "Su"]),
    ],
    [
      Abakada(imagePath: "", label: "", mainContent: "Ta", voicePath: ""),
      Abakada(
          imagePath: Assets.images.filipino.abakada.abakadaTa.path,
          label: "Ta-sa",
          mainContent: "",
          voicePath: "",
          subContent: ["Ta", "Te", "Ti", "To", "Tu"]),
    ],
    [
      Abakada(imagePath: "", label: "", mainContent: "Wa", voicePath: ""),
      Abakada(
          imagePath: Assets.images.filipino.abakada.abakadaWa.path,
          label: "Wa-lis",
          mainContent: "",
          voicePath: "",
          subContent: ["Wa", "We", "Wi", "Wo", "Wu"]),
    ],
    [
      Abakada(imagePath: "", label: "", mainContent: "Ya", voicePath: ""),
      Abakada(
          imagePath: Assets.images.filipino.abakada.abakadaYo.path,
          label: "Yo-yo",
          mainContent: "",
          voicePath: "",
          subContent: ["Ya", "Ye", "Yi", "Yo", "Yu"]),
    ]
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      parentCarCon.jumpToPage(curIndex!);
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
                  itemCount: abakadaList.length,
                  options: CarouselOptions(
                    scrollDirection: Axis.vertical,
                    height: 500,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    initialPage: 0,
                    autoPlay: false,
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      curIndex = index;
                      prefs.setInt('abakada_current_index', index);
                    },
                  ),
                  itemBuilder: (context, index, realIndex) {
                    final CarouselSliderController childCarCon =
                        CarouselSliderController();
                    return CarouselSlider.builder(
                      carouselController: childCarCon,
                      itemCount: abakadaList[index].length,
                      options: CarouselOptions(
                        scrollDirection: Axis.horizontal,
                        height: 400,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        initialPage: 0,
                        autoPlay: false,
                        viewportFraction: 0.8,
                        onPageChanged: (index, reason) {
                          if (abakadaList.length - 1 == curIndex &&
                              abakadaList[index].length - 1 == index) {
                            prefs.setBool('abakada_quiz_unlocked', true);
                          }
                        },
                      ),
                      itemBuilder: (context, cardIndex, cardRealIndex) {
                        // return numberCards[index][cardIndex];
                        return LessonCard(
                            content:
                                abakadaContent(abakadaList[index][cardIndex]),
                            label: abakadaList[index][cardIndex].label,
                            onNext: () {
                              if (abakadaList.length - 1 == index &&
                                  abakadaList[index].length - 1 == cardIndex) {
                                prefs.setInt('abakada_current_index', 0);

                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) => FinishModuleDialog(
                                    route: widget.quizScreen,
                                    oldRoute: const FilipinoScreen(),
                                  ),
                                );
                              } else if (abakadaList[index].length - 1 ==
                                  cardIndex) {
                                childCarCon.animateToPage(0);
                                parentCarCon.nextPage();
                              } else {
                                childCarCon.nextPage();
                              }
                            },
                            onPrevious: () {
                              if (cardIndex == 0) {
                                parentCarCon.previousPage();
                              } else {
                                childCarCon.previousPage();
                              }
                            },
                            btnColor: 0xFFB169FA,
                            btnShadowColor: 0xFF782EFB,
                            showPrevBtn: index > 0 || cardIndex > 0);
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

  Widget abakadaContent(Abakada abakada) {
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
                  log("Volume Clicked!");
                }),
          ),
          Expanded(
              child: SizedBox(
                  width: double.infinity,
                  child: Center(
                      child: (abakada.mainContent != "")
                          ? Text(
                              abakada.mainContent,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontFamily: 'Poetsen One',
                                  fontSize: 120,
                                  color: Color(0xff6F53FD)),
                            )
                          : GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.4,
                                mainAxisSpacing: 2.0,
                                crossAxisSpacing: 2.0,
                              ),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: abakada.subContent!.length + 1,
                              itemBuilder: (context, index) {
                                int color = 0xFFFF6433;
                                switch (index) {
                                  case 1:
                                    color = 0xFF43D309;
                                    break;
                                  case 2:
                                    color = 0xFF3ECEFE;
                                    break;
                                  case 3:
                                    color = 0xFFDD67ED;
                                    break;
                                  case 4:
                                    color = 0xFFFFCC18;
                                    break;
                                }
                                if (index == 5) {
                                  if (abakada.imagePath == "") {
                                    return const Text("");
                                  }
                                  return Center(
                                    child: Image.asset(
                                      abakada.imagePath,
                                      width: double.infinity,
                                    ),
                                  );
                                }
                                return Container(
                                    margin: const EdgeInsets.all(5),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 3.0, color: Colors.white),
                                      borderRadius: BorderRadius.circular(8),
                                      color: Color(color),
                                    ),
                                    child: Center(
                                      child: Text(
                                        abakada.subContent![index],
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontFamily: 'Poetsen One',
                                            fontSize: 40,
                                            color: Colors.white),
                                      ),
                                    ));
                              },
                            )))),
        ],
      ),
    );
  }
}
