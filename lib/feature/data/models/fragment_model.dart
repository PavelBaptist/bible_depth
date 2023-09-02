import 'package:bible_depth/feature/data/models/word_model.dart';
import 'package:bible_depth/feature/domain/entities/fragment_entity.dart';

class FragmentModel extends FragmentEntity {
  FragmentModel({
    required super.id,
    required super.text,
    required super.name,
  });

  factory FragmentModel.fromJson(Map<String, dynamic> jsonString) {
    return FragmentModel(
      id: jsonString['id'],
      name: jsonString['name'],
      text: (jsonString['text'] as List<dynamic>)
          .map((e) => WordModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'text': text,
    };
  }
}
