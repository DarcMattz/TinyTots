import 'dart:developer';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tinytots/components/snackbar.dart';

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

      log('[GoogleSignInService] User signed in successfully.');
      return await _auth.signInWithCredential(cred);
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
          message: 'An unexpected error occurred.',
          contentType: ContentType.failure,
        );
      }
    }
    return null;
  }

  bool isSignedIn() => _auth.currentUser != null;

  Future<void> signOut() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
    log('[GoogleSignInService] User signed out.');
  }
}
