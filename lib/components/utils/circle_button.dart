import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  final Color color;
  final Color shadowColor;
  final IconData icon;
  final VoidCallback? method;

  const CircleButton({
    super.key,
    required this.color,
    required this.shadowColor,
    required this.icon,
    this.method,
    // this.route,
  });

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  static const double _shadowHeight = 4;
  double _position = 3;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (_) {
        setState(() {
          _position = 4;
        });
        widget.method!();
      },
      onTapDown: (_) {
        setState(() {
          _position = 0;
        });
      },
      onTapCancel: () {
        setState(() {
          _position = 4;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: SizedBox(
          height: 40.0 + _shadowHeight,
          width: 40.0,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: widget.shadowColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: _position,
                child: Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Icon(
                      widget.icon,
                      color: Colors.white,
                      size: 20.0,
                    ),
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
