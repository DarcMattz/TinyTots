import 'package:flutter/material.dart';
import 'package:tinytots/components/utils/nice_button.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/models/settings/subject.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StatsPerBook extends StatelessWidget {
  const StatsPerBook(this.book, {super.key});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return AndroidWelcome(
          constraints: constraints,
          book: book,
        );
      }),
    );
  }
}

class AndroidWelcome extends StatelessWidget {
  const AndroidWelcome({
    super.key,
    required this.constraints,
    required this.book,
  });
  final BoxConstraints constraints;
  final Book book;

  @override
  Widget build(BuildContext context) {
    final grade =
        (book.lessons.values.reduce((a, b) => a + b) / book.lessons.length);

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
                  child: NiceButton(
                    label: "Back",
                    color: Colors.yellow,
                    shadowColor: Colors.yellow[800]!,
                    icon: Icons.arrow_back,
                    iconSize: 30,
                    method: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xffA77DFE),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          book.title,
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.07,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Gap(10),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Color(0xff9B51E0),
                            child: Icon(
                                (book.lessons.values.reduce((a, b) => a + b) /
                                            book.lessons.length) ==
                                        100
                                    ? Icons.check
                                    : Icons.trending_up_rounded,
                                color: Colors.white,
                                size: 30),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "${grade.toStringAsFixed(0)}%",
                                      style: TextStyle(
                                        color: Color(0xff782EFB),
                                      ),
                                    ),
                                    Gap(10),
                                    grade == 100
                                        ? Text(
                                            "Completed",
                                            style: TextStyle(
                                              color: Color(0xffD1D8FF),
                                            ),
                                          )
                                        : Text(
                                            "in Progress",
                                            style: TextStyle(
                                              color: Color(0xffD1D8FF),
                                            ),
                                          )
                                  ],
                                ),
                              ),
                              Gap(5),
                              LinearPercentIndicator(
                                width: constraints.maxWidth * 0.6,
                                lineHeight: 10.0,
                                percent: grade / 100,
                                backgroundColor: Color(0xffE0E0E0),
                                progressColor: Color(0xff782EFB),
                                barRadius: const Radius.circular(10),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Gap(10),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xffA77DFE),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                book.title == "Explore" ? 'Modes' : 'Quizes',
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.05,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Scores',
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.05,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Gap(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: List.of(
                            book.lessons.entries.map(
                              (e) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    e.key.toString(),
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.05,
                                      color: Color(0xff782EFB),
                                    ),
                                  ),
                                  Text(
                                    e.value.toString(),
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.05,
                                      color: Color(0xff782EFB),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, right: 30),
                  child: Assets.images.fox.image(height: 200),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
