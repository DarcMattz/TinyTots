import 'package:flutter/material.dart';
import 'package:tinytots/components/push_replacement.dart';
import 'package:tinytots/components/utils/nice_button.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tinytots/screens/explore.dart';

class ExploreFinishDialog extends StatefulWidget {
  final Function replay;
  final int points;
  final int score;
  final int highscore;
  final Widget star;
  final int remainingTime;

  const ExploreFinishDialog({
    super.key,
    required this.replay,
    required this.points,
    required this.score,
    required this.highscore,
    required this.star,
    required this.remainingTime,
  });

  @override
  State<ExploreFinishDialog> createState() => _ExploreFinishDialogState();
}

class _ExploreFinishDialogState extends State<ExploreFinishDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(30),
                Text(
                  '+${widget.points} points',
                  style: TextStyle(
                    color: Color(0xFF4EC307),
                    fontSize: 16,
                  ),
                ),
                Text(
                  '+${widget.remainingTime} bonus',
                  style: TextStyle(
                    color: Color(0xFF4EC307),
                    fontSize: 16,
                  ),
                ),
                Text(
                  widget.highscore < widget.score ? "New High Score!" : "score",
                  style: TextStyle(
                    color: Color(0xFF60CFFF),
                    fontSize: 20,
                  ),
                ),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Color(0xffC2FDFF),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    "${widget.score}",
                    style: TextStyle(
                      color: Color(0xFF228AED),
                      fontSize: 28,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Gap(12),
                Text(
                  'High Score',
                  style: TextStyle(
                    color: Color(0xFF60CFFF),
                    fontSize: 16,
                  ),
                ),
                Text(
                  widget.highscore.toString(),
                  style: TextStyle(
                    color: Color(0xFF228AED),
                    fontSize: 20,
                  ),
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PushReplacement(
                      route: PageTransition(
                        type: PageTransitionType.scale,
                        alignment: Alignment.center,
                        child: const ExploreListScreen(),
                      ),
                      child: NiceButton(
                        label: "Back",
                        color: const Color(0xFFFF8413),
                        shadowColor: const Color(0xFFFF8413),
                        icon: Icons.arrow_back,
                        iconSize: 30,
                        method: () {
                          Navigator.pop(context);
                          if (context.mounted) {
                            Navigator.pushReplacement(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                alignment: Alignment.center,
                                child: const ExploreListScreen(),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    NiceButton(
                      label: "Retry",
                      color: Color(0xff43D309),
                      shadowColor: Color(0xff43D309),
                      icon: Icons.replay,
                      iconSize: 30,
                      isIconRight: true,
                      method: () {
                        widget.replay();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: -50,
            child: Container(
              width: 500,
              height: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/ribbon.png'),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      widget.remainingTime == 0 ? "Time's up!" : "Well Done!",
                      style: const TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -100,
            right: 30,
            left: 30,
            child: widget.star,
          ),
        ],
      ),
    );
  }
}
