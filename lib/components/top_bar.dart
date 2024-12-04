import 'package:flutter/material.dart';
import 'package:tinytots/dialogs/settings_dialog.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/globals.dart';

class TopBar extends StatefulWidget {
  TopBar({super.key, required this.oldScreen});
  final Widget oldScreen;

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  void refreshScreen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      refreshScreen();
    });
    String username = prefs.getString('username') ?? 'Tiny Explorer';
    String avatar =
        prefs.getString('avatar') ?? Assets.images.avatars.boy1.path;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(avatar),
                  backgroundColor: Color(0xffCEBEAF),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Color(0xff9F51FE),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.white, width: 4),
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
                builder: (context) =>
                    SettingsDialog(oldScreen: widget.oldScreen),
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
