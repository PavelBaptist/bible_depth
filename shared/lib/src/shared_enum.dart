enum TranslateBible {
  rst('Русский синодальный текст', 'assets/bible/rst.json');

  const TranslateBible(this.name, this.path);

  final String name;
  final String path;
}

enum ToolsBar {
  style,
  structural,
  comment,
  enter,
  pencil;
}

enum Tools {
  style,
  structural,
  comment,
  heading,
  enter,
  eraser,
}
