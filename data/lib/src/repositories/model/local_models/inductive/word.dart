// ignore_for_file: public_member_api_docs, sort_constructors_first
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
}

extension WordMapper on Word {
  WordLocal toLocalWord() {
    return WordLocal(id: id, value: value);
  }
}

extension LocalWordDataMapper on WordLocal {
  Word toWord() {
    return Word(
      id: id,
      value: value,
    );
  }
}
