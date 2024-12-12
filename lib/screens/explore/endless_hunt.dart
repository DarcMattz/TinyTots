import 'package:flutter/material.dart';
import 'package:tinytots/components/push_replacement.dart';
import 'package:tinytots/components/top_bar.dart';
import 'package:tinytots/components/utils/nice_button.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/helper/audio_service.dart';
import 'package:tinytots/screens/explore.dart';
import 'package:tinytots/screens/explore/camera_views/endless_hunt_camera_view.dart';
import 'package:page_transition/page_transition.dart';

class EndlessHunt extends StatelessWidget {
  const EndlessHunt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return AndroidWelcome(
          constraints: constraints,
        );
      }),
    );
  }
}

class AndroidWelcome extends StatefulWidget {
  const AndroidWelcome({
    super.key,
    required this.constraints,
  });
  final BoxConstraints constraints;

  @override
  State<AndroidWelcome> createState() => _AndroidWelcomeState();
}

class _AndroidWelcomeState extends State<AndroidWelcome> {
  final AudioService audioService = AudioService();

  void _play() async {
    await audioService.playFromAssets("sounds/explore/endless_hunt.m4a");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _play();
  }

  @override
  void dispose() {
    super.dispose();
    audioService.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        image: DecorationImage(
          image: Assets.images.background.provider(),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TopBar(oldScreen: ExploreListScreen()),
            const Spacer(),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: const EdgeInsets.all(30),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1),
                        offset: const Offset(0, 3),
                      ),
                      BoxShadow(
                        color: Colors.grey.withOpacity(.3),
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(18.0),
                        decoration: BoxDecoration(
                          color: const Color(0xff95E9FF),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            const BoxShadow(
                              color: Color(0xff3ECEFE),
                              offset: Offset(0, 3),
                            ),
                            BoxShadow(
                              color: Colors.grey.withOpacity(.3),
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Endless Hunt',
                              style: TextStyle(
                                fontSize: widget.constraints.maxWidth * .057,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff6F53FD),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Keep finding the items that the game suggests. No limits, just have fun!',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            Assets.images.explore.endless.image(
                              width: widget.constraints.maxWidth * .4,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
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
                              color: Colors.yellow,
                              shadowColor: Colors.yellow[800]!,
                              icon: Icons.close,
                              iconSize: 30,
                              method: () {
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
                            label: "Go",
                            color: const Color.fromARGB(255, 87, 210, 91),
                            shadowColor: Colors.green[800]!,
                            icon: Icons.check_rounded,
                            iconSize: 30,
                            method: () {
                              Navigator.pushReplacement(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  alignment: Alignment.center,
                                  child: const EndlessHuntCameraView(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, right: 30),
                  child: Assets.images.cow.image(
                    height: widget.constraints.maxHeight * .20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
