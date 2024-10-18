import 'package:flutter_application_1/models/all_aboard/letter.dart';
import 'package:flutter_application_1/models/all_aboard/letter_example.dart';
import 'package:flutter_application_1/models/all_aboard/letter_trace.dart';

class Alphabet {
  final Letter letter;
  final LetterExample letterSample;
  final Trace traceImage;
  final int length;

  Alphabet({
    this.length = 3,
    required this.letter,
    required this.letterSample,
    required this.traceImage,
  });
}
