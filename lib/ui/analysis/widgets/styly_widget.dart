import 'package:bible_depth/library.dart';
import 'package:domain/domain.dart';

class StyleWidget extends StatelessWidget {
  const StyleWidget({
    super.key,
    required this.style,
    this.onTap,
    required this.selected,
  });

  final WordStyle style;
  final void Function()? onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: style.getBackgroundColor ?? theme.backgroundPrimary,
          border: style.getBorderColor != null
              ? Border.all(color: style.getBorderColor!, width: 2)
              : null,
          boxShadow: selected
              ? const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 8,
                    offset: Offset(0, 6),
                  ),
                ]
              : null,
        ),
        child: Center(
          child: Text(
            'A',
            style: TextStyle(
              fontFamily: "Jura",
              fontSize: 24,
              fontWeight: style.bold ? FontWeight.w700 : FontWeight.w400,
              fontStyle: style.italics ? FontStyle.italic : null,
              color: style.getFontColor ?? theme.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
