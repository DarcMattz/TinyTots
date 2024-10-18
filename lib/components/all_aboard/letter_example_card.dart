import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/utils/circle_button.dart';
import 'package:flutter_application_1/models/all_aboard/letter_example.dart';

class LetterExampleCard extends StatefulWidget {
  final LetterExample letterExample;
  final void Function() nextCallback;
  final void Function() prevCallback;
  final void Function() soundCallback;

  const LetterExampleCard({
    super.key,
    required this.nextCallback,
    required this.prevCallback,
    required this.letterExample,
    required this.soundCallback,
  });

  @override
  State<LetterExampleCard> createState() => _LetterExampleCardState();
}

class _LetterExampleCardState extends State<LetterExampleCard> {
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
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(30.0),
                    height: double.infinity,
                    child: Image.asset(
                      widget.letterExample.imagePath,
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
                      method: widget.soundCallback,
                    ),
                  ),
                ],
              ),
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
                shadowColor: Colors.yellow,
                icon: Icons.arrow_back_rounded,
                method: widget.prevCallback,
              ),
              Text(
                widget.letterExample.label,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.orange,
                ),
              ),
              CircleButton(
                color: Colors.amberAccent,
                shadowColor: Colors.yellow,
                icon: Icons.arrow_forward_rounded,
                method: widget.nextCallback,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
