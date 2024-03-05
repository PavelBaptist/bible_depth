import 'package:bible_depth/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
part 'word_style.g.dart';

@HiveType(typeId: 200)
class WordStyle {
  WordStyle();
  // main
  @HiveField(0)
  String description = '';

  @HiveField(1)
  String id = const Uuid().v4();

  // font
  @HiveField(2)
  String? _fontColor;
  Color? get fontColor => hexToColor(_fontColor);
  set fontColor(Color? color) => _fontColor = colorToHex(color);

  @HiveField(3)
  bool? isBold = false;

  @HiveField(4)
  bool? isItalic = false;

  // border color
  @HiveField(5)
  String? _borderColor;
  Color? get borderColor => hexToColor(_borderColor);
  set borderColor(Color? color) => _borderColor = colorToHex(color);

  @HiveField(6)
  bool borderIsCircle = false;

  // image
  @HiveField(7)
  String? image;

  @HiveField(8)
  bool? stretchImage = false;

  // highlight color
  @HiveField(9)
  String? _highlightColor;
  Color? get highlightColor => hexToColor(_highlightColor);
  set highlightColor(Color? color) => _highlightColor = colorToHex(color);
}