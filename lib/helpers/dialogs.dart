import 'package:flutter/material.dart';

Future<void> showConfirmationDialog(BuildContext context,
    {required void Function() onTapYes,
    required String text,
    required String titleText}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(titleText),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[Text(text)],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Да'),
            onPressed: () {
              onTapYes();
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Нет'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void showPopupMenu(BuildContext context,
    {required List<PopupMenuEntry> popupMenuList,
    required Function(dynamic) onValue}) {
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;
  final RenderBox button = context.findRenderObject() as RenderBox;
  final Offset position = button.localToGlobal(Offset.zero, ancestor: overlay);

  showMenu(
    context: context,
    position: RelativeRect.fromLTRB(position.dx, position.dy,
        overlay.size.width - position.dx, overlay.size.height - position.dy),
    items: popupMenuList,
  ).then(onValue);
}
