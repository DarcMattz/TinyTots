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
    print("Data Cleared");
  }

  // Read
  static getData() {
    print(
      "Shapes Current Index: ${prefs.getInt('shapes_current_index')}",
    );
    print(
      "Shapes Quiz Unlocked: ${prefs.getBool('shapes_quiz_unlocked')}",
    );
    print(
      "Shapes High Score: ${prefs.getInt('shapes_high_score')}",
    );

    print(
      "Alphabets Current Index: ${prefs.getInt('alphabets_current_index')}",
    );
    print(
      "Alphabets Quiz Unlocked: ${prefs.getBool('alphabets_quiz_unlocked')}",
    );
    print(
      "Alphabets High Score: ${prefs.getInt('alphabets_high_score')}",
    );
  }

  // Delete
  static Future<void> deleteAllData() async {
    await prefs.clear();
    print("Data Deleted");
  }
}
