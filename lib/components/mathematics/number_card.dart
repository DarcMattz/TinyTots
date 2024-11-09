import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/components/utils/circle_button.dart';
import 'package:flutter_application_1/models/mathematics/number_only.dart';
import 'package:flutter_application_1/screens/learning/mathematics/mathematics.dart';

import '../../screens/learning/mathematics/numbers_quiz.dart';
import '../../dialogs/finish_module_dialog.dart';

class NumberCard extends StatefulWidget {
  final NumberOnly number;
  final CarouselSliderController? parentCarCon, childCarCon;
  final int rowCurIndex, colCurIndex;
  final bool withSound;
  final void Function() sound;

  const NumberCard({
    super.key,
    required this.number,
    this.parentCarCon,
    this.childCarCon,
    required this.sound,
    required this.withSound,
    required this.colCurIndex,
    required this.rowCurIndex,
  });

  @override
  State<NumberCard> createState() => _NumberCardState();
}

class _NumberCardState extends State<NumberCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(6),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(children: [
                Container(
                  padding: const EdgeInsets.all(30.0),
                  height: double.infinity,
                  child: Image.asset(
                    widget.number.numberImage,
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),
                if (widget.withSound)
                  Positioned(
                    right: 5.0,
                    top: 5.0,
                    child: CircleButton(
                        color: Colors.purpleAccent,
                        shadowColor: Colors.purple,
                        icon: Icons.volume_up_rounded,
                        method: widget.sound),
                  ),
              ]),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleButton(
                color: Colors.amberAccent,
                shadowColor: Colors.amber,
                icon: Icons.arrow_back_rounded,
                method: () {
                  if (widget.rowCurIndex > 0) {
                    widget.childCarCon!.previousPage();
                  } else {
                    widget.parentCarCon!.previousPage();
                  }
                },
              ),
              const SizedBox(
                height: 10.0,
                width: 10.0,
              ),
              CircleButton(
                color: Colors.amberAccent,
                shadowColor: Colors.amber,
                icon: Icons.arrow_forward_rounded,
                method: () {
                  if (widget.colCurIndex <= 9) {
                    if (widget.rowCurIndex == 1) {
                      widget.parentCarCon!.nextPage();
                      widget.childCarCon!.animateToPage(0);
                    } else {
                      widget.childCarCon!.nextPage();
                    }
                  } else {
                    if (widget.rowCurIndex == 9) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const FinishModuleDialog(
                          route: NumbersQuizScreen(),
                          oldRoute: MathematicsScreen(),
                        ),
                      );
                    } else {
                      widget.childCarCon!.nextPage();
                    }
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
