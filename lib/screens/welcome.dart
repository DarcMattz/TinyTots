import 'package:flutter/material.dart';
import 'package:tinytots/components/utils/nice_button.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/globals.dart';
import 'package:tinytots/helper/audio_service.dart';
import 'package:tinytots/screens/home.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return TabletWelcome(
            constraints: constraints,
          );
        } else {
          return AndroidWelcome(
            constraints: constraints,
          );
        }
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
  final AudioService _audioService = AudioService();

  @override
  void initState() {
    prefs.setBool('isFirstTime', false);
    _audioService.playFromAssets("sounds/welcome.m4a");
    super.initState();
  }

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Assets.images.sun.image(height: 120),
              ),
            ],
          ),
          const Spacer(),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(30, 100, 30, 10),
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
                child: Container(
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Welcome,',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff6F53FD),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Explore a world of fun learning\nwith our interactive activities.\nJoin us on an exciting journey\nof discovery and growth. Let’s\nlearn together!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: widget.constraints.maxHeight * .019,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      LayoutBuilder(builder: (context, constraints) {
                        return NiceButton(
                          width: constraints.maxWidth,
                          isIconRight: true,
                          label: 'Continue',
                          color: const Color(0xffFFB213),
                          shadowColor: const Color(0xffFF8413),
                          icon: Icons.arrow_forward,
                          iconSize: 30,
                          method: () {
                            _audioService.stop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const HomeScreen(),
                              ),
                            );
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -40,
                child: Assets.images.koala.image(height: 200),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0, right: 30),
                child: Assets.images.cow.image(height: 200),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TabletWelcome extends StatefulWidget {
  const TabletWelcome({
    super.key,
    required this.constraints,
  });

  final BoxConstraints constraints;

  @override
  State<TabletWelcome> createState() => _TabletWelcomeState();
}

class _TabletWelcomeState extends State<TabletWelcome> {
  final AudioService _audioService = AudioService();

  @override
  void initState() {
    _audioService.playFromAssets("sounds/welcome.m4a");
    super.initState();
  }

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.lightBlueAccent,
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/images/sun.png',
                  width: 200,
                  height: 200,
                ),
              ),
            ],
          ),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(120, 150, 120, 20),
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
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
                child: Container(
                  padding: const EdgeInsets.all(
                      24.0), // Larger padding for inner container
                  decoration: BoxDecoration(
                    color: const Color(0xff95E9FF),
                    borderRadius: BorderRadius.circular(15.0),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome,',
                        style: TextStyle(
                          fontSize: 60, // Larger text for tablet
                          fontWeight: FontWeight.bold,
                          color: Color(0xff6F53FD),
                        ),
                      ),
                      const SizedBox(height: 15), // More spacing for tablet
                      const Text(
                        'Explore a world of fun learning\nwith our interactive activities.\nJoin us on an exciting journey\nof discovery and growth. Let’s\nlearn together!',
                        style: TextStyle(
                          fontSize: 35, // Larger text size for tablet
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20), // More spacing before button
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return NiceButton(
                            width: constraints.maxWidth,
                            height: 60,
                            isIconRight: true,
                            label: 'Continue',
                            fontSize: 30,
                            color: const Color(0xffFFB213),
                            shadowColor: const Color(0xffFF8413),
                            icon: Icons.arrow_forward,
                            iconSize: 40, // Larger icon size for tablet
                            method: () {
                              _audioService.stop();
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const HomeScreen(),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -50,
                child: Image.asset(
                  'assets/images/koala.png',
                  width: 270,
                  height: 270,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 100,
                ),
                child: Image.asset(
                  'assets/images/cow.png',
                  width: 270,
                  height: 270,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
