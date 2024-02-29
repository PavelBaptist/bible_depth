import 'dart:convert';

import 'package:bible_depth/data/bible/bible.dart';
import 'package:flutter/services.dart';

class Rst implements Bible {
  @override
  final String translationId = "RST";

  @override
  final String name = "Русский синодальный текст";

  @override
  List<Book> books = [];

  Rst._internal(this.books);

  static Rst? _instance;

  static Future<Rst> get instance async {
    if (_instance != null) {
      return _instance!;
    }

    var books = await _getBooksFromJson('assets/bible/rst.json');

    return Rst._internal(books);
  }

  static Future<List<Book>> _getBooksFromJson(String filePath) async {
    var input = await rootBundle.loadString(filePath);
    var json = jsonDecode(input);
    var result = (json['books'] as List).map((e) => Book.fromJson(e)).toList();
    return result;
  }
}
