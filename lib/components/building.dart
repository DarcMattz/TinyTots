import 'package:flutter/material.dart';

class Building extends StatelessWidget {
  final String module;
  final String imagePath;
  final Widget route;

  const Building({
    super.key,
    required this.module,
    required this.imagePath,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => route),
        );
      },
      child: Image.asset(
        imagePath,
      ),
    );
  }
}
