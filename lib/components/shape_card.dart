import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/utils/circle_button.dart';
import 'package:flutter_application_1/models/all_aboard/shape.dart';
import 'package:gap/gap.dart';

class ShapeCard extends StatefulWidget {
  final Shape shape;
  final void Function() nextCallback;
  final void Function() prevCallback;
  final void Function() soundCallback;
  final bool isFirst;

  const ShapeCard({
    required this.shape,
    required this.nextCallback,
    required this.prevCallback,
    required this.soundCallback,
    required this.isFirst,
  });

  @override
  State<ShapeCard> createState() => _ShapeCardState();
}

class _ShapeCardState extends State<ShapeCard> {
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
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                      padding: const EdgeInsets.all(20.0),
                      height: double.infinity,
                      child: Center(
                        child: Image.asset(
                          widget.shape.imagePath,
                          fit: BoxFit.contain,
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                !widget.isFirst
                    ? CircleButton(
                        color: Colors.amberAccent,
                        shadowColor: Colors.yellow,
                        icon: Icons.arrow_back_rounded,
                        method: widget.prevCallback,
                      )
                    : const Gap(40),
                Text(
                  widget.shape.label,
                  style: const TextStyle(
                    fontSize: 28,
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
