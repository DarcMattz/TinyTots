import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tinytots/components/push_replacement.dart';
import 'package:tinytots/components/top_bar.dart';
import 'package:tinytots/components/utils/nice_button.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/screens/learning/filipino/filipino.dart';

class FilipinoStartQuizScreen extends StatelessWidget {
  final String title;
  final String instruction;
  final String image;
  final Widget route;
  const FilipinoStartQuizScreen(
      {super.key,
      required this.title,
      required this.instruction,
      required this.image,
      required this.route});

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
        child: LayoutBuilder(builder: (context, constraints) {
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TopBar(oldScreen: const FilipinoScreen()),
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
                                  title,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff6F53FD),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  instruction,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 10),
                                Image.asset(
                                  image,
                                  width: constraints.maxWidth * .3,
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
                                  child: const FilipinoScreen(),
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
                                          child: const FilipinoScreen(),
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
                                      child: route,
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
                        height: constraints.maxHeight * .20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
