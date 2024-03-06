import 'package:bible_depth/models/fragment.dart';
import 'package:bible_depth/models/fragment_list.dart';
import 'package:bible_depth/models/structural_law_list.dart';
import 'package:bible_depth/models/word_style_list.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainPageController extends GetxController {
  final _myBox = Hive.box('bible_depth');
  Rx<FragmentList>? fragmentList;
  Rx<WordStyleList>? wordStyleList;
  Rx<StructuralLawList>? structuralLawList;
  Fragment? selectedFragment;

  MainPageController() {
    fragmentList = (_myBox.get('fragments') as FragmentList).obs;
    wordStyleList = (_myBox.get('word_styles') as WordStyleList).obs;
    structuralLawList =
        (_myBox.get('structural_laws') as StructuralLawList).obs;
  }
  updateDataBaseFragments() {
    if (fragmentList != null) {
      _myBox.put("fragments", fragmentList!.value);
    }
  }

  updateDataBaseWordStyles() {
    if (wordStyleList != null) {
      _myBox.put("word_styles", wordStyleList!.value);
    }
  }

  updateDataBaseStructuralLaws() {
    if (structuralLawList != null) {
      _myBox.put("structural_laws", structuralLawList!.value);
    }
  }
}
