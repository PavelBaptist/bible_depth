import 'package:bible_depth/library.dart';

class CreateFolder extends StatefulWidget {
  const CreateFolder({
    super.key,
    required this.add,
  });

  final void Function(String name) add;

  @override
  State<CreateFolder> createState() => _CreateFolderState();
}

class _CreateFolderState extends State<CreateFolder> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final appLocale = S.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                appLocale.name,
                style: theme.jura700x16.copyWith(color: theme.textPrimary),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: nameController,
                cursorColor: theme.cursor,
                style: theme.jura700x16.copyWith(color: theme.textPrimary),
                onChanged: (value) => setState(() {}),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: theme.textPrimary),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: theme.textPrimary),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TwoButtons(
                secondTap: nameController.text.isNotEmpty
                    ? () => widget.add(nameController.text)
                    : null,
                oneButtonText: appLocale.cancel,
                twoButtonText: appLocale.create,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
