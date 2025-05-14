import 'package:bible_depth/library.dart';
import 'package:domain/domain.dart';
import 'package:shared/shared.dart';

class VersesListWidget extends StatelessWidget {
  const VersesListWidget({
    super.key,
    required this.words,
    required this.onTap,
    required this.sizeText,
    required this.newLineByVerse,
  });

  final List<Word> words;
  final Function(Word word) onTap;
  final double sizeText;
  final bool newLineByVerse;

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
                        style:
                            theme.jura700x22.copyWith(color: theme.textPrimary),
                      ),
                    ),
                  Wrap(
                    spacing: 2,
                    runSpacing: 4,
                    children: List.generate(
                      iWords.length * 2,
                      (index) {
                        final wordIndex = index ~/ 2;

                        if (index.isOdd) {
                          if (wordIndex + 1 != iWords.length &&
                              ((iWords[wordIndex].verse.number !=
                                          iWords[wordIndex + 1].verse.number &&
                                      newLineByVerse) ||
                                  iWords[wordIndex + 1].transfer)) {
                            return const SizedBox(width: double.infinity);
                          } else {
                            return const SizedBox();
                          }
                        }

                        return WordWidget(
                          words: iWords,
                          index: wordIndex,
                          onTap: () => onTap(iWords[wordIndex]),
                          sizeText: sizeText,
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
                style: theme.jura700x22.copyWith(color: theme.textPrimary),
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
