import 'package:bible_depth/models/tool.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
part 'structural_law.g.dart';

@HiveType(typeId: 201)
class StructuralLaw extends Tool {
  StructuralLaw();

  @HiveField(0)
  String id = const Uuid().v4();

  @HiveField(1)
  bool isAssetsSource = true;

  @HiveField(2)
  String image = 'no_icon.png';

  @HiveField(3)
  String description = '';

  void copyProps(StructuralLaw structuralLaw) {
    id = structuralLaw.id;
    isAssetsSource = structuralLaw.isAssetsSource;
    image = structuralLaw.image;
    description = structuralLaw.description;
  }

  static final List<StructuralLaw> defaultSet = [
    StructuralLaw()
      ..id = 'contrast'
      ..image = 'contrast.png',
    StructuralLaw()
      ..id = 'goal'
      ..image = 'goal.png',
    StructuralLaw()
      ..id = 'comparison'
      ..image = 'comparison.png',
  ];

  StructuralLaw copyWith() {
    return StructuralLaw()
      ..id = id
      ..isAssetsSource = isAssetsSource
      ..image = image
      ..description = description;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isAssetsSource': isAssetsSource,
      'image': image,
      'description': description,
    };
  }
}
