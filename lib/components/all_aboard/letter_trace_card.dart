import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tinytots/components/utils/circle_button.dart';
import 'package:tinytots/components/utils/undo_button.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/models/all_aboard/letter_trace.dart';
import 'package:gap/gap.dart';
import 'package:scribble/scribble.dart';

class LetterTraceCard extends StatefulWidget {
  final Trace trace;
  final void Function() nextCallback;
  final ScribbleNotifier scribbleNotifier;
  final void Function() prevCallback;

  const LetterTraceCard({
    super.key,
    required this.nextCallback,
    required this.prevCallback,
    required this.scribbleNotifier,
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
            child: LayoutBuilder(builder: (context, constraints) {
              return Container(
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
                    // Container(
                    //   padding: const EdgeInsets.all(30.0),
                    //   height: double.infinity,
                    //   child: Image.asset(
                    //     widget.trace.imagePath,
                    //     fit: BoxFit.contain,
                    //     width: double.infinity,
                    //   ),
                    // ),
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: Image.asset(
                            widget.trace.imagePath,
                          ).image,
                          fit: BoxFit.contain,
                        ),
                      ),
                      child: Scribble(notifier: widget.scribbleNotifier),
                    ),
                    Positioned(
                      right: 5.0,
                      top: 5.0,
                      child: UndoButton(
                        color: Colors.orange,
                        shadowColor: Colors.orange,
                        icon: Icons.undo,
                        method: () {
                          widget.scribbleNotifier.undo();
                        },
                        longPressMethod: () {
                          widget.scribbleNotifier.clear();
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),
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
