import 'dart:convert';

import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

@LazySingleton()
class BibleLocalDataSource {
  BibleLocalDataSource(this._appDatabase);

  final AppDatabase _appDatabase;

  Future<List<Book>> fetchBible(TranslateBible translate) async {
    return _appDatabase.getBooks().map((e) => e.toBook()).toList();
  }

  Future<List<Chapter>> getChaptersForBook(int bookId) async {
    return _appDatabase
        .getChaptersForBook(bookId)
        .map((e) => e.toChapter())
        .toList();
  }

  Future<void> createBible(TranslateBible translate) async {
    final input = await rootBundle.loadString(translate.path);
    final json = jsonDecode(input);

    for (final book in json['books'] as List) {
      final bookId = book['id'] as int;
      _appDatabase.putBook(BookLocal.fromMap(book, translate.name));
      for (final chapter in book['chapters'] as List) {
        final chapterId = chapter['id'] as int;
        ChapterLocal chapterLocal = ChapterLocal.fromMap(chapter, bookId);
        for (final verse in chapter['verses'] as List) {
          VerseLocal verseLocal = VerseLocal.fromMap(verse, chapterId, bookId);
          final idVerse = _appDatabase.putVerse(verseLocal);
          verseLocal.id = idVerse;
          for (final word in (verse['text'] as String).split(' ')) {
            WordLocal wordLocal = WordLocal(value: word, id: 0);
            wordLocal.verse.targetId = idVerse;
            _appDatabase.putWord(wordLocal);
          }
          chapterLocal.verses.add(verseLocal);
        }
        _appDatabase.putChapter(chapterLocal);
      }
    }
  }
}
