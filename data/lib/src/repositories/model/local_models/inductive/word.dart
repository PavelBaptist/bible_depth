// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class WordLocal {
  WordLocal({
    this.id = 0,
    required this.value,
  });

  @Id()
  int id;
  final String value;
  // final verse = ToOne<VerseLocal>();
}

extension WordMapper on Word {
  WordLocal toLocalWord() {
    WordLocal word = WordLocal(id: id, value: value);
    // word.verse.target = verse.toLocalVerse();
    return word;
  }
}

extension LocalWordDataMapper on WordLocal {
  Word toWord() {
    Word word = Word(
      id: id,
      value: value,
      // verse: verse.target != null ? verse.target!.toVerse() : Verse(),
    );
    return word;
  }
}
