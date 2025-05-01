import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class BookLocal {
  @Id()
  int id;
  final int bookId;
  final String translate;
  final String bookName;
  final String shortName;
  // final List<ChapterLocal> chapters;
  BookLocal({
    this.id = 0,
    required this.translate,
    required this.bookId,
    required this.bookName,
    required this.shortName,
    // required this.chapters,
  });

  factory BookLocal.fromMap(Map<String, dynamic> map, String translate) {
    //создание chapters
    return BookLocal(
      // id: 0,
      translate: translate,
      bookId: map['id'],
      bookName: map['bookName'],
      shortName: map['shortName'],
      // chapters: (map['chapters'] as List)
      //     .map((e) => ChapterLocal.fromMap(e, map['id']))
      //     .toList(),
    );
  }
}

extension BookMapper on Book {
  BookLocal toLocalBook() {
    return BookLocal(
      id: id,
      bookId: bookId,
      translate: translate,
      bookName: bookName,
      shortName: shortName,
      // chapters: chapters.map((e) => e.toLocalChapter()).toList(),
    );
  }
}

extension LocalBookDataMapper on BookLocal {
  Book toBook() {
    return Book(
      id: id,
      bookId: bookId,
      translate: translate,
      bookName: bookName,
      shortName: shortName,
      // chapters: chapters.map((e) => e.toChapter()).toList(),
    );
  }
}

@Entity()
class ChapterLocal {
  @Id()
  int id;
  final int chapterId;
  final int bookId;
  final verses = ToMany<VerseLocal>();

  ChapterLocal({
    this.id = 0,
    required this.chapterId,
    required this.bookId,
    // required this.verses,
  });

  factory ChapterLocal.fromMap(Map<String, dynamic> map, int bookId) {
    return ChapterLocal(
      chapterId: map['id'],
      bookId: bookId,
      // verses: (map['verses'] as List)
      //     .map((e) => VerseLocal.fromMap(e, map['id'], bookId))
      //     .toList(),
    );
  }
}

extension ChapterMapper on Chapter {
  ChapterLocal toLocalChapter() {
    ChapterLocal chapter = ChapterLocal(
      id: id,
      chapterId: chAapterId,
      bookId: bookId,
      // verses: verses.map((e) => e.toLocalVerse()).toList(),
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
  // final String text;
  VerseLocal({
    this.id = 0,
    required this.number,
    required this.bookId,
    required this.chapterId,
    // required this.text,
  });

  factory VerseLocal.fromMap(
      Map<String, dynamic> map, int chapterId, int bookId) {
    VerseLocal verse = VerseLocal(
      id: 0,
      number: map['id'],
      bookId: bookId,
      chapterId: chapterId,
      // text: map['text'],
    );

    // verse.words.addAll((map['text'] as String)
    //     .split(' ')
    //     .map((e) => WordLocal(value: e))
    //     .toList());
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
      // text: text,
    );
    // verse.words.addAll(words.map((e) => e.toLocalWord()).toList());
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
      // text: text,
      // words: words.map((e) => e.toWord()).toList(),
      fragment: fragment.target?.toFragment(),
    );
  }
}
