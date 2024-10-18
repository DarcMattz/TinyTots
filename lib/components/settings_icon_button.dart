import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SettingsIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const SettingsIconButton({
    super.key,
    required this.icon,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: color,
          child: Icon(icon, color: Colors.white, size: 30),
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
