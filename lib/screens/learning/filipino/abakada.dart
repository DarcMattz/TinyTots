import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/dialogs/finish_module_dialog.dart';
import 'package:flutter_application_1/components/lesson_card.dart';
// import 'package:flutter_application_1/components/letter_card.dart';
// import 'package:flutter_application_1/components/nice_button.dart';
// import 'package:flutter_application_1/components/shape_card.dart';
import 'package:flutter_application_1/components/top_bar.dart';
// import 'package:flutter_application_1/models/all_aboard/shape.dart';
// import 'package:flutter_application_1/screens/learning/filipino/abakada_quiz.dart';
import 'package:flutter_application_1/components/utils/circle_button.dart';
import 'package:flutter_application_1/screens/learning/filipino/filipino.dart';
// import 'package:flutter_application_1/models/shape.dart';
// import 'package:flutter_application_1/screens/learning/filipino/filipino_start_quiz.dart';
import 'package:gap/gap.dart';

class Abakada {
  final String imagePath;
  final String label;
  final String voicePath;
  final String mainContent;
  final List<String>? subContent;

  Abakada(
      {required this.label,
      required this.imagePath,
      required this.voicePath,
      required this.mainContent,
      this.subContent});
}

class AbakadaScreen extends StatefulWidget {
  final Widget quizScreen;
  const AbakadaScreen({super.key, required this.quizScreen});

  @override
  State<AbakadaScreen> createState() => _AbakadaScreenState();
}

class _AbakadaScreenState extends State<AbakadaScreen> {
  final CarouselSliderController parentCarCon = CarouselSliderController();

