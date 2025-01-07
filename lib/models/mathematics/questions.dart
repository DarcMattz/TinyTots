class MathQuestion {
  final String imagePath;
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  MathQuestion({
    required this.imagePath,
    this.question = "",
    required this.options,
    required this.correctAnswerIndex,
  });
}
