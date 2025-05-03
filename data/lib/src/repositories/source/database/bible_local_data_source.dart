import 'dart:convert';

import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

@LazySingleton()
class BibleLocalDataSource {
  BibleLocalDataSource();

  Future<List<Book>> fetchAllBook(TranslateBible translate) async {
    final input = await rootBundle.loadString(translate.path);
    final json = jsonDecode(input);

    final result = (json['books'] as List)
        .map((e) => BookLocal.fromMap(e, translate.name))
        .toList();

    return result.map((e) => e.toBook()).toList();
  }

  Future<List<Chapter>> getChaptersForBook(
      int bookId, TranslateBible translate) async {
    final input = await rootBundle.loadString(translate.path);
    final json = jsonDecode(input);

    final result = ((json['books'] as List)[bookId - 1]['chapters'] as List)
        .map((e) => ChapterLocal.fromMap(e, bookId))
        .toList();

    return result.map((e) => e.toChapter()).toList();
  }
}
