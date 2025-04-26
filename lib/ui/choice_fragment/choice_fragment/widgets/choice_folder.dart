import 'package:bible_depth/library.dart';
import 'package:domain/domain.dart';

class ChoiceFolder extends StatefulWidget {
  const ChoiceFolder({
    super.key,
    required this.add,
    required this.folders,
    this.createNewFolder,
  });

  final void Function(Folder folder) add;
  final void Function()? createNewFolder;
  final List<Folder> folders;

  @override
  State<ChoiceFolder> createState() => _ChoiceFolderState();
}

class _ChoiceFolderState extends State<ChoiceFolder> {
  Folder? selectedFolder;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  appLocale.selectFolder,
                  style: theme.jura700x16.copyWith(color: theme.textPrimary),
                ),
                if (widget.folders.isNotEmpty)
                  IconButton(
                      onPressed: widget.createNewFolder,
                      icon: const Icon(Icons.add_rounded))
              ],
            ),
            const SizedBox(height: 12),
            if (widget.folders.isEmpty)
              Text(
                appLocale.haveNotFolders,
                style: theme.jura500x16.copyWith(color: theme.textPrimary),
                textAlign: TextAlign.center,
              ),
            if (widget.folders.isNotEmpty)
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 400,
                ),
                child: ListView.separated(
                  shrinkWrap: widget.folders.length < 9 ? true : false,
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () => setState(() {
                      selectedFolder = widget.folders[index];
                    }),
                    child: Container(
                      padding: const EdgeInsets.all(13),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: selectedFolder == widget.folders[index]
                            ? theme.beruz
                            : null,
                        border:
                            Border.all(width: 2, color: theme.bordersPrimary),
                      ),
                      child: Center(
                        child: Text(
                          widget.folders[index].name,
                          style: theme.jura700x20
                              .copyWith(color: theme.textPrimary),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemCount: widget.folders.length,
                ),
              ),
            const SizedBox(height: 20),
            widget.folders.isEmpty
                ? CustomButton(
                    onPressed: widget.createNewFolder,
                    title: appLocale.createNewFolder)
                : TwoButtons(
                    oneButtonText: appLocale.cancel,
                    twoButtonText: appLocale.add,
                    secondTap: selectedFolder != null
                        ? () => widget.add(selectedFolder!)
                        : null,
                  )
          ],
        ),
      ),
    );
  }
}
