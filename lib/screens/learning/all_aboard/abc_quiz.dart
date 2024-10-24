import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/utils/nice_button.dart';
import 'package:flutter_application_1/screens/learning/all_aboard/quizes/abc.dart';

class AbcQuizStart extends StatelessWidget {
  const AbcQuizStart({super.key});

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

class AndroidWelcome extends StatelessWidget {
  const AndroidWelcome({
    super.key,
    required this.constraints,
  });
  final BoxConstraints constraints;
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
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/sun.png',
                  width: 120,
                  height: 120,
                ),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          const Text(
                            'Explore a world of fun learning\nwith our interactive activities.\nJoin us on an exciting journey\nof discovery and growth. Let’s\nlearn together!',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    Row(
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
                              MaterialPageRoute(
                                  builder: (_) => AbcQuizScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -40,
                child: Image.asset(
                  'assets/images/koala.png',
                  width: 200,
                  height: 200,
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
                child: Image.asset(
                  'assets/images/cow.png',
                  width: 200,
                  height: 200,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
