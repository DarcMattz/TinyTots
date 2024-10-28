import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.constraints,
    required this.function,
    required this.imagePath,
  });

  final BoxConstraints constraints;
  final VoidCallback function;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
        child: Image.asset(
          imagePath,
          width: constraints.maxWidth * .18,
        ),
      ),
    );
  }
}
