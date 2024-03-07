import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:windows1251/windows1251.dart';

_parseBibleQuoteModule() async {
  var result = [];
  for (var i = 1; i <= 66; i++) {
    var book = {
      'id': i,
      'bookName': '',
      'chapters': [],
    };

    var input = await rootBundle
        .load('assets/bible/rst/RU${i.toString().padLeft(2, '0')}.HTM');
    List<int> intList = input.buffer.asUint8List();

    var str = Windows1251Decoder().convert(intList);
    var emptyMap = {};
    var listLine = str.split('\n');
    var chapter = emptyMap;
    for (var line in listLine) {
      line = line.trim();
      if (line.startsWith('<h2>')) {
        line = line.replaceAll('<h2>', '');
        line = line.replaceAll('</h2>', '');
        line = line.trim();
        book['bookName'] = line;
      } else if (line.startsWith('<h4>')) {
        if (chapter != emptyMap) {
          (book['chapters'] as List<dynamic>).add(chapter);
        }

        line = line.replaceAll('<h4>Глава ', '');
        line = line.replaceAll('<h4>Псалом ', '');
        line = line.replaceAll('</h4>', '');
        line = line.trim();
        int chapterId = int.parse(line);
        chapter = {'id': chapterId, 'verses': []};
      } else if (line.startsWith('<p>')) {
        line = line.replaceAll('<p>', '');
        line = line.trim();
        int spaceIndex = line.indexOf(' ');
        int verseId = int.parse(line.substring(0, spaceIndex));
        line = line.substring(spaceIndex + 1);
        line = line.replaceAll(RegExp(r'\s\d+'), '');
        (chapter['verses'] as List<dynamic>).add({
          'id': verseId,
          'text': line,
        });
      }
    }
    (book['chapters'] as List<dynamic>).add(chapter);

    result.add(book);
  }

  String jsonString = jsonEncode(result);
  String path = '${(await getApplicationDocumentsDirectory()).path}/rst.json';
  File file = File(path);
  file.writeAsString(jsonString);
  print('Записано!');
}
