import 'dart:developer';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tinytots/components/settings_icon_button.dart';
import 'package:tinytots/components/snackbar.dart';
import 'package:tinytots/components/utils/circle_button.dart';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/globals.dart';
import 'package:tinytots/helper/background_audio_service.dart';
import 'package:tinytots/helper/google_sign_in_service.dart';
import 'package:tinytots/helper/prefs_helper.dart';
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

  Future<void> saveProgress(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Not Signed In'),
          content: Text('Please sign in to save your progress.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    final uid = user.uid;
    final firestore = FirebaseFirestore.instance;
    final userDocRef = firestore.collection('users').doc(uid);

    // Check if user already has data in Firestore
    final docSnapshot = await userDocRef.get();

    if (docSnapshot.exists) {
      // User already has data
      final firestoreData = docSnapshot.data();

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Data Exists'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your account already has the following saved data:'),
              SizedBox(height: 8),
              if (firestoreData != null) ...[
                Text(
                  'Username: ${firestoreData['username'] ?? 'N/A'}',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                SizedBox(height: 8),
                Text(
                  'Shapes High Score: ${firestoreData['shapes_high_score'] ?? 0}',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                Text(
                  'Alphabets High Score: ${firestoreData['alphabets_high_score'] ?? 0}',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                Text(
                  'Vowels High Score: ${firestoreData['vowels_high_score'] ?? 0}',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                Text(
                  'Body High Score: ${firestoreData['body_high_score'] ?? 0}',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                Text(
                  'Senses High Score: ${firestoreData['senses_high_score'] ?? 0}',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                Text(
                  'Care High Score: ${firestoreData['care_high_score'] ?? 0}',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                Text(
                  'Numbers High Score: ${firestoreData['numbers_high_score'] ?? 0}',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                Text(
                  'Add And Subtract High Score: ${firestoreData['add_subtract_high_score'] ?? 0}',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                Text(
                  'Abakada High Score: ${firestoreData['abakada_high_score'] ?? 0}',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                Text(
                  'Kulay High Score: ${firestoreData['kulay_high_score'] ?? 0}',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                Text(
                  'Hugis High Score: ${firestoreData['hugis_high_score'] ?? 0}',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                Text(
                  'Pamilya High Score: ${firestoreData['pamilya_high_score'] ?? 0}',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                Text(
                  'Time Chase High Score: ${firestoreData['time_chase_high_score'] ?? 0}',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                Text(
                  'Riddle Hunt High Score: ${firestoreData['riddle_hunt_high_score'] ?? 0}',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
              SizedBox(height: 16),
              Text('What would you like to do?'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                // Save local data to Firestore
                await uploadSharedPrefDataToFirestore(uid);
                showSnackbar(context, 'Progress saved successfully!');
              },
              child: Text('Save Current Data'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                // Retrieve data from Firestore and save to Shared Preferences
                await retrieveFirestoreDataToSharedPref(uid);
                showSnackbar(context, 'Progress updated from Firestore!');
              },
              child: Text('Retrieve Data'),
            ),
          ],
        ),
      );
    } else {
      // New account: Save local data to Firestore
      final confirm = await showConfirmationDialog(
        context,
        'Save Progress',
        'Your account is newly signed up. Do you want to save your progress to the cloud?',
      );

      if (confirm) {
        await uploadSharedPrefDataToFirestore(uid);
        showSnackbar(context, 'Progress saved successfully!');
      }
    }
  }

  Future<bool> showConfirmationDialog(
      BuildContext context, String title, String message) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('OK'),
              ),
            ],
          ),
        ) ??
        false;
  }

  Future<void> uploadSharedPrefDataToFirestore(String uid) async {
    final firestore = FirebaseFirestore.instance;
    final userDocRef = firestore.collection('users').doc(uid);

    final sharedPrefData = Storage.getData();

    await userDocRef.set(sharedPrefData, SetOptions(merge: true));

    log('[Save Progress] Data uploaded to Firestore for user: $uid');
  }

  Future<void> retrieveFirestoreDataToSharedPref(String uid) async {
    final firestore = FirebaseFirestore.instance;
    final userDocRef = firestore.collection('users').doc(uid);

    final docSnapshot = await userDocRef.get();

    if (docSnapshot.exists) {
      final firestoreData = docSnapshot.data();

      if (firestoreData != null) {
        firestoreData.forEach((key, value) {
          if (value is String) {
            prefs.setString(key, value);
          } else if (value is int) {
            prefs.setInt(key, value);
          } else if (value is bool) {
            prefs.setBool(key, value);
          }
        });

        log('[Retrieve Progress] Data retrieved from Firestore and saved locally.');
      }
    }
  }

  void showSnackbar(BuildContext context, String message) {
    showTopAwesomeSnackbar(
      context,
      title: 'Notification',
      message: message,
      contentType: ContentType.success,
    );
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
                      backgroundColor: _googleSignInService.isSignedIn()
                          ? Color(0xff2ED6B2)
                          : Color(0xffFFfff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    onPressed: () => saveProgress(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.save, color: Colors.white, size: 24),
                        const SizedBox(width: 8),
                        Text(
                          'Save your progress',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
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
