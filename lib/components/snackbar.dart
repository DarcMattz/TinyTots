import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

void showTopAwesomeSnackbar(BuildContext context,
    {required String title,
    required String message,
    required ContentType contentType}) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top + 10, // Adjust position
      left: 16,
      right: 16,
      child: SafeArea(
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: AwesomeSnackbarContent(
              title: title,
              message: message,
              contentType: contentType,
            ),
          ),
        ),
      ),
    ),
  );

  // Insert the overlay entry
  overlay?.insert(overlayEntry);

  // Automatically remove after 3 seconds
  Future.delayed(Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}
