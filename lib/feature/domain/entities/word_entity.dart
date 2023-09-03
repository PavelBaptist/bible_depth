import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class WordEntity extends Equatable {
  String value;
  Color? color;
  WordEntity({required this.value, this.color});

  @override
  List<Object?> get props => [value, color];
}
