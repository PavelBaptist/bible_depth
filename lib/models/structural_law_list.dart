import 'package:bible_depth/models/structural_law.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'structural_law_list.g.dart';

@HiveType(typeId: 4)
class StructuralLawList {
  @HiveField(0)
  List<StructuralLaw> list = [];
  StructuralLawList();

  StructuralLaw? getWordStyleById(String id) {
    if (id == '') {
      return null;
    }
    return list.firstWhereOrNull((element) => element.id == id);
  }

  StructuralLawList copyWith() {
    final copyStructuralLawList = StructuralLawList();
    for (var structuralLaw in list) {
      copyStructuralLawList.list.add(structuralLaw.copyWith());
    }
    return copyStructuralLawList;
  }

  Map<String, dynamic> toJson() {
    return {
      'list': list.map((structuralLaw) => structuralLaw.toJson()).toList(),
    };
  }
}
