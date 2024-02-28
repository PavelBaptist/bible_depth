import 'package:bible_depth/models/word.dart';
import 'package:equatable/equatable.dart';

class Fragment extends Equatable {
  int id;
  List<Word> text;
  String name;

  Fragment({
    required this.id,
    required this.text,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        text,
        name,
      ];
}
