import 'package:flutter/material.dart';

class NiceButton extends StatefulWidget {
  final double height;
  final double width;
  final double fontSize;
  final String label;
  final Color color;
  final Color shadowColor;
  final IconData icon;
  final double iconSize;
  final VoidCallback? method;
  final bool isIconRight;
  final bool enabled;

  const NiceButton({
    super.key,
    this.height = 44,
    this.width = 100,
    this.fontSize = 20,
    this.isIconRight = false,
    this.enabled = true,
    required this.label,
    required this.color,
    required this.shadowColor,
    required this.icon,
    required this.iconSize,
    this.method,
  });

  @override
  State<NiceButton> createState() => _NiceButtonState();
}

class _NiceButtonState extends State<NiceButton> {
  static const double _shadowHeight = 4;
  double _position = 4;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (_) {
        setState(() {
          _position = 4;
        });
        if (widget.method != null) {
          widget.method?.call();
        }
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
      child: SizedBox(
        height: widget.height + _shadowHeight,
        width: widget.width,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: widget.height,
                width: widget.width,
                decoration: BoxDecoration(
                  color: widget.enabled ? widget.color : Colors.grey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Positioned(
              bottom: _position,
              child: Container(
                height: widget.height,
                width: widget.width,
                decoration: BoxDecoration(
                  color: widget.enabled ? widget.color : Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white,
                    width: 4,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: widget.isIconRight
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!widget.isIconRight)
                      Icon(
                        widget.icon,
                        size: widget.iconSize,
                        color: Colors.white,
                        shadows: const [
                          Shadow(
                            color: Color(0xff000000),
                            offset: Offset(0, 1),
                          )
                        ],
                      ),
                    Text(
                      widget.label,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: widget.fontSize,
                        shadows: const [
                          Shadow(
                            color: Color(0xff000000),
                            offset: Offset(0, 1),
                          )
                        ],
                      ),
                    ),
                    if (widget.isIconRight)
                      Icon(
                        widget.icon,
                        size: widget.iconSize,
                        color: Colors.white,
                        shadows: const [
                          Shadow(
                            color: Color(0xff000000),
                            offset: Offset(0, 1),
                          )
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
