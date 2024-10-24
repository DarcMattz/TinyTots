import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/top_bar.dart';
import 'package:flutter_application_1/components/utils/nice_button.dart';
import 'package:gap/gap.dart';

class AbcQuizScreen extends StatelessWidget {
  const AbcQuizScreen({super.key});

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
          const TopBar(),
          const Spacer(),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: EdgeInsets.all(constraints.maxWidth * 0.15),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Aa",
                      style: TextStyle(
                        color: Color(0xff6F53FD),
                        fontSize: constraints.maxHeight * .13,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Option(constraints: constraints),
                        Gap(10),
                        Option(constraints: constraints),
                      ],
                    ),
                    Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Option(constraints: constraints),
                        Gap(10),
                        Option(constraints: constraints),
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
                padding: const EdgeInsets.only(bottom: 20.0, right: 50),
                child: Image.asset(
                  'assets/images/dog.png',
                  height: constraints.maxHeight * 0.17,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.constraints,
  });

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: FlutterLogo(
        size: constraints.maxWidth * .18,
      ),
    );
  }
}
