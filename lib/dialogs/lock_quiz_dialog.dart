import 'package:flutter/material.dart';
import 'package:tinytots/gen/assets.gen.dart';

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
              color: const Color(0xff95E9FF),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      textAlign: TextAlign.center,
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
          ],
        ),
      ),
    );
  }
}
