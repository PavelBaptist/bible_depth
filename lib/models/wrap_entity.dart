import 'package:flutter/material.dart';

abstract class WrapEntity {}

class Word extends WrapEntity {
  String value;
  Color? highlightColor = Colors.transparent;
  Color? fontColor = Colors.black;
  Word({required this.value});

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

class VerseIndex extends WrapEntity {
  String value;

  VerseIndex({required this.value});
}

class Space extends WrapEntity {}

class LineBreak extends WrapEntity {}
