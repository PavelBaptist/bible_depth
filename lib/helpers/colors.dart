import 'package:flutter/material.dart';

Color? hexToColor(String? hex) {
  if (hex != null) {
    return Color(int.parse(hex, radix: 16));
  }

  return null;
}

String? colorToHex(Color? color) {
  if (color != null) {
    return color.value.toRadixString(16);
  }

  return null;
}
