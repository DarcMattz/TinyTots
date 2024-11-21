class AlphabetQuestion {
  final String questionText;
  final List<String> imageOptions;
  final List<String> audioOptions;
  final int correctAnswerIndex;

  AlphabetQuestion({
    required this.questionText,
    required this.imageOptions,
    required this.audioOptions,
    required this.correctAnswerIndex,
  });
}

class ShapesQuestion {
  final String questionText;
  final List<String> imageOptions;
  final int correctAnswerIndex;

  ShapesQuestion({
    required this.questionText,
    required this.imageOptions,
    required this.correctAnswerIndex,
  });
}
