import 'package:bible_depth/helpers/colors.dart';
import 'package:bible_depth/models/word_style.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
part 'wrap_entity.g.dart';

abstract class WrapEntity {
  @mustBeOverridden
  WrapEntity copyWith();

  @mustBeOverridden
  Map<String, dynamic> toJson();
}

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

  @override
  Word copyWith() {
    return Word()
      ..value = value
      ..styleId = styleId
      ..structuralLawId = structuralLawId;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'styleId': styleId,
      'structuralLawId': structuralLawId,
    };
  }
}

@HiveType(typeId: 101)
class VerseIndex extends WrapEntity {
  @HiveField(0)
  String value = '';

  VerseIndex();

  @override
  VerseIndex copyWith() {
    return VerseIndex()..value = value;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'value': value,
    };
  }
}

@HiveType(typeId: 103)
class LineBreak extends WrapEntity {
  @HiveField(0)
  String value = '';
  LineBreak();

  @override
  LineBreak copyWith() {
    return LineBreak()..value = value;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'value': value,
    };
  }
}

@HiveType(typeId: 104)
class StructuralLawPlace extends WrapEntity {
  @HiveField(0)
  String value = '';

  @HiveField(1)
  String structuralLawId = '';

  StructuralLawPlace();

  @override
  StructuralLawPlace copyWith() {
    return StructuralLawPlace()
      ..value = value
      ..structuralLawId = structuralLawId;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'structuralLawId': structuralLawId,
    };
  }
}

@HiveType(typeId: 105)
class Header extends WrapEntity {
  @HiveField(0)
  String value = '';

  @HiveField(1)
  int level = 4;

  Header();

  @override
  Header copyWith() {
    return Header()
      ..value = value
      ..level = level;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'level': level,
    };
  }
}

@HiveType(typeId: 106)
class ChapterIndex extends WrapEntity {
  @HiveField(0)
  String value = '';

  ChapterIndex();

  @override
  ChapterIndex copyWith() {
    return ChapterIndex()..value = value;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'value': value,
    };
  }
}
