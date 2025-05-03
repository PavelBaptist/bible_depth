import 'package:bible_depth/library.dart';
import 'package:domain/domain.dart';
import 'package:shared/shared.dart';

class VersesListWidget extends StatelessWidget {
  const VersesListWidget({super.key, required this.words, required this.onTap});

  final List<Word> words;
  final Function(Word word) onTap;

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final appLocale = S.of(context);
    final Map<String, List<Word>> chapters = createChapters(words);

    return words.isNotEmpty
        ? ListView.separated(
            padding: const EdgeInsets.all(GeneralConstants.padding)
                .copyWith(bottom: 200),
            itemBuilder: (_, index) {
              String chapter = chapters.keys.elementAt(index);
              List<Word> iWords = chapters[chapter]!;
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (index == 0)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Text(
                        appLocale.numberChapter(iWords.first.verse.chapterId),
                        style: theme.jura700x22,
                      ),
                    ),
                  Wrap(
                    spacing: 12,
                    children: List.generate(
                      iWords.length,
                      (index) {
                        return WordWidget(
                          words: iWords,
                          index: index,
                          onTap: () => onTap(iWords[index]),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (_, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                appLocale.numberChapter(
                    chapters[chapters.keys.elementAt(index + 1)]!
                        .first
                        .verse
                        .chapterId),
                style: theme.jura700x22,
              ),
            ),
            itemCount: chapters.keys.length,
          )
        : const SizedBox();
  }

  Map<String, List<Word>> createChapters(List<Word> words) {
    Map<String, List<Word>> chapters = {};
    for (final word in words) {
      String chapter = word.verse.chapterId.toString();
      if (!chapters.containsKey(chapter)) {
        chapters[chapter] = [];
      }
      chapters[chapter]!.add(word);
    }

    return chapters;
  }
}
