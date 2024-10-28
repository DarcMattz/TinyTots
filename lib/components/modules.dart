import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/utils/nice_button.dart';

class Module {
  final String type;
  final String imagePath;
  final Widget route;

  Module({
    required this.type,
    required this.imagePath,
    required this.route,
  });
}

class ModuleCard extends StatelessWidget {
  final Module module;

  const ModuleCard({super.key, required this.module});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.all(constraints.maxHeight * .04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.all(
                  //     Radius.circular(constraints.maxHeight * .04),
                  //   ),
                  // ),
                  height: constraints.maxHeight * .75,
                  width: constraints.maxWidth * .9,
                  child: Image.asset(
                    module.imagePath,
                    fit: BoxFit.fill,
                  ),
                ),
                NiceButton(
                  label: module.type == 'learning' ? 'Learn' : "Explore",
                  color: const Color(0xff4EC307),
                  shadowColor: const Color(0xff4EC307),
                  icon: Icons.play_arrow_rounded,
                  iconSize: 30,
                  method: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => module.route),
                    );
                  },
                  isIconRight: true,
                  height: constraints.maxHeight * .15,
                  width: constraints.maxWidth * .9,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
