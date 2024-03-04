import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 200)
class WordStyle {
  // main
  @HiveField(0)
  String description = 'Новый стиль';

  // font
  @HiveField(1)
  Color? _fontColor;

  @HiveField(2)
  bool? isBold = false;

  @HiveField(3)
  bool? isItalic = false;

  // border
  @HiveField(4)
  Color? _borderColor;
  // TODO: ВСТАВИТЬ СЕТТЕРЫ И ГЕТТЕРЫ ДЛЯ ВСЕХ КОЛОРОВ

  @HiveField(5)
  bool borderIsCircle = false;

  // image
  @HiveField(6)
  String? image;

  @HiveField(7)
  bool? stretchImage = false;

  // other
  @HiveField(8)
  Color? _highlightColor;
}
