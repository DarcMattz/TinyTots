import 'dart:developer';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:tinytots/components/settings_icon_button.dart';
import 'package:tinytots/components/snackbar.dart';
import 'package:tinytots/components/utils/circle_button.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/globals.dart';
import 'package:tinytots/helper/background_audio_service.dart';
import 'package:tinytots/helper/google_sign_in_service.dart';
import 'package:tinytots/screens/settings/profile.dart';
import 'package:tinytots/screens/settings/stats.dart';
import 'package:gap/gap.dart';

class SettingsDialog extends StatefulWidget {
  const SettingsDialog({super.key, required this.oldScreen});

  final Widget oldScreen;

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  final GoogleSignInService _googleSignInService = GoogleSignInService();
  final BackgroundAudioService _backgroundAudioService =
      BackgroundAudioService();
  late TextEditingController _textFieldController;
  late bool _isPlaying;

  @override
  void initState() {
    super.initState();
    _isPlaying = _backgroundAudioService.isPlaying;
    _textFieldController =
        TextEditingController(text: prefs.getString('username') ?? '');
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void _toggleMusic() {
    _backgroundAudioService.isPlaying
        ? _backgroundAudioService.pause()
        : _backgroundAudioService.resume();
    setState(() {
      _isPlaying = !_isPlaying;
    });
    log("Music Playing: $_isPlaying");
  }

  void _handleGoogleSignIn() async {
    if (_googleSignInService.isSignedIn()) {
      await _googleSignInService.signOut();
      await _googleSignInService.signInWithGoogle(context);
    } else {
      await _googleSignInService.signInWithGoogle(context);
    }

    // Update the UI after the sign-in state changes
    setState(() {
      log('isSignedIn: ${_googleSignInService.isSignedIn()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
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
                    color: Color(0xFF4D4D4D),
                  ),
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SettingsIconButton(
                      icon: _isPlaying ? Icons.volume_up : Icons.volume_off,
                      color: Color(0xff2EA1FE),
                      label: 'Music',
                      onPressed: _toggleMusic,
                    ),
                    SettingsIconButton(
                      icon: Icons.person,
                      color: Color(0xff2ED6B2),
                      label: 'Avatar',
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
                      color: Color(0xffA248DE),
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
                  ],
                ),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    controller: _textFieldController,
                    style: const TextStyle(
                      color: Color(0xFF4D4D4D),
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffD9D9D9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    textAlign: TextAlign.center,
                    onSubmitted: (value) {
                      value = value.trim();
                      if (value.isNotEmpty) {
                        prefs.setString('username', value);
                        log('Username: $value');
                      } else {
                        showTopAwesomeSnackbar(
                          context,
                          title: 'Oops!',
                          message: 'Username cannot be empty',
                          contentType: ContentType.warning,
                        );
                        _textFieldController.text =
                            prefs.getString('username') ?? '';
                      }
                    },
                  ),
                ),
                Text(
                  'username',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFFfff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.save, color: Color(0xff4D4D4D), size: 24),
                        const SizedBox(width: 8),
                        Text(
                          'Save your progress',
                          style: const TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.w600,
                            color: Color(0xff4D4D4D),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFFB213),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    onPressed: _handleGoogleSignIn,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Assets.images.googleLogo.image(height: 24),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _googleSignInService.isSignedIn()
                              ? 'Change Account'
                              : 'Sign In with Google',
                          style: const TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.w600,
                            color: Color(0xff4D4D4D),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: -15,
              right: -15,
              // child: CircleButton(
              //   color: Colors.purpleAccent,
              //   shadowColor: Colors.purple,
              //   icon: Icons.close,
              //   method: () {
              //     if (_textFieldController.text.isNotEmpty) {
              //       prefs.setString(
              //           'username', _textFieldController.text.trim());
              //       log('Username: ${_textFieldController.text}');
              //     }
              //     if (context.mounted) Navigator.pop(context);
              //   },
              // ),
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Color(0xff4D4D4D),
                ),
                onPressed: () {
                  if (_textFieldController.text.isNotEmpty) {
                    prefs.setString(
                        'username', _textFieldController.text.trim());
                    log('Username: ${_textFieldController.text}');
                  }
                  if (context.mounted) Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
