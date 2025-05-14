// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class WordLocal {
  WordLocal({
    this.id = 0,
    required this.value,
    this.fontColor = '',
    this.borderColor = '',
    this.backgroundColor = '',
    this.italics = false,
    this.bold = false,
    this.transfer = false,
    required this.order,
  });

  @Id()
  int id;
  final String value;
  final String fontColor;
  final String borderColor;
  final String backgroundColor;
  final bool italics;
  final bool bold;
  final bool transfer;
  final verse = ToOne<VerseLocal>();
  final fragment = ToOne<FragmentLocal>();
  final int order;
}

extension WordMapper on Word {
  WordLocal toLocalWord() {
    WordLocal word = WordLocal(
      id: id,
      value: value,
      fontColor: fontColor,
      borderColor: borderColor,
      backgroundColor: backgroundColor,
      italics: italics,
      bold: bold,
      transfer: transfer,
      order: order,
    );
    word.verse.target = verse.toLocalVerse();
    word.fragment.target = fragment.toLocalFragment();
    return word;
  }
}

extension LocalWordDataMapper on WordLocal {
  Word toWord() {
    Word word = Word(
      id: id,
      value: value,
      fontColor: fontColor,
      borderColor: borderColor,
      backgroundColor: backgroundColor,
      italics: italics,
      bold: bold,
      transfer: transfer,
      verse: verse.target != null ? verse.target!.toVerse() : Verse(),
      fragment:
          fragment.target != null ? fragment.target!.toFragment() : Fragment(),
      order: order,
    );
    return word;
  }
}
