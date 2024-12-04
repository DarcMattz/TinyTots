import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tinytots/models/mathematics/number_example.dart';

import '../utils/circle_button.dart';

class NumberWithExampleCard extends StatefulWidget {
  final NumberExample number;
  final CarouselSliderController? parentCarCon, childCarCon;
  final int rowCurIndex, colCurIndex;
  final void Function() sound;

  const NumberWithExampleCard({
    super.key,
    required this.number,
    this.parentCarCon,
    this.childCarCon,
    required this.colCurIndex,
    required this.rowCurIndex,
    required this.sound,
  });

  @override
  State<NumberWithExampleCard> createState() => _NumberWithExampleCardState();
}

class _NumberWithExampleCardState extends State<NumberWithExampleCard> {
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    widget.number.numberImage,
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  right: 5.0,
                  top: 5.0,
                  child: CircleButton(
                    color: Colors.purpleAccent,
                    shadowColor: Colors.purple,
                    icon: Icons.volume_up_rounded,
                    method: widget.sound,
                  ),
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: Container(
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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  widget.number.numberExample,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.colCurIndex > 0)
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
                      return;
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
