import 'package:flutter/material.dart';
import 'package:tinytots/components/utils/circle_button.dart';
import 'package:tinytots/models/science/body.dart';

class BodyCard extends StatefulWidget {
  final Body body;
  final void Function() nextCallback;
  final void Function() prevCallback;
  final void Function() soundCallback;

  const BodyCard({
    super.key,
    required this.body,
    required this.nextCallback,
    required this.prevCallback,
    required this.soundCallback,
  });

  @override
  State<BodyCard> createState() => _BodyCardState();
}

class _BodyCardState extends State<BodyCard> {
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                        widget.body.imagePath,
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
                  widget.body.label,
                  style: const TextStyle(
                    fontSize: 20,
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
      ),
    );
  }
}
