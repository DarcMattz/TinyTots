import 'dart:developer';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tinytots/components/snackbar.dart';
import 'package:tinytots/globals.dart';
import 'package:tinytots/helper/prefs_helper.dart';

class GoogleSignInService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    try {
      final googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        log('[GoogleSignInService] User cancelled the login flow.');
        return null;
      }

      final googleAuth = await googleUser.authentication;

      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        throw FirebaseAuthException(
            code: 'invalid-credential',
            message: 'Google authentication failed.');
      }

      final cred = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      log('[GoogleSignInService] Signing in with Google credentials.');
      final userCredential = await _auth.signInWithCredential(cred);

      log('[GoogleSignInService] User signed in successfully: ${userCredential.user?.email}');

      // Fetch and save data to Shared Preferences
      await fetchAndSaveUserData(userCredential.user?.uid);

      return userCredential;
    } catch (e) {
      log('[GoogleSignInService] Error: $e');

      if (e is FirebaseAuthException && e.code == 'network-request-failed') {
        showTopAwesomeSnackbar(
          context,
          title: 'Network Error',
          message: 'Please check your internet connection.',
          contentType: ContentType.failure,
        );
      } else {
        showTopAwesomeSnackbar(
          context,
          title: 'Error',
          message: 'An unexpected error occurred. Please try again.',
          contentType: ContentType.failure,
        );
      }
    }
    return null;
  }

  bool isSignedIn() => _auth.currentUser != null;

  Future<void> fetchAndSaveUserData(String? uid) async {
    if (uid == null) return;

    try {
      // Reference to the Firestore collection
      final userDoc = FirebaseFirestore.instance.collection('users').doc(uid);

      final docSnapshot = await userDoc.get();

      if (docSnapshot.exists) {
        final userData = docSnapshot.data();

        if (userData != null) {
          log('[GoogleSignInService] User data fetched: $userData');

          // Save data to Shared Preferences
          userData.forEach((key, value) {
            if (value is String) {
              prefs.setString(key, value);
            } else if (value is int) {
              prefs.setInt(key, value);
            } else if (value is bool) {
              prefs.setBool(key, value);
            }
          });

          log('[GoogleSignInService] User data saved locally.');
        }
      } else {
        log('[GoogleSignInService] No data found for the user.');
      }
    } catch (e) {
      log('[GoogleSignInService] Error fetching user data: $e');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
    await Storage.clearData();
    log('[GoogleSignInService] User signed out and data cleared.');
  }
}
