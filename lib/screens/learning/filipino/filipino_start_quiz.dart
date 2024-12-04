import 'package:flutter/material.dart';
import 'package:tinytots/components/top_bar.dart';
import 'package:tinytots/components/utils/nice_button.dart';
import 'package:tinytots/screens/learning/filipino/filipino.dart';

class FilipinoStartQuizScreen extends StatelessWidget {
  final String title;
  final String instruction;
  final Widget route;
  const FilipinoStartQuizScreen(
      {super.key,
      required this.title,
      required this.instruction,
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
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TopBar(oldScreen: FilipinoScreen()),
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
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            constraints: const BoxConstraints(
                              minHeight: 250,
                              minWidth: double.infinity,
                            ),
                            margin: const EdgeInsets.only(top: 15.0),
                            width: double.infinity,
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFF95E9FF),
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  title,
                                  style: const TextStyle(
                                    fontFamily: 'Poetsen One',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFA659FE),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  instruction,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontFamily: 'Poetsen One',
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(6, 20, 6, 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                NiceButton(
                                  label: "Back",
                                  color: Colors.yellow,
                                  shadowColor: Colors.yellow[800]!,
                                  icon: Icons.close,
                                  iconSize: 30,
                                  method: () {
                                    Navigator.pop(context);
                                  },
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
                                      MaterialPageRoute(builder: (_) => route),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  Positioned(
                    top: -10,
                    child: Image.asset(
                      'assets/images/koala.png',
                      width: 160,
                      height: 160,
                    ),
                  ),
                ],
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
