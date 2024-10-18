import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/utils/circle_button.dart';
import 'package:flutter_application_1/models/all_aboard/letter_trace.dart';
import 'package:gap/gap.dart';

class LetterTraceCard extends StatefulWidget {
  final Trace trace;
  final void Function() nextCallback;
  final void Function() prevCallback;

  const LetterTraceCard({
    super.key,
    required this.nextCallback,
    required this.prevCallback,
    required this.trace,
  });

  @override
  State<LetterTraceCard> createState() => _LetterTraceCardState();
}

class _LetterTraceCardState extends State<LetterTraceCard> {
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
              child: Container(
                padding: const EdgeInsets.all(30.0),
                height: double.infinity,
                child: Image.asset(
                  widget.trace.imagePath,
                  fit: BoxFit.contain,
                  width: double.infinity,
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
              CircleButton(
                color: Colors.amberAccent,
                shadowColor: Colors.yellow,
                icon: Icons.arrow_back_rounded,
                method: widget.prevCallback,
              ),
              Gap(10),
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
