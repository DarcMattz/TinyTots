import 'package:flutter/material.dart';
import 'package:flutter_application_1/dialogs/settings_dialog.dart';
import 'package:flutter_application_1/globals.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final String username = prefs.getString('username') ?? 'Guest';

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              const SizedBox(width: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  username,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            tooltip: "Settings",
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const SettingsDialog(),
              );
            },
            icon: const Icon(
              Icons.settings,
              size: 30,
              color: Colors.white,
            ),
            highlightColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
