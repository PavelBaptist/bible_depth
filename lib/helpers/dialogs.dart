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
