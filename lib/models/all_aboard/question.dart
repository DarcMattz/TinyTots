class Question {
  final String questionText;
  final List<String> imageOptions;
  final int correctAnswerIndex;

  Question({
    required this.questionText,
    required this.imageOptions,
    required this.correctAnswerIndex,
  });
}
