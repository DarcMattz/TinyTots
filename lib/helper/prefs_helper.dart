import 'dart:developer';
import 'package:tinytots/gen/assets.gen.dart';
import 'package:tinytots/globals.dart';

class Storage {
  static List allKeys = [
    //settings
    'username',
    'avatar',
    'isFirstTime',

    //ALL ABOARD
    //shapes
    'shapes_current_index',
    'shapes_quiz_unlocked',
    'shapes_high_score',
    //alphabets
    'alphabets_current_column_index',
    'alphabets_current_row_index',
    'alphabets_quiz_unlocked',
    'alphabets_high_score',

    //PHONICS
    //vowels
    'vowels_current_column_index',
    'vowels_current_row_index',
    'vowels_quiz_unlocked',
    'vowels_high_score',

    //SCIENCE
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

    //MATHEMATICS
    'numbers_current_column_index',
    'numbers_quiz_unlocked',
    'numbers_high_score',
    //add_subtract
    'add_subtract_current_index',
    'add_subtract_quiz_unlocked',
    'add_subtract_high_score',

    //FILIPINO
    //abakada
    'abakada_current_index',
    'abakada_quiz_unlocked',
    'abakada_high_score',
    //kulay
    'kulay_current_index',
    'kulay_quiz_unlocked',
    'kulay_high_score',
    //hugis
    'hugis_current_index',
    'hugis_quiz_unlocked',
    'hugis_high_score',
    //pamilya
    'pamilya_current_index',
    'pamilya_quiz_unlocked',
    'pamilya_high_score',

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

    //numbers
    prefs.setInt('numbers_current_column_index', 0);
    prefs.setBool('numbers_quiz_unlocked', false);
    prefs.setInt('numbers_high_score', 0);
    //add_subtract
    prefs.setInt('add_subtract_current_index', 0);
    prefs.setBool('add_subtract_quiz_unlocked', false);
    prefs.setInt('add_subtract_high_score', 0);

    //abakada

    //explore
    prefs.setInt('time_chase_high_score', 0);
    prefs.setInt('riddle_hunt_high_score', 0);

    log("Data Cleared");
  }

  // Read
  static Map<String, dynamic> getData() {
    Map<String, dynamic> data = {};
    for (String key in allKeys) {
      data[key] = prefs.get(key);
    }
    return data;
  }

  // Delete
  static Future<void> clearData() async {
    await prefs.clear();
    log("Data Deleted");
  }

  static Future<void> saveDataOnline() async {
    /// if signed in save data to firestore
    /// if not signed in
  }
}
