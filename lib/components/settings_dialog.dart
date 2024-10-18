import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/settings_icon_button.dart';
import 'package:gap/gap.dart';

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 20),
                const Text(
                  'SETTINGS',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
            const Gap(20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SettingsIconButton(
                  icon: Icons.volume_up,
                  color: Colors.blue,
                  label: 'Sound',
                ),
                SettingsIconButton(
                  icon: Icons.person,
                  color: Colors.green,
                  label: 'Profile',
                ),
                SettingsIconButton(
                  icon: Icons.bar_chart,
                  color: Colors.purple,
                  label: 'Stats',
                ),
                // SettingsIconButton(
                //   icon: Icons.language,
                //   color: Colors.orange,
                //   label: 'Language',
                // ),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
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
      ),
    );
  }
}
