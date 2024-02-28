import 'package:bible_depth/models/word.dart';
import 'package:bible_depth/ui/widgets/pages/main/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController {
  Rx<Color> currentHighlightColor = const Color.fromARGB(0, 255, 255, 255).obs;
  Rx<Color> currentFontColor = const Color.fromARGB(0, 255, 255, 255).obs;
  Rx<double> fontSize = 14.0.obs;

  void applyStyleForWord(Word word) {
    fragment.update((val) {
      word.highlightColor = currentHighlightColor.value;
      word.fontColor = currentFontColor.value;
    });
  }

  var fragment = getFragment().obs;
}
