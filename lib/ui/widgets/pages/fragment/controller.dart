import 'package:bible_depth/models/fragment.dart';
import 'package:bible_depth/models/word_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FragmentPageController extends GetxController {
  Rx<WordStyle?> currentStyle = WordStyle().obs;
  Rx<double> fontSize = 14.0.obs;
  Rx<Fragment> fragment = Fragment(text: [], name: '').obs;
}
