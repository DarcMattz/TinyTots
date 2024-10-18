import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/utils/circle_button.dart';
import 'package:flutter_application_1/models/all_aboard/letter.dart';
import 'package:gap/gap.dart';

class LetterCard extends StatefulWidget {
  final Letter letter;
  final void Function() nextCallback;
  final void Function() prevCallback;
  final void Function() soundCallback;
  final bool isFirst;

  const LetterCard({
    super.key,
    required this.nextCallback,
    required this.prevCallback,
    required this.letter,
    this.isFirst = false,
    required this.soundCallback,
  });

  @override
  State<LetterCard> createState() => _LetterCardState();
}

class _LetterCardState extends State<LetterCard> {
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
                    child: Center(
                      child: AutoSizeText(
                        widget.letter.letter,
                        style:
                            TextStyle(fontSize: 200, color: Colors.purple[700]),
                        maxLines: 1,
                      ),
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
              if (!widget.isFirst)
                CircleButton(
                  color: Colors.amberAccent,
                  shadowColor: Colors.yellow,
                  icon: Icons.arrow_back_rounded,
                  method: widget.prevCallback,
                ),
              const Gap(10),
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
