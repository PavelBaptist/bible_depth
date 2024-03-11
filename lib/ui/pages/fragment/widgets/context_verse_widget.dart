import 'package:bible_depth/data/bible/bible.dart';
import 'package:flutter/material.dart';

class ContextVerseWidget extends StatelessWidget {
  Verse verse;
  double? fontSize;
  ContextVerseWidget(this.verse, {super.key, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      verse.id == 1
          ? '\nГлава ${verse.chapterId}\n${verse.id} ${verse.text}'
          : '${verse.id} ${verse.text}',
      style: TextStyle(
        fontSize: fontSize,
      ),
    );
  }
}
