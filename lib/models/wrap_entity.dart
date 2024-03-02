import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'wrap_entity.g.dart';

abstract class WrapEntity {}

@HiveType(typeId: 100)
class Word extends WrapEntity {
  @HiveField(0)
  String value = '';
  @HiveField(1)
  String? _highlightColorHex;
  @HiveField(2)
  String? _fontColorHex;
  Word();

  Color? get highlightColor => _highlightColorHex != null
      ? Color(int.parse(_highlightColorHex!, radix: 16))
      : null;

  Color? get fontColor => _fontColorHex != null
      ? Color(int.parse(_fontColorHex!, radix: 16))
      : null;

  set highlightColor(Color? color) {
    _highlightColorHex = color != null ? color.value.toRadixString(16) : null;
  }

  set fontColor(Color? color) {
    _fontColorHex = color != null ? color.value.toRadixString(16) : null;
  }

  bool styleMatches(WrapEntity wrapEntity) {
    if (wrapEntity is! Word) {
      return false;
    }

    return styleHash() == wrapEntity.styleHash();
  }

  String styleHash() {
    return highlightColor.hashCode.toString() + fontColor.hashCode.toString();
  }
}

@HiveType(typeId: 101)
class VerseIndex extends WrapEntity {
  @HiveField(0)
  String value = '';

  VerseIndex();
}

@HiveType(typeId: 102)
class Space extends WrapEntity {
  @HiveField(0)
  String value = '';
  Space();
}

@HiveType(typeId: 103)
class LineBreak extends WrapEntity {
  @HiveField(0)
  String value = '';
  LineBreak();
}
