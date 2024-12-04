import 'package:flutter/material.dart';
import 'package:tinytots/components/push_replacement.dart';
import 'package:tinytots/helper/audio_service.dart';
import 'package:tinytots/components/utils/nice_button.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class FinishModuleDialog extends StatefulWidget {
  final Widget route;
  final Widget oldRoute;

  const FinishModuleDialog({
    super.key,
    required this.route,
    required this.oldRoute,
  });

  @override
  State<FinishModuleDialog> createState() => _FinishModuleDialogState();
}

class _FinishModuleDialogState extends State<FinishModuleDialog> {
  final AudioService _audioService = AudioService();

  @override
  void initState() {
    super.initState();
    _play();
  }

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }

  void _play() {
    _audioService.playFromAssets("sounds/ready.m4a");
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
                const Gap(40),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Are you ready to take your quiz?",
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
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
                        child: widget.oldRoute,
                      ),
                      child: NiceButton(
                        label: "Back",
                        color: Colors.yellow,
                        shadowColor: Colors.yellow[800]!,
                        icon: Icons.close,
                        iconSize: 30,
                        method: () {
                          Navigator.pop(context);
                          if (context.mounted) {
                            Navigator.pushReplacement(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                alignment: Alignment.center,
                                child: widget.oldRoute,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    NiceButton(
                      label: "Go",
                      color: const Color.fromARGB(255, 87, 210, 91),
                      shadowColor: Colors.green[800]!,
                      icon: Icons.check_rounded,
                      iconSize: 30,
                      method: () {
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            alignment: Alignment.center,
                            child: widget.route,
                          ),
                        );
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
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "COMPLETED",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
