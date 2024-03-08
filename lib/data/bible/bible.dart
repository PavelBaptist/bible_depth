abstract class Bible {
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
        (json['chapters'] as List).map((e) => Chapter.fromJson(e, id)).toList();
  }
}

class Chapter {
  late int id;
  late int bookId;
  late List<Verse> verses;

  Chapter({
    required this.id,
    required this.verses,
    required this.bookId,
  });

  Chapter.fromJson(Map<String, dynamic> json, this.bookId) {
    id = json['id'];
    verses = (json['verses'] as List)
        .map((e) => Verse.fromJson(e, id, bookId))
        .toList();
  }
}

class Verse {
  late int id;
  late int chapterId;
  late int bookId;

  late String text;

  Verse({
    required this.id,
    required this.text,
  });

  Verse.fromJson(Map<String, dynamic> json, this.chapterId, this.bookId) {
    id = json['id'];
    text = json['text'];
  }
}
