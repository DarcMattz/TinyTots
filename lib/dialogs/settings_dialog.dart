import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/push_replacement.dart';
import 'package:flutter_application_1/components/settings_icon_button.dart';
import 'package:flutter_application_1/components/utils/circle_button.dart';
import 'package:flutter_application_1/globals.dart';
import 'package:flutter_application_1/helper/audio_service.dart';
import 'package:flutter_application_1/helper/prefs_helper.dart';
import 'package:flutter_application_1/screens/settings/profile.dart';
import 'package:flutter_application_1/screens/settings/stats.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class SettingsDialog extends StatefulWidget {
  const SettingsDialog({super.key, required this.oldScreen});

  final Widget oldScreen;

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  final AudioService _audioService = AudioService();
  TextEditingController _textFieldController =
      TextEditingController(text: prefs.getString('username'));

  @override
  void initState() {
    super.initState();
    _audioService.setOnComplete(() {});
  }

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }

  void _play(soundPath) async {
    await _audioService.playFromAssets(soundPath);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'SETTINGS',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // SettingsIconButton(
                    //   icon: Icons.volume_up,
                    //   color: Colors.blue,
                    //   label: 'Sound',
                    // ),
                    SettingsIconButton(
                      icon: Icons.person,
                      color: Colors.green,
                      label: 'Profile',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ChangeProfile(oldScreen: widget.oldScreen),
                          ),
                        );
                      },
                    ),
                    SettingsIconButton(
                      icon: Icons.bar_chart,
                      color: Colors.purple,
                      label: 'Stats',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StatsScreen(),
                          ),
                        );
                      },
                    ),
                    SettingsIconButton(
                      icon: Icons.cleaning_services,
                      color: Colors.orange,
                      label: 'Clear Data',
                      onPressed: () => Storage.defaultData(),
                    ),
                    // SettingsIconButton(
                    //   icon: Icons.bar_chart,
                    //   color: Colors.purple,
                    //   label: 'Print Data',
                    //   onPressed: () => Storage.getData(),
                    // ),
                    // SettingsIconButton(
                    //   icon: Icons.delete,
                    //   color: Colors.red,
                    //   label: 'Delete Data',
                    //   onPressed: () => Storage.clearData(),
                    // ),
                  ],
                ),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    style: const TextStyle(
                      color: Color(0xFF4D4D4D),
                      fontSize: 20,
                    ),
                    controller: _textFieldController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffD9D9D9),
                      // labelText: "Username",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(28.0),
                      ),
                      errorText: _textFieldController.text.isEmpty
                          ? 'Username cannot be empty'
                          : null,
                    ),
                    textAlign: TextAlign.center,
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        prefs.setString('username', value);
                        log('Username: $value');
                      }
                    },
                  ),
                ),
                const Gap(20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save, color: Colors.black54),
                    SizedBox(width: 8),
                    Text(
                      'Save Your Progress',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                const Gap(10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Register this Account',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: -15,
              right: -10,
              child: CircleButton(
                color: Colors.purpleAccent,
                shadowColor: Colors.purple,
                icon: Icons.close,
                method: () {
                  if (_textFieldController.text.isNotEmpty) {
                    prefs.setString('username', _textFieldController.text);
                    log('Username: ${_textFieldController.text}');
                  }
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
