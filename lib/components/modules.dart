import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/dialogs/lock_quiz_dialog.dart';
import 'package:flutter_application_1/components/utils/nice_button.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:page_transition/page_transition.dart';

class Module {
  final String type;
  final String imagePath;
  final Widget route;
  bool isFinished;
  final bool isQuiz;
  int score;

  Module({
    this.isFinished = false,
    this.isQuiz = false,
    this.score = 0,
    required this.type,
    required this.imagePath,
    required this.route,
  });
}

class ModuleCard extends StatelessWidget {
  final Module module;

  const ModuleCard({super.key, required this.module});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.all(constraints.maxHeight * .04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    if (module.isQuiz ? !module.isFinished : false)
                      SizedBox(
                        height: constraints.maxHeight * .75,
                        width: constraints.maxWidth * .9,
                        child: Blur(
                          blur: 2,
                          child: Image.asset(
                            module.imagePath,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    if (!module.isQuiz || module.isFinished)
                      SizedBox(
                        height: constraints.maxHeight * .75,
                        width: constraints.maxWidth * .9,
                        child: Image.asset(
                          module.imagePath,
                          fit: BoxFit.fill,
                        ),
                      ),
                    if (module.isQuiz ? !module.isFinished : false)
                      Positioned.fill(
                        child: Center(
                          child: Icon(
                            Icons.lock_rounded,
                            color: Colors.black.withOpacity(.5),
                            size: constraints.maxHeight * .30,
                          ),
                        ),
                      ),
                    //STAR
                    if (module.isQuiz && module.isFinished)
                      SizedBox(
                        height: constraints.maxHeight * .25,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final noStar = Assets.images.star0
                                .image(width: constraints.maxWidth * .85);
                            final oneStar = Assets.images.star1
                                .image(width: constraints.maxWidth * .85);
                            final twoStar = Assets.images.star2
                                .image(width: constraints.maxWidth * .85);
                            final threeStar = Assets.images.star3
                                .image(width: constraints.maxWidth * .85);
                            return Align(
                              alignment: Alignment.center,
                              child: module.score == 100
                                  ? threeStar
                                  : module.score >= 50
                                      ? twoStar
                                      : module.score >= 25
                                          ? oneStar
                                          : noStar,
                            );
                          },
                        ),
                      ),
                  ],
                ),
                NiceButton(
                  label: module.type == 'learning'
                      ? 'Learn'
                      : module.type == 'quiz'
                          ? "Take Quiz"
                          : "Explore",
                  color: const Color(0xff4EC307),
                  shadowColor: const Color(0xff4EC307),
                  icon: Icons.play_arrow_rounded,
                  iconSize: 30,
                  enabled: module.isQuiz ? module.isFinished : true,
                  method: () {
                    if (module.type == 'learning') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => module.route),
                      );
                    } else if (module.isQuiz) {
                      if (module.isFinished) {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            alignment: Alignment.center,
                            child: module.route,
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => const LockQuizDialog(),
                        );
                      }
                    } else {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          alignment: Alignment.center,
                          child: module.route,
                        ),
                      );
                    }
                  },
                  isIconRight: true,
                  height: constraints.maxHeight * .15,
                  width: constraints.maxWidth * .9,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
