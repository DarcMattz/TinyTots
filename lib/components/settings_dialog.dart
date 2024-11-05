import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/settings_icon_button.dart';
import 'package:flutter_application_1/components/utils/circle_button.dart';
import 'package:flutter_application_1/helper/prefs_helper.dart';
import 'package:gap/gap.dart';

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({super.key});

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
                    // SettingsIconButton(
                    //   icon: Icons.person,
                    //   color: Colors.green,
                    //   label: 'Profile',
                    // ),
                    // SettingsIconButton(
                    //   icon: Icons.bar_chart,
                    //   color: Colors.purple,
                    //   label: 'Stats',
                    // ),
                    SettingsIconButton(
                      icon: Icons.cleaning_services,
                      color: Colors.orange,
                      label: 'Clear Data',
                      onPressed: () => Storage.clearData(),
                    ),
                    SettingsIconButton(
                      icon: Icons.bar_chart,
                      color: Colors.purple,
                      label: 'Print Data',
                      onPressed: () => Storage.getData(),
                    ),
                    SettingsIconButton(
                      icon: Icons.delete,
                      color: Colors.red,
                      label: 'Delete Data',
                      onPressed: () => Storage.deleteAllData(),
                    ),
                  ],
                ),
                const Gap(20),
                const TextField(
                  decoration: InputDecoration(hintText: "Enter your Username"),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'username',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
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
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
