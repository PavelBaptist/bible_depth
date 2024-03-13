import 'package:bible_depth/data/bible/bible.dart';
import 'package:bible_depth/models/structural_law.dart';
import 'package:bible_depth/models/structural_law_list.dart';
import 'package:bible_depth/models/word_style.dart';
import 'package:bible_depth/models/word_style_list.dart';
import 'package:bible_depth/models/wrap_entity.dart';
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

  Fragment({
    required this.text,
    required this.name,
  }) {
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

    text = listWrap;
    name = '${book.bookName} $chapterStart:$verseStart-$chapterEnd:$verseEnd';

    structuralLawList ??= StructuralLawList()..list = StructuralLaw.defaultSet;
    wordStyleList ??= WordStyleList()..list = WordStyle.defaultSet;
  }
}
