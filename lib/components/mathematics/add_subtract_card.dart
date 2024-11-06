import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/utils/circle_button.dart';
import 'package:flutter_application_1/models/mathematics/number_only.dart';
import 'package:flutter_application_1/screens/learning/mathematics/mathematics.dart';
import 'package:flutter_application_1/screens/learning/mathematics/numbers_quiz.dart';
import '../finish_module_dialog.dart';

class NumbersLessonThreeCard extends StatefulWidget {
  final NumberOnly number;
  final CarouselSliderController? carCon;
  final int currentIndex;
  final int totalNumbers;

  const NumbersLessonThreeCard({
    super.key,
    required this.number,
    this.carCon,
    required this.currentIndex,
    required this.totalNumbers,
  });

  @override
  State<NumbersLessonThreeCard> createState() => _NumbersLessonThreeCardState();
}

class _NumbersLessonThreeCardState extends State<NumbersLessonThreeCard> {
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
              padding: const EdgeInsets.all(10.0),
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
              child: Image.asset(
                widget.number.numberImage,
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.currentIndex > 0)
                CircleButton(
                  color: Colors.amberAccent,
                  shadowColor: Colors.yellow,
                  icon: Icons.arrow_back_rounded,
                  method: () {
                    if (widget.currentIndex > 0) {
                      widget.carCon!.previousPage();
                    }
                  },
                ),
              const SizedBox(
                height: 10.0,
                width: 10.0,
              ),
              CircleButton(
                color: Colors.amberAccent,
                shadowColor: Colors.yellow,
                icon: Icons.arrow_forward_rounded,
                method: () {
                  if (widget.currentIndex == widget.totalNumbers - 1) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => const FinishModuleDialog(
                        route: NumbersQuizScreen(),
                        oldRoute: MathematicsScreen(),
                      ),
                    );
                  } else if (widget.carCon != null) {
                    widget.carCon!.nextPage();
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
