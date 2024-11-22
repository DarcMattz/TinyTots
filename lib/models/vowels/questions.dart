class VowelsQuestion {
  final String imagePath;
  final String? questionText;
  final String audioPath;
  final List<String> options;
  final int correctAnswerIndex;

  VowelsQuestion({
    required this.imagePath,
    required this.questionText,
    required this.audioPath,
    required this.options,
    required this.correctAnswerIndex,
  });
}
