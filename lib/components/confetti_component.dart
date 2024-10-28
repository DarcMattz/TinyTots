import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class ConfettiComponent extends StatefulWidget {
  final ConfettiController controller;
  final double blastDirection;
  final double emissionFrequency;
  final int numberOfParticles;
  final double gravity;
  final List<Color> colors;

  ConfettiComponent({
    required this.controller,
    this.blastDirection = -3.14 / 2,
    this.emissionFrequency = 0.05,
    this.numberOfParticles = 3,
    this.gravity = 0.1,
    this.colors = const [Colors.blue, Colors.red, Colors.green, Colors.orange],
  });

  @override
  _ConfettiComponentState createState() => _ConfettiComponentState();
}

class _ConfettiComponentState extends State<ConfettiComponent> {
  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      confettiController: widget.controller,
      blastDirection: widget.blastDirection,
      emissionFrequency: widget.emissionFrequency,
      numberOfParticles: widget.numberOfParticles,
      gravity: widget.gravity,
      colors: widget.colors,
    );
  }
}
