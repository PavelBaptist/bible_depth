import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
part 'structural_law.g.dart';

@HiveType(typeId: 201)
class StructuralLaw {
  StructuralLaw();

  @HiveField(0)
  String id = const Uuid().v4();

  @HiveField(1)
  bool isAssetsSource = true;

  @HiveField(2)
  String image = 'no_icon.png';
}
