import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/utils/circle_button.dart';
import 'package:flutter_application_1/models/vowels/vowel.dart';

class VowelCard extends StatefulWidget {
  final Vowel vowel;
  final void Function() nextCallback;
  final void Function() prevCallback;
  final void Function() soundCallback;

  const VowelCard({
    super.key,
    required this.nextCallback,
    required this.prevCallback,
    required this.vowel,
    required this.soundCallback,
  });

  @override
  State<VowelCard> createState() => _VowelCardState();
}

class _VowelCardState extends State<VowelCard> {
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
          Expanded(
            child: Container(
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
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Center(
                          child: AutoSizeText(
                            widget.vowel.vowel,
                            style: TextStyle(
                                fontSize: 200, color: Colors.purple[700]),
                            maxLines: 1,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Image.asset(
                                widget.vowel.imagePath,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleButton(
                  color: Colors.amberAccent,
                  shadowColor: Colors.yellow,
                  icon: Icons.arrow_back_rounded,
                  method: widget.prevCallback,
                ),
                Text(
                  widget.vowel.imageName,
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
          ),
        ],
      ),
    );
  }
}
