import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SettingsIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final Function() onPressed;

  const SettingsIconButton({
    super.key,
    required this.icon,
    required this.color,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color(0xff4D4D4D), width: 2),
            ),
            child: Icon(icon, color: Colors.white, size: 40),
          ),
        ),
        const Gap(8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
