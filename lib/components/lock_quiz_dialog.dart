import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/utils/circle_button.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';

class LockQuizDialog extends StatelessWidget {
  const LockQuizDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Card(
              color: Color(0xff95E9FF),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: const Text(
                      'It is not unlocked yet. Please finish the course first.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xffA659FE),
                      ),
                    ),
                  ),
                  Assets.images.lockDog.image(
                    height: 100,
                  )
                ],
              ),
            ),
            Positioned(
              top: -5,
              right: 0,
              child: CircleButton(
                color: Colors.purpleAccent,
                shadowColor: Colors.purple,
                icon: Icons.close,
                method: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
