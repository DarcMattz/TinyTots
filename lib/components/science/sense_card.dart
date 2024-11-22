import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/utils/circle_button.dart';
import 'package:flutter_application_1/models/science/sense.dart';

class SenseCard extends StatefulWidget {
  final Sense sense;
  final void Function() nextCallback;
  final void Function() prevCallback;
  final void Function() soundCallback;

  const SenseCard({
    super.key,
    required this.sense,
    required this.nextCallback,
    required this.prevCallback,
    required this.soundCallback,
  });

  @override
  State<SenseCard> createState() => _SenseCardState();
}

class _SenseCardState extends State<SenseCard> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
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
                          widget.sense.imagePath,
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
                      widget.sense.label,
                      style: const TextStyle(
                        fontSize: 18,
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
        ),
      );
    });
  }
}
