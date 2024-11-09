import 'package:flutter/material.dart';

class PushReplacement extends StatelessWidget {
  final Widget child;
  final Route route;
  const PushReplacement({
    super.key,
    required this.route,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope<Object?>(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            route,
          );
        }
      },
      child: child,
    );
  }
}
