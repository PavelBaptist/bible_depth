import 'package:bible_depth/models/word_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'word_style_list.g.dart';

@HiveType(typeId: 2)
class WordStyleList {
  @HiveField(0)
  List<WordStyle> list = [];
  WordStyleList();

  WordStyle? getWordStyleById(String id) {
    if (id == '') {
      return null;
    }
    return list.firstWhereOrNull((style) => style.id == id);
  }
}
