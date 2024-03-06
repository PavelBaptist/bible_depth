import 'package:bible_depth/helpers/colors.dart';
import 'package:bible_depth/models/word_style.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'wrap_entity.g.dart';

abstract class WrapEntity {}

@HiveType(typeId: 100)
class Word extends WrapEntity {
  @HiveField(0)
  String value = '';
  @HiveField(1)
  String styleId = '';
  @HiveField(2)
  String structuralLawId = '';

  Word();

  bool styleMatches(WrapEntity wrapEntity) {
    if (wrapEntity is! Word) {
      return false;
    }

    return styleId == wrapEntity.styleId;
  }
}

@HiveType(typeId: 101)
class VerseIndex extends WrapEntity {
  @HiveField(0)
  String value = '';

  VerseIndex();
}

@HiveType(typeId: 102)
class Space extends WrapEntity {
  @HiveField(0)
  String value = '';
  Space();
}

@HiveType(typeId: 103)
class LineBreak extends WrapEntity {
  @HiveField(0)
  String value = '';
  LineBreak();
}

@HiveType(typeId: 104)
class StructuralLawPlace extends WrapEntity {
  @HiveField(0)
  String value = '';

  @HiveField(1)
  String structuralLawId = '';

  StructuralLawPlace();
}
