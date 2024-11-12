import 'dart:developer';

import 'package:flutter_application_1/globals.dart';

class Storage {
  // Set Default
  static clearData() {
    prefs.setInt('shapes_current_index', 0);
    prefs.setBool('shapes_quiz_unlocked', false);
    prefs.setInt('shapes_high_score', 0);
    prefs.setInt('alphabets_current_index', 0);
    prefs.setBool('alphabets_quiz_unlocked', false);
    prefs.setInt('alphabets_high_score', 0);
    prefs.setInt('vowels_current_column_index', 0);
    prefs.setBool('vowels_quiz_unlocked', false);
    prefs.setInt('vowels_high_score', 0);

    log("Data Cleared");
  }

  // Read
  static getData() {
    log(
      "Shapes Current Index: ${prefs.getInt('shapes_current_index')}",
    );
    log(
      "Shapes Quiz Unlocked: ${prefs.getBool('shapes_quiz_unlocked')}",
    );
    log(
      "Shapes High Score: ${prefs.getInt('shapes_high_score')}",
    );

    log(
      "Alphabets Current Index: ${prefs.getInt('alphabets_current_index')}",
    );
    log(
      "Alphabets Quiz Unlocked: ${prefs.getBool('alphabets_quiz_unlocked')}",
    );
    log(
      "Alphabets High Score: ${prefs.getInt('alphabets_high_score')}",
    );

    log(
      "Vowels Current Index: ${prefs.getInt('vowels_current_column_index')}",
    );
    log(
      "Vowels Quiz Unlocked: ${prefs.getBool('vowels_quiz_unlocked')}",
    );
    log(
      "Vowels High Score: ${prefs.getInt('vowels_high_score')}",
    );
  }

  // Delete
  static Future<void> deleteAllData() async {
    await prefs.clear();
    log("Data Deleted");
  }
}
