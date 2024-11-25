import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/utils/nice_button.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_application_1/models/settings/subject.dart';
import 'package:flutter_application_1/screens/settings/stats_per_book.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return AndroidWelcome(
              constraints: constraints,
            );
          } else {
            return AndroidWelcome(
              constraints: constraints,
            );
          }
        },
      ),
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
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 0.5,
                children: List.generate(
                  subjects.length,
                  (index) => SubjectCard(
                    constraints: constraints,
                    book: subjects[index],
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

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    super.key,
    required this.constraints,
    required this.book,
  });

  final BoxConstraints constraints;
  final Book book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => StatsPerBook(book)));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: this.constraints.maxWidth * 0.3,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffA77DFE),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    book.title,
                    style: TextStyle(
                        fontSize: constraints.maxWidth * 0.035,
                        color: Colors.white),
                  ),
                ),
              ),
              Card(
                color: Color(0xff95E9FF),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircularPercentIndicator(
                    radius: 40.0,
                    lineWidth: 10.0,
                    percent: ((book.lessons.values.reduce((a, b) => a + b) /
                            book.lessons.length) /
                        100),
                    center: Text(
                        "${(book.lessons.values.reduce((a, b) => a + b) / book.lessons.length).toStringAsFixed(0)}%"),
                    progressColor: Color(0xffF7ED16),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
