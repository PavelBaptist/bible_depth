import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:objectbox/objectbox.dart';

class BookLocal {
  final int id;
  final String translate;
  final String bookName;
  final String shortName;
  BookLocal({
    required this.id,
    required this.translate,
    required this.bookName,
    required this.shortName,
  });

  factory BookLocal.fromMap(Map<String, dynamic> map, String translate) {
    return BookLocal(
      id: map['id'],
      translate: translate,
      bookName: map['bookName'],
      shortName: map['shortName'],
    );
  }
}

extension BookMapper on Book {
  BookLocal toLocalBook() {
    return BookLocal(
      id: id,
      translate: translate,
      bookName: bookName,
      shortName: shortName,
    );
  }
}

extension LocalBookDataMapper on BookLocal {
  Book toBook() {
    return Book(
      id: id,
      translate: translate,
      bookName: bookName,
      shortName: shortName,
    );
  }
}

class ChapterLocal {
  final int id;
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
}

extension ChapterMapper on Chapter {
  ChapterLocal toLocalChapter() {
    ChapterLocal chapter = ChapterLocal(
      id: id,
      bookId: bookId,
      verses: verses.map((e) => e.toLocalVerse()).toList(),
    );

    chapter.verses.addAll(verses.map((e) => e.toLocalVerse()));
    return chapter;
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
  @Backlink('verse')
  final words = ToMany<WordLocal>();
  final fragment = ToOne<FragmentLocal>();
  VerseLocal({
    this.id = 0,
    required this.number,
    required this.bookId,
    required this.chapterId,
  });

  factory VerseLocal.fromMap(
      Map<String, dynamic> map, int chapterId, int bookId) {
    VerseLocal verse = VerseLocal(
      id: 0,
      number: map['id'],
      bookId: bookId,
      chapterId: chapterId,
    );
    return verse;
  }
}

extension VerseMapper on Verse {
  VerseLocal toLocalVerse() {
    VerseLocal verse = VerseLocal(
      id: id,
      number: number,
      bookId: bookId,
      chapterId: chapterId,
    );
    if (fragment != null) {
      verse.fragment.target = fragment!.toLocalFragment();
    }
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
      fragment: fragment.target?.toFragment(),
    );
  }
}
