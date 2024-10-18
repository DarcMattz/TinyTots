class Letter {
  final String letter;
  final bool withSound;
  final String letterSoundPath;

  Letter({
    required this.letter,
    this.withSound = true,
    required this.letterSoundPath,
  });
}
