import 'package:bible_depth/data/bible/bible.dart';
import 'package:bible_depth/models/structural_law.dart';
import 'package:bible_depth/models/structural_law_list.dart';
import 'package:bible_depth/models/word_style.dart';
import 'package:bible_depth/models/word_style_list.dart';
import 'package:bible_depth/models/wrap_entity.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'fragment.g.dart';

@HiveType(typeId: 3)
class Fragment {
  @HiveField(0)
  String name = '';
  @HiveField(1)
  List<WrapEntity> text = [];
  @HiveField(2)
  String? description = '';
  @HiveField(3)
  int? bookId;
  @HiveField(4)
  StructuralLawList? structuralLawList;
  @HiveField(5)
  WordStyleList? wordStyleList;
  @HiveField(6)
  String? translationId = 'RST';

  Fragment() {
    structuralLawList ??= StructuralLawList()..list = StructuralLaw.defaultSet;
    wordStyleList ??= WordStyleList()..list = WordStyle.defaultSet;
  }

  Fragment.fromBible({
    required Book book,
    required int chapterStart,
    required int verseStart,
    required int chapterEnd,
    required int verseEnd,
  }) {
    List<WrapEntity> listWrap = getWrapEntityListFromBible(
        book: book,
        chapterStart: chapterStart,
        verseStart: verseStart,
        chapterEnd: chapterEnd,
        verseEnd: verseEnd);

    text = listWrap;
    name = '${book.bookName} $chapterStart:$verseStart-$chapterEnd:$verseEnd';

    structuralLawList ??= StructuralLawList()..list = StructuralLaw.defaultSet;
    wordStyleList ??= WordStyleList()..list = WordStyle.defaultSet;
  }

  Future<Verse> getFirstVerseEntity() async {
    VerseIndex verseIndex =
        text.firstWhere((wrapEntity) => wrapEntity is VerseIndex) as VerseIndex;
    int chapterId = int.parse(verseIndex.value.split(':')[0]);
    int verseId = int.parse(verseIndex.value.split(':')[1]);
    return (await Bible.getBibleFromTranslationId(translationId))
        .books[bookId! - 1]
        .chapters[chapterId - 1]
        .verses[verseId - 1];
  }

  Future<Verse> getLastVerseEntity() async {
    VerseIndex verseIndex =
        text.lastWhere((wrapEntity) => wrapEntity is VerseIndex) as VerseIndex;
    int chapterId = int.parse(verseIndex.value.split(':')[0]);
    int verseId = int.parse(verseIndex.value.split(':')[1]);
    return (await Bible.getBibleFromTranslationId(translationId))
        .books[bookId! - 1]
        .chapters[chapterId - 1]
        .verses[verseId - 1];
  }

  addContext(int chapterId, int verseId) async {
    Book book = (await Bible.getBibleFromTranslationId(translationId))
        .books[bookId! - 1];
    Verse lastVerse = await getLastVerseEntity();
    if (chapterId > lastVerse.chapterId ||
        (chapterId == lastVerse.chapterId && verseId > lastVerse.id)) {
      int chapterStart = lastVerse.chapterId;
      int verseStart = lastVerse.id + 1;
      if (book.chapters[chapterStart - 1].verses.length < verseStart) {
        chapterStart++;
        verseStart = 1;
      }
      List<WrapEntity> wrapEntites = getWrapEntityListFromBible(
        book: book,
        chapterStart: chapterStart,
        verseStart: verseStart,
        chapterEnd: chapterId,
        verseEnd: verseId,
      );

      if (wrapEntites.first is ChapterIndex) {
        wrapEntites.removeAt(0);
      }

      text.addAll(wrapEntites);
    } else {
      Verse firstVerse = await getFirstVerseEntity();
      if (chapterId < firstVerse.chapterId ||
          (chapterId == firstVerse.chapterId && verseId < firstVerse.id)) {
        int chapterEnd = firstVerse.chapterId;
        int verseEnd = firstVerse.id - 1;
        if (verseEnd == 0) {
          chapterEnd--;
          verseEnd = book.chapters[chapterEnd - 1].verses.length;
        }
        List<WrapEntity> wrapEntites = getWrapEntityListFromBible(
          book: book,
          chapterStart: chapterId,
          verseStart: verseId,
          chapterEnd: chapterEnd,
          verseEnd: verseEnd,
        );

        if (firstVerse.id > 1) {
          text.remove(text.firstWhere((element) => element is ChapterIndex));
        }

        wrapEntites.addAll(text);
        text = wrapEntites;
      }
    }
  }

  List<WrapEntity> getWrapEntityListFromBible({
    required Book book,
    required int chapterStart,
    required int verseStart,
    required int chapterEnd,
    required int verseEnd,
  }) {
    List<WrapEntity> listWrap = [];
    bookId = book.id;
    for (var c = chapterStart - 1; c < chapterEnd; c++) {
      var vStart = c + 1 == chapterStart ? verseStart : 1;
      var vEnd = c + 1 == chapterEnd ? verseEnd : 99999999999;

      var chapter = book.chapters[c];
      listWrap.add(ChapterIndex()..value = '${chapter.id}');
      for (var v = vStart - 1; (v < chapter.verses.length) && (v < vEnd); v++) {
        var verse = chapter.verses[v];

        listWrap.add(VerseIndex()..value = '${chapter.id}:${verse.id}');

        List<String> words = verse.text.split(' ');
        for (var word in words) {
          listWrap.add(Word()..value = word);
        }
      }
    }
    return listWrap;
  }

  Fragment copyWith() {
    final newFragment = Fragment();
    newFragment.name = name;

    for (var el in text) {
      newFragment.text.add(el.copyWith());
    }

    newFragment.description = description;
    newFragment.bookId = bookId;
    newFragment.structuralLawList = structuralLawList?.copyWith();
    newFragment.wordStyleList = wordStyleList?.copyWith();

    return newFragment;
  }
}
