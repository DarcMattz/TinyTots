import 'dart:developer';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/globals.dart';

class Storage {
  static List allKeys = [
    //settings
    'username',
    'avatar',
    'isFirstTime',

    //shapes
    'shapes_current_index',
    'shapes_quiz_unlocked',
    'shapes_high_score',
    //alphabets
    'alphabets_current_column_index',
    'alphabets_current_row_index',
    'alphabets_quiz_unlocked',
    'alphabets_high_score',
    //vowels
    'vowels_current_column_index',
    'vowels_current_row_index',
    'vowels_quiz_unlocked',
    'vowels_high_score',
    // body
    'body_current_column_index',
    'body_current_row_index',
    'body_quiz_unlocked',
    'body_high_score',
    //senses
    'senses_current_index',
    'senses_quiz_unlocked',
    'senses_high_score',
    //care
    'care_current_index',
    'care_quiz_unlocked',
    'care_high_score',

    //explore
    'time_chase_high_score',
    'riddle_hunt_high_score',
  ];

  // Set Default
  static defaultData() {
    //settings
    prefs.setString('username', 'Tiny Explorer');
    prefs.setString('avatar', Assets.images.avatars.boy1.path);

    //shapes
    prefs.setInt('shapes_current_index', 0);
    prefs.setBool('shapes_quiz_unlocked', false);
    prefs.setInt('shapes_high_score', 0);
    //alphabets
    prefs.setInt('alphabets_current_column_index', 0);
    prefs.setInt('alphabets_current_row_index', 0);
    prefs.setBool('alphabets_quiz_unlocked', false);
    prefs.setInt('alphabets_high_score', 0);
    //vowels
    prefs.setInt('vowels_current_column_index', 0);
    prefs.setInt('vowels_current_row_index', 0);
    prefs.setBool('vowels_quiz_unlocked', false);
    prefs.setInt('vowels_high_score', 0);
    // body
    prefs.setInt('body_current_column_index', 0);
    prefs.setInt('body_current_row_index', 0);
    prefs.setBool('body_quiz_unlocked', false);
    prefs.setInt('body_high_score', 0);
    //senses
    prefs.setInt('senses_current_index', 0);
    prefs.setBool('senses_quiz_unlocked', false);
    prefs.setInt('senses_high_score', 0);
    //care
    prefs.setInt('care_current_index', 0);
    prefs.setBool('care_quiz_unlocked', false);
    prefs.setInt('care_high_score', 0);

    //explore
    prefs.setInt('time_chase_high_score', 0);
    prefs.setInt('riddle_hunt_high_score', 0);

    log("Data Cleared");
  }

  // Read
  static getData() async {
    // final items = await getAllSharedPrefItems();
    log('------- All Keys -------');
    for (var key in allKeys) {
      log('Key: $key | Value: ${prefs.get(key)}');
    }
  }

  // Delete
  static Future<void> clearData() async {
    await prefs.clear();
    log("Data Deleted");
  }
}
