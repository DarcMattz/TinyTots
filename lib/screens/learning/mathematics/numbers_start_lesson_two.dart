import 'package:flutter/material.dart';
import 'package:tinytots/components/start_card.dart';
import 'package:tinytots/components/top_bar.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/screens/learning/mathematics/add_subtract.dart';
import 'package:tinytots/screens/learning/mathematics/mathematics.dart';

class NumbersStartLessonTwoScreen extends StatelessWidget {
  const NumbersStartLessonTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(oldScreen: MathematicsScreen()),
              Expanded(
                child: StartCard(
                  imagePath: Assets.images.mathematics.learnAddSubtract.path,
                  route: const AddSubtractScreen(),
                  oldRoute: const MathematicsScreen(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 60.0),
                    child: Image.asset(
                      'assets/images/rabbit.png',
                      height: 170,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
