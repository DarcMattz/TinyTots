import 'package:flutter_application_1/globals.dart';

class Book {
  final String title;
  final Map<String, int> lessons;

  Book({
    required this.title,
    required this.lessons,
  });
}

List<Book> subjects = [
  Book(
    title: "All Aboard",
    lessons: {
      'Shapes': prefs.getInt('shapes_high_score') ?? 0,
      'Alphabets': prefs.getInt('alphabets_high_score') ?? 0,
    },
  ),
  Book(title: "Phonics", lessons: {
    'Vowels': prefs.getInt('vowels_high_score') ?? 0,
  }),
  Book(title: "Science Health", lessons: {
    'Body': prefs.getInt('body_high_score') ?? 0,
    'Senses': prefs.getInt('senses_high_score') ?? 0,
    'Care': prefs.getInt('care_high_score') ?? 0,
  }),
  Book(title: "Math", lessons: {
    'Numbers': prefs.getInt('numbers_high_score') ?? 0,
    'Add Subtract': prefs.getInt('add_subtract_high_score') ?? 0,
  }),
  Book(title: "Geography", lessons: {
    'Abakada': prefs.getInt('abakada_high_score') ?? 0,
    'Pamilya': prefs.getInt('pamilya_high_score') ?? 0,
    'Kulay': prefs.getInt('kulay_high_score') ?? 0,
    'Hugis': prefs.getInt('hugis_high_score') ?? 0,
  }),
];
