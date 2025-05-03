import 'package:bible_depth/library.dart';
import 'package:domain/domain.dart';

class WordWidget extends StatelessWidget {
  const WordWidget(
      {super.key,
      required this.words,
      required this.index,
      required this.onTap});

  final List<Word> words;
  final int index;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    Widget word = Text(
      words[index].value,
      style: theme.jura500x18.copyWith(color: theme.textPrimary),
    );

    if (index == 0 ||
        words[index].verse.number != words[index - 1].verse.number) {
      word = addVerseNumber(words[index].verse.number, word, theme);
    }

    return GestureDetector(
      onTap: onTap,
      child: word,
    );
  }

  Widget addVerseNumber(int number, Widget word, UIThemes theme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${words[index].verse.number}.',
          style: theme.jura500x18.copyWith(color: theme.textGrey),
        ),
        const SizedBox(width: 4),
        word,
      ],
    );
  }
}
