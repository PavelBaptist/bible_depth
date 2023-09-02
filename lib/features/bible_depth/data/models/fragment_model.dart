import 'package:bible_depth/features/bible_depth/domain/entities/fragment_entity.dart';

class FragmentModel extends FragmentEntity {
  FragmentModel({
    required super.id,
    required super.text,
    required super.name,
  });

  factory FragmentModel.fromJson(Map<String, dynamic> json) {
    return FragmentModel(
      id: json['id'],
      name: json['name'],
      text: (json['text'] as List<dynamic>).map((e) => e as String).toList(),
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
