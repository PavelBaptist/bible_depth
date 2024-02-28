import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/widgets/pages/main/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController {
  Rx<Color> currentHighlightColor = Colors.blue.obs;
  Rx<Color> currentFontColor = Colors.white.obs;
  Rx<double> fontSize = 14.0.obs;

  void applyStyleForWord(Word word) {
    fragment.update((val) {
      word.highlightColor = currentHighlightColor.value;
      word.fontColor = currentFontColor.value;
    });
  }

  var fragment = getFragment().obs;
}
