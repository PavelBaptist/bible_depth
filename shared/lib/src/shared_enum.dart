enum TranslateBible {
  rst('Русский синодальный текст', 'assets/bible/rst.json');

  const TranslateBible(this.name, this.path);

  final String name;
  final String path;
}
