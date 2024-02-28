import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Word extends Equatable {
  String value;
  Color? highlightColor = Colors.transparent;
  Color? fontColor = Colors.black;
  Word({required this.value});

  @override
  List<Object?> get props => [value, highlightColor, fontColor];
}
