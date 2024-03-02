import 'package:bible_depth/data/bible/bible.dart';
import 'package:bible_depth/models/wrap_entity.dart';
import 'package:hive/hive.dart';
part 'fragment.g.dart';

@HiveType(typeId: 2)
class Fragment {
  @HiveField(0)
  String name = '';
  @HiveField(1)
  List<WrapEntity> text = [];

  Fragment({
    required this.text,
    required this.name,
  });

  Fragment.fromBible({
    required Book book,
    required int chapterStart,
    required int verseStart,
    required int chapterEnd,
    required int verseEnd,
  }) {
    List<WrapEntity> listWrap = [];

    for (var c = chapterStart - 1; c < chapterEnd; c++) {
      var vStart = c + 1 == chapterStart ? verseStart : 1;
      var vEnd = c + 1 == chapterEnd ? verseEnd : 99999999999;

      var chapter = book.chapters[c];
      for (var v = vStart - 1; (v < chapter.verses.length) && (v < vEnd); v++) {
        var verse = chapter.verses[v];

        listWrap.add(VerseIndex()..value = '${chapter.id}:${verse.id}');

        List<String> words = verse.text.split(' ');
        for (var word in words) {
          listWrap.add(Word()..value = word);
          listWrap.add(Space());
        }
      }
    }

    text = listWrap;
    name = '${book.bookName} $chapterStart:$verseStart-$chapterEnd:$verseEnd';
  }
}
