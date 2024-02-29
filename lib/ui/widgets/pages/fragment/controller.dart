import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FragmentPageController extends GetxController {
  Rx<Color> currentHighlightColor = const Color.fromRGBO(33, 150, 243, 1).obs;
  Rx<Color> currentFontColor = const Color.fromRGBO(255, 255, 255, 1).obs;
  Rx<double> fontSize = 14.0.obs;

  void applyStyleForWord(Word word) {
    fragment.update((val) {
      word.highlightColor = currentHighlightColor.value;
      word.fontColor = currentFontColor.value;
    });
  }

  var fragment = getFragment().obs;
}