  final List<List<Abakada>> abakadaList = [
    [
      Abakada(imagePath: "", label: "", mainContent: "Aa", voicePath: ""),
      Abakada(
          imagePath: "assets/images/filipino/abakada_Aa.png",
          label: "A-so",
          mainContent: "",
          voicePath: "",
          subContent: ["a", "e", "i", "o", "u"]),
      Abakada(imagePath: "", label: "", mainContent: "Ba", voicePath: ""),
      Abakada(
          imagePath: "assets/images/filipino/abakada_Ba.png",
          label: "Ba-ka",
          mainContent: "",
          voicePath: "",
          subContent: ["Ba", "Be", "Bi", "Bo", "Bu"]),
      Abakada(imagePath: "", label: "", mainContent: "Ka", voicePath: ""),
      Abakada(
          imagePath: "assets/images/filipino/abakada_Ka.png",
          label: "Ka-bayo",
          mainContent: "",
          voicePath: "",
          subContent: ["Ka", "Ke", "Ki", "Ko", "Ku"]),
      Abakada(imagePath: "", label: "", mainContent: "Da", voicePath: ""),
      Abakada(
          imagePath: "assets/images/filipino/abakada_Da.png",
          label: "Da-ga",
          mainContent: "",
          voicePath: "",
          subContent: ["Da", "De", "Di", "Do", "Du"]),
    ],
    [
      Abakada(imagePath: "", label: "", mainContent: "Ga", voicePath: ""),
      Abakada(
          imagePath: "assets/images/filipino/abakada_Ga.png",
          label: "Ga-gamba",
          mainContent: "",
          voicePath: "",
          subContent: ["Ga", "Ge", "Gi", "Go", "Gu"]),
      Abakada(imagePath: "", label: "", mainContent: "Ha", voicePath: ""),
      Abakada(
          imagePath: "assets/images/filipino/abakada_Ha.png",
          label: "Ha-laman",
          mainContent: "",
          voicePath: "",
          subContent: ["Ha", "He", "Hi", "Ho", "Hu"]),
      Abakada(imagePath: "", label: "", mainContent: "La", voicePath: ""),
      Abakada(
          imagePath: "assets/images/filipino/abakada_La.png",
          label: "La-pis",
          mainContent: "",
          voicePath: "",
          subContent: ["La", "Le", "Li", "Lo", "Lu"]),
      Abakada(imagePath: "", label: "", mainContent: "Ma", voicePath: ""),
      Abakada(
          imagePath: "assets/images/filipino/abakada_Ma.png",
          label: "Ma-ta",
          mainContent: "",
          voicePath: "",
          subContent: ["Ma", "Me", "Mi", "Mo", "Mu"]),
    ],
    [
      Abakada(imagePath: "", label: "", mainContent: "Na", voicePath: ""),
      Abakada(
          imagePath: "assets/images/filipino/abakada_Na.png",
          label: "Na-nay",
          mainContent: "",
          voicePath: "",
          subContent: ["Na", "Ne", "Ni", "No", "Nu"]),
      Abakada(imagePath: "", label: "", mainContent: "Nga", voicePath: ""),
      Abakada(
          imagePath: "assets/images/filipino/abakada_Nga.png",
          label: "Ngi-pin",
          mainContent: "",
          voicePath: "",
          subContent: ["Nga", "Nge", "Ngi", "Ngo", "Ngu"]),
      Abakada(imagePath: "", label: "", mainContent: "Pa", voicePath: ""),
      Abakada(
          imagePath: "assets/images/filipino/abakada_Pa.png",
          label: "Pa-paya",
          mainContent: "",
          voicePath: "",
          subContent: ["Pa", "Pe", "Pi", "Po", "Pu"]),
      Abakada(imagePath: "", label: "", mainContent: "Ra", voicePath: ""),
      Abakada(
          imagePath: "assets/images/filipino/abakada_Ra.png",
          label: "Ra-dyo",
          mainContent: "",
          voicePath: "",
          subContent: ["Ra", "Re", "Ri", "Ro", "Ru"]),
    ],
    [
      Abakada(imagePath: "", label: "", mainContent: "Sa", voicePath: ""),
      Abakada(
          imagePath: "assets/images/filipino/abakada_Sa.png",
          label: "Sa-ging",
          mainContent: "",
          voicePath: "",
          subContent: ["Sa", "Se", "Si", "So", "Su"]),
      Abakada(imagePath: "", label: "", mainContent: "Ta", voicePath: ""),
      Abakada(
          imagePath: "assets/images/filipino/abakada_Ta.png",
          label: "Ta-sa",
          mainContent: "",
          voicePath: "",
          subContent: ["Ta", "Te", "Ti", "To", "Tu"]),
      Abakada(imagePath: "", label: "", mainContent: "Wa", voicePath: ""),
      Abakada(
          imagePath: "assets/images/filipino/abakada_Wa.png",
          label: "Wa-lis",
          mainContent: "",
          voicePath: "",
          subContent: ["Wa", "We", "Wi", "Wo", "Wu"]),
      Abakada(imagePath: "", label: "", mainContent: "Ya", voicePath: ""),
      Abakada(
          imagePath: "assets/images/filipino/abakada_Yo.png",
          label: "Yo-yo",
          mainContent: "",
          voicePath: "",
          subContent: ["Ya", "Ye", "Yi", "Yo", "Yu"]),
    ]
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
                  itemCount: abakadaList.length,
                  options: CarouselOptions(
                    scrollDirection: Axis.vertical,
                    height: 500,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    initialPage: 0,
                    autoPlay: false,
                    viewportFraction: 0.8,
                  ),
                  itemBuilder: (context, index, realIndex) {
                    final CarouselSliderController childCarCon =
                        CarouselSliderController();
                    return GestureDetector(
                      onTap: () {},
                      child: CarouselSlider.builder(
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
                        ),
                        itemBuilder: (context, cardIndex, cardRealIndex) {
                          // return numberCards[index][cardIndex];
                          return LessonCard(
                              content:
                                  abakadaContent(abakadaList[index][cardIndex]),
                              label: abakadaList[index][cardIndex].label,
                              onNext: () {
                                if (abakadaList.length - 1 == index &&
                                    abakadaList[index].length - 1 ==
                                        cardIndex) {
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
                  print("Volume Clicked!");
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
