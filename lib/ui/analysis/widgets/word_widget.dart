import 'package:bible_depth/library.dart';
import 'package:domain/domain.dart';

class WordWidget extends StatelessWidget {
  const WordWidget({
    super.key,
    required this.words,
    required this.index,
    required this.onTap,
    required this.sizeText,
  });

  final List<Word> words;
  final int index;
  final Function() onTap;
  final double sizeText;

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    double boldPadding = sizeText > 14 ? 4 : 2;
    double padding = sizeText > 14 ? 6 : 3;

    Word iWord = words[index];

    Widget word = Text(
      iWord.value,
      style: TextStyle(
        fontFamily: "Jura",
        fontSize: sizeText,
        fontWeight: iWord.bold ? FontWeight.w700 : FontWeight.w400,
        fontStyle: iWord.italics ? FontStyle.italic : null,
        color: iWord.getFontColor ?? theme.textPrimary,
      ),
    );

    if (iWord.fontColor.isNotEmpty ||
        iWord.borderColor.isNotEmpty ||
        iWord.backgroundColor.isNotEmpty) {
      word = Container(
          padding: EdgeInsets.symmetric(
              horizontal: iWord.borderColor.isNotEmpty ? boldPadding : padding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: iWord.getBackgroundColor,
            border: iWord.getBorderColor != null
                ? Border.all(
                    color: iWord.getBorderColor!,
                    width: 2,
                  )
                : null,
          ),
          child: word);
    }

    if (index == 0 || iWord.verse.number != words[index - 1].verse.number) {
      word = _addVerseNumber(iWord.verse.number, word, theme, word is Container,
          boldPadding, padding);
    }

    if (word is! Container && word is! Row) {
      word = Padding(
        padding: EdgeInsets.symmetric(
            horizontal: iWord.bold ? boldPadding : padding),
        child: word,
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: word,
    );
  }

  Widget _addVerseNumber(int number, Widget word, UIThemes theme,
      bool container, double boldPadding, double padding) {
    Widget row = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${words[index].verse.number}.',
          style: theme.jura500x18
              .copyWith(color: theme.textGrey, fontSize: sizeText),
        ),
        if (!container && !words[index].bold) SizedBox(width: boldPadding),
        word,
        if (!container && !words[index].bold) SizedBox(width: padding),
        if (words[index].bold && !container) const SizedBox(width: 3)
      ],
    );
    return row;
  }
}
