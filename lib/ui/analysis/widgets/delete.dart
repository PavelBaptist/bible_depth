import 'package:bible_depth/library.dart';
import 'package:domain/domain.dart';

class Delete extends StatelessWidget {
  const Delete({
    super.key,
    required this.delete,
    required this.style,
  });

  final void Function() delete;
  final WordStyle style;

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final appLocale = S.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              appLocale.delete,
              style: theme.jura700x16.copyWith(color: theme.textPrimary),
            ),
            const SizedBox(height: 12),
            Text(
              'Вы действительно хотите удалить данный стиль?',
              textAlign: TextAlign.start,
              style: theme.jura500x16.copyWith(color: theme.textPrimary),
            ),
            StyleWidget(style: style, selected: false),
            TwoButtons(
              oneButtonText: appLocale.cancel,
              twoButtonText: appLocale.deleteTitleButton,
              secondTap: () {
                delete();
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
