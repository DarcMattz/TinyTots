import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/top_bar.dart';
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
      // width: double.infinity,
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Image.asset(
          //         'assets/images/sun.png',
          //         width: 120,
          //         height: 120,
          //       ),
          //     ),
          //   ],
          // ),
          const TopBar(),
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
                          const Text(
                            'LETTER MATCHING',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff6F53FD),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Tap the correct picture that matches the letter shown.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Image.asset(
                            'assets/images/quizes/alphabet/letter_matching.png',
                            height: constraints.maxHeight * 0.2,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
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
                                  builder: (_) => const AbcQuizScreen()),
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
