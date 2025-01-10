class FilipinoQuestion {
  final String imagePath;
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  FilipinoQuestion({
    this.imagePath = "",
    this.question = "",
    required this.options,
    required this.correctAnswerIndex,
  });
}
