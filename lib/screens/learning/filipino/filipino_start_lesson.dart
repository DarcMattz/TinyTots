import 'package:flutter/material.dart';
import 'package:tinytots/components/start_card.dart';
import 'package:tinytots/components/top_bar.dart';
import 'package:tinytots/screens/learning/filipino/filipino.dart';

class FilipinoStartLessonScreen extends StatelessWidget {
  final String imagePath;
  final Widget route;

  const FilipinoStartLessonScreen(
      {super.key, required this.imagePath, required this.route});

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
              TopBar(oldScreen: FilipinoScreen()),
              Expanded(
                child: StartCard(
                  imagePath: imagePath,
                  route: route,
                  oldRoute: const FilipinoScreen(),
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
