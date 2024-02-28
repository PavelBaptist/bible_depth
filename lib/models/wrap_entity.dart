import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class WrapEntity {}

class Word extends WrapEntity {
  String value;
  Color? highlightColor = Colors.transparent;
  Color? fontColor = Colors.black;
  Word({required this.value});
}

class Space extends WrapEntity {}

class LineBreak extends WrapEntity {}
