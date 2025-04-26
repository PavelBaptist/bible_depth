import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:objectbox/objectbox.dart';

class BookLocal {
  final int id;
  final String bookName;
  final String shortName;
  final List<ChapterLocal> chapters;
  BookLocal({
    required this.id,
    required this.bookName,
    required this.shortName,
    required this.chapters,
  });

  factory BookLocal.fromMap(Map<String, dynamic> map) {
    return BookLocal(
      id: map['id'],
      bookName: map['bookName'],
      shortName: map['shortName'],
      chapters: (map['chapters'] as List)
          .map((e) => ChapterLocal.fromMap(e, map['id']))
          .toList(),
    );
  }

  // factory BookLocal.fromJson(String source) =>
  //     BookLocal.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension BookMapper on Book {
  BookLocal toLocalBook() {
    return BookLocal(
      id: id,
      bookName: bookName,
      shortName: shortName,
      chapters: chapters.map((e) => e.toLocalChapter()).toList(),
    );
  }
}

extension LocalBookDataMapper on BookLocal {
  Book toBook() {
    return Book(
      id: id,
      bookName: bookName,
      shortName: shortName,
      chapters: chapters.map((e) => e.toChapter()).toList(),
    );
  }
}

class ChapterLocal {
  int id;
  final int bookId;
  final List<VerseLocal> verses;

  ChapterLocal({
    required this.id,
    required this.bookId,
    required this.verses,
  });

  factory ChapterLocal.fromMap(Map<String, dynamic> map, int bookId) {
    return ChapterLocal(
      id: map['id'],
      bookId: bookId,
      verses: (map['verses'] as List)
          .map((e) => VerseLocal.fromMap(e, map['id'], bookId))
          .toList(),
    );
  }

  // factory ChapterLocal.fromJson(String source, int bookId) =>
  //     ChapterLocal.fromMap(json.decode(source) as Map<String, dynamic>, bookId);
}

extension ChapterMapper on Chapter {
  ChapterLocal toLocalChapter() {
    return ChapterLocal(
      id: id,
      bookId: bookId,
      verses: verses.map((e) => e.toLocalVerse()).toList(),
    );
  }
}

extension LocalChapterDataMapper on ChapterLocal {
  Chapter toChapter() {
    return Chapter(
      id: id,
      bookId: bookId,
      verses: verses.map((e) => e.toVerse()).toList(),
    );
  }
}

@Entity()
class VerseLocal {
  @Id()
  int id;
  final int number;
  final int bookId;
  final int chapterId;
  final words = ToMany<WordLocal>();
  final fragment = ToOne<FragmentLocal>();
  final String text;
  VerseLocal({
    this.id = 0,
    required this.number,
    required this.bookId,
    required this.chapterId,
    required this.text,
  });

  factory VerseLocal.fromMap(
      Map<String, dynamic> map, int chapterId, int bookId) {
    VerseLocal verse = VerseLocal(
      id: 0,
      number: map['id'],
      bookId: bookId,
      chapterId: chapterId,
      text: map['text'],
    );
    verse.words.addAll((map['text'] as String)
        .split(' ')
        .map((e) => WordLocal(value: e))
        .toList());
    return verse;
  }

  // factory VerseLocal.fromJson(String source, int chapterId, int bookId) =>
  //     VerseLocal.fromMap(
  //         json.decode(source) as Map<String, dynamic>, chapterId, bookId);
}

extension VerseMapper on Verse {
  VerseLocal toLocalVerse() {
    VerseLocal verse = VerseLocal(
      id: id,
      number: number,
      bookId: bookId,
      chapterId: chapterId,
      text: text,
    );
    verse.words.addAll(words.map((e) => e.toLocalWord()).toList());
    verse.fragment.target = fragment.toLocalFragment();
    return verse;
  }
}

extension LocalVerseDataMapper on VerseLocal {
  Verse toVerse() {
    return Verse(
      id: id,
      number: number,
      bookId: bookId,
      chapterId: chapterId,
      text: text,
      words: words.map((e) => e.toWord()).toList(),
      fragment:
          fragment.target != null ? fragment.target!.toFragment() : Fragment(),
    );
  }
}
