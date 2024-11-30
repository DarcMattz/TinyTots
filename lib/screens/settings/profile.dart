import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/push_replacement.dart';
import 'package:flutter_application_1/components/utils/nice_button.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_application_1/globals.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:page_transition/page_transition.dart';

class ChangeProfile extends StatelessWidget {
  const ChangeProfile({super.key, required this.oldScreen});

  final Widget oldScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return AndroidWelcome(
              constraints: constraints,
              oldScreen: oldScreen,
            );
          } else {
            return AndroidWelcome(
              constraints: constraints,
              oldScreen: oldScreen,
            );
          }
        },
      ),
    );
  }
}

class AndroidWelcome extends StatefulWidget {
  const AndroidWelcome({
    super.key,
    required this.constraints,
    required this.oldScreen,
  });
  final BoxConstraints constraints;
  final Widget oldScreen;

  @override
  State<AndroidWelcome> createState() => _AndroidWelcomeState();
}

class _AndroidWelcomeState extends State<AndroidWelcome> {
  int _currentIndex = 0;

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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: PushReplacement(
                    route: PageTransition(
                      type: PageTransitionType.scale,
                      alignment: Alignment.center,
                      child: widget.oldScreen,
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
                              child: widget.oldScreen,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xffA77DFE),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "Choose Avatar",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      CarouselSlider.builder(
                        itemCount: 2,
                        options: CarouselOptions(
                          scrollDirection: Axis.horizontal,
                          height: 400,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          initialPage: 0,
                          autoPlay: false,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        ),
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18.0),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: List.generate(
                                5,
                                (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        prefs.setString(
                                            'avatar',
                                            avatars[itemIndex][index]
                                                .toString());
                                        Navigator.pop(context);
                                        Navigator.pushReplacement(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            alignment: Alignment.center,
                                            child: widget.oldScreen,
                                          ),
                                        );
                                      });
                                    },
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Colors.white,
                                      child: Image.asset(
                                          avatars[itemIndex][index]),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(2, (index) {
                            return GestureDetector(
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentIndex == index
                                      ? Colors.blueAccent
                                      : Colors.grey,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

List avatars = [
  [
    Assets.images.avatars.boy1.path,
    Assets.images.avatars.boy2.path,
    Assets.images.avatars.boy3.path,
    Assets.images.avatars.boy4.path,
    Assets.images.avatars.boy5.path,
  ],
  [
    Assets.images.avatars.girl1.path,
    Assets.images.avatars.girl2.path,
    Assets.images.avatars.girl3.path,
    Assets.images.avatars.girl4.path,
    Assets.images.avatars.girl5.path,
  ],
];
