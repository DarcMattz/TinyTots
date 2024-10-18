class LetterExample {
  final String label;
  final String imagePath;
  final bool withSound;
  final String sampleSoundPath;

  LetterExample({
    required this.label,
    required this.imagePath,
    this.withSound = true,
    required this.sampleSoundPath,
  });
}
