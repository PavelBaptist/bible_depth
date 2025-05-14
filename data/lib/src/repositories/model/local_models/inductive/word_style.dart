// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:domain/domain.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class WordStyleLocal {
  WordStyleLocal({
    this.id = 0,
    required this.fontColor,
    required this.borderColor,
    required this.backgroundColor,
    required this.italics,
    required this.bold,
    required this.order,
  });

  @Id()
  int id;
  final String fontColor;
  final String borderColor;
  final String backgroundColor;
  final bool italics;
  final bool bold;
  final int order;
}

extension WordStyleMapper on WordStyle {
  WordStyleLocal toLocalWord() {
    return WordStyleLocal(
      id: id,
      fontColor: fontColor,
      borderColor: borderColor,
      backgroundColor: backgroundColor,
      italics: italics,
      bold: bold,
      order: order,
    );
  }
}

extension LocalWordStyleDataMapper on WordStyleLocal {
  WordStyle toWord() {
    return WordStyle(
      id: id,
      fontColor: fontColor,
      borderColor: borderColor,
      backgroundColor: backgroundColor,
      italics: italics,
      bold: bold,
      order: order,
    );
  }
}
