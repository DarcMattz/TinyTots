import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/utils/circle_button.dart';
import 'package:flutter_application_1/models/science/care.dart';
import 'package:gap/gap.dart';

class CareCard extends StatefulWidget {
  final Care care;
  final void Function() nextCallback;
  final void Function() prevCallback;
  final void Function() soundCallback;

  const CareCard({
    super.key,
    required this.care,
    required this.nextCallback,
    required this.prevCallback,
    required this.soundCallback,
  });

  @override
  State<CareCard> createState() => _CareCardState();
}

class _CareCardState extends State<CareCard> {
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
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              widget.care.description,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.purple[400],
                              ),
                            ),
                          ),
                          const Gap(10),
                          Expanded(
                            child: Image.asset(
                              widget.care.imagePath,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Gap(10),
                        ],
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
                  const Gap(10),
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
  }
}
