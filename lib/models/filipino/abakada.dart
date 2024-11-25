class Abakada {
  final String imagePath;
  final String label;
  final String voicePath;
  final String mainContent;
  final List<String>? subContent;

  Abakada(
      {required this.label,
      required this.imagePath,
      required this.voicePath,
      required this.mainContent,
      this.subContent});
}
