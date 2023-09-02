import 'package:bible_depth/feature/domain/entities/word_entity.dart';

class WordModel extends WordEntity {
  WordModel({required super.value, super.color});

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      value: json['value'],
      color: json['color'],
    );
  }
}
