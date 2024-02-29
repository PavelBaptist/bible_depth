abstract class BibleTranslation {
  String get translationId;
  String get name;
  List<Book> get books;
}

class Book {
  late int id;
  late String bookName;
  late List<Chapter> chapters;

  Book({
    required this.id,
    required this.bookName,
    required this.chapters,
  });

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookName = json['bookName'];
    chapters =
        (json['chapters'] as List).map((e) => Chapter.fromJson(e)).toList();
  }
}

class Chapter {
  late int id;
  late List<Verse> verses;

  Chapter({
    required this.id,
    required this.verses,
  });

  Chapter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    verses = (json['verses'] as List).map((e) => Verse.fromJson(e)).toList();
  }
}

class Verse {
  late int id;
  late String text;

  Verse({
    required this.id,
    required this.text,
  });

  Verse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
  }
}
