import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/utils/circle_button.dart';

class LessonCard extends StatefulWidget {
  final Widget content;
  final String label;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final bool showPrevBtn;
  final int btnColor;
  final int btnShadowColor;

  const LessonCard(
      {super.key,
      required this.content,
      required this.label,
      required this.onNext,
      required this.onPrevious,
      this.showPrevBtn = true,
      required this.btnColor,
      required this.btnShadowColor});

  @override
  State<LessonCard> createState() => _LessonCardState();
}

class _LessonCardState extends State<LessonCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
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
          Expanded(child: widget.content),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.showPrevBtn
                    ? CircleButton(
                        color: Color(widget.btnColor),
                        shadowColor: Color(widget.btnColor),
                        icon: Icons.arrow_back_rounded,
                        method: widget.onPrevious,
                      )
                    : const SizedBox(
                        width: 40.0,
                      ),
                Text(
                  widget.label,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Color(0xFF6F53FD),
                  ),
                ),
                CircleButton(
                  color: Color(widget.btnColor),
                  shadowColor: Color(widget.btnColor),
                  icon: Icons.arrow_forward_rounded,
                  method: widget.onNext,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
