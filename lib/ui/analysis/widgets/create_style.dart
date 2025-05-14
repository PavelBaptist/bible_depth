import 'package:bible_depth/library.dart';
import 'package:domain/domain.dart';
import 'package:shared/shared.dart';

class CreateStyleWidget extends StatefulWidget {
  const CreateStyleWidget({
    super.key,
    required this.create,
  });

  final void Function(WordStyle style) create;

  @override
  State<CreateStyleWidget> createState() => _CreateStyleWidgetState();
}

class _CreateStyleWidgetState extends State<CreateStyleWidget> {
  bool bold = false;
  bool italics = false;
  late List<Color> colors;
  Color? selectedFontColor;
  Color? selectedBorderColor;
  Color? selectedBackgroundColor;

  get itemCount => null;

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final appLocale = S.of(context);
    colors = [
      theme.red,
      theme.green,
      theme.blue,
      theme.yellow,
      theme.black,
      theme.white,
      theme.purple,
      theme.orange,
      theme.pink,
      theme.gray,
      theme.cayan,
      theme.teal,
      theme.brown,
    ];
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: theme.backgroundPrimary,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  appLocale.createNewStyle,
                  style: theme.jura700x16.copyWith(color: theme.textPrimary),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: selectedBorderColor != null ? 4 : 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: selectedBackgroundColor ?? theme.backgroundPrimary,
                    border: selectedBorderColor != null
                        ? Border.all(
                            color: selectedBorderColor!,
                            width: 2,
                          )
                        : null,
                  ),
                  child: Text(
                    appLocale.sample,
                    style: TextStyle(
                      fontFamily: "Jura",
                      fontSize: 24,
                      fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
                      fontStyle: italics ? FontStyle.italic : null,
                      color: selectedFontColor ?? theme.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            checkBoxWidget(
              titel: appLocale.bold,
              value: bold,
              onChanged: (value) {
                setState(() {
                  bold = value!;
                });
              },
              theme: theme,
            ),
            checkBoxWidget(
              titel: appLocale.italics,
              value: italics,
              onChanged: (value) {
                setState(() {
                  italics = value!;
                });
              },
              theme: theme,
            ),
            const SizedBox(height: 8),
            selectColor(
                titel: appLocale.colorFont,
                selectedColor: selectedFontColor,
                onTap: (index) => setState(() =>
                    selectedFontColor == colors[index]
                        ? selectedFontColor = null
                        : selectedFontColor = colors[index]),
                theme: theme),
            selectColor(
                titel: appLocale.colorBackground,
                selectedColor: selectedBackgroundColor,
                onTap: (index) => setState(() =>
                    selectedBackgroundColor == colors[index]
                        ? selectedBackgroundColor = null
                        : selectedBackgroundColor = colors[index]),
                theme: theme),
            selectColor(
                titel: appLocale.colorBorder,
                selectedColor: selectedBorderColor,
                onTap: (index) => setState(() =>
                    selectedBorderColor == colors[index]
                        ? selectedBorderColor = null
                        : selectedBorderColor = colors[index]),
                theme: theme),
            const SizedBox(height: 16),
            TwoButtons(
              oneButtonText: appLocale.cancel,
              twoButtonText: appLocale.add,
              secondTap: () {
                Navigator.of(context).pop();
                widget.create(
                  WordStyle(
                    italics: italics,
                    bold: bold,
                    fontColor: colorToHex(selectedFontColor),
                    backgroundColor: colorToHex(selectedBackgroundColor),
                    borderColor: colorToHex(selectedBorderColor),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget selectColor({
    required String titel,
    required Color? selectedColor,
    required void Function(int index) onTap,
    required UIThemes theme,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$titel:',
          style: theme.jura500x18.copyWith(color: theme.textPrimary),
        ),
        SizedBox(
          height: 40,
          child: LayoutBuilder(
            builder: (_, constraints) {
              return OverflowBox(
                maxWidth: constraints.maxWidth + 32,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 4, left: 16, right: 16),
                  itemBuilder: (_, index) {
                    final bool isSelected = selectedColor == colors[index];
                    return GestureDetector(
                      onTap: () => onTap(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        transform: isSelected
                            ? Matrix4.translationValues(0, -8, 0)
                            : Matrix4.identity(),
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: colors[index],
                            border: Border.all(
                              color: theme.textPrimary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      blurRadius: 4,
                                      offset: const Offset(0, 6),
                                    )
                                  ]
                                : null,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemCount: colors.length,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget checkBoxWidget({
    required String titel,
    required bool value,
    required void Function(bool?)? onChanged,
    required UIThemes theme,
  }) {
    return Row(
      children: [
        Text(
          '$titel:',
          style: theme.jura500x18.copyWith(color: theme.textPrimary),
        ),
        Checkbox(
          value: value,
          onChanged: onChanged,
          checkColor: theme.textPrimary,
          activeColor: theme.backgroundPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          side: WidgetStateBorderSide.resolveWith((states) {
            return BorderSide(
              color: theme.textPrimary,
              width: 2.0,
            );
          }),
          visualDensity: const VisualDensity(
            vertical: -4.0,
          ),
        ),
      ],
    );
  }
}
