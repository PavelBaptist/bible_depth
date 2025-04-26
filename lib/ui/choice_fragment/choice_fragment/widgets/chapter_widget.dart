import 'package:bible_depth/library.dart';
import 'package:domain/domain.dart';

class ChapterWidget extends StatelessWidget {
  const ChapterWidget({
    super.key,
    required this.chapter,
    this.fragment,
    required this.selectVerse,
  });

  final Chapter chapter;
  final Fragment? fragment;
  final void Function(Verse verse) selectVerse;

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final appLocale = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appLocale.numberChapter(chapter.id),
          style: theme.jura700x20.copyWith(color: theme.textPrimary),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: List.generate(chapter.verses.length, (index) {
            final number = index + 1;
            bool selected = false;
            if (fragment != null) {
              if (fragment!.text.indexWhere((e) =>
                      e.chapterId == chapter.id &&
                      e.number == chapter.verses[index].number) !=
                  -1) {
                selected = true;
              }
            }
            return GestureDetector(
              onTap: () => selectVerse(chapter.verses[index]),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: selected ? theme.beruz : null,
                  borderRadius: BorderRadius.circular(10),
                  border:
                      selected ? null : Border.all(color: theme.bordersPrimary),
                ),
                alignment: Alignment.center,
                child: Text(
                  '$number',
                  style: theme.jura700x20.copyWith(
                      color: selected ? theme.textWhite : theme.textPrimary),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
