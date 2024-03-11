import 'package:bible_depth/data/bible/bible.dart';
import 'package:bible_depth/data/bible/rst.dart';
import 'package:bible_depth/models/fragment.dart';
import 'package:bible_depth/models/tool.dart';
import 'package:bible_depth/models/word_style.dart';
import 'package:bible_depth/models/wrap_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FragmentPageController extends GetxController {
  Rx<Tool?> currentTool = Tool().obs;
  Rx<double> fontSize = 14.0.obs;
  Rx<Fragment> fragment = Fragment(text: [], name: '').obs;
  RxList<Verse> contextBefore = RxList<Verse>();

  Future<Verse> getFirstVerseEntity() async {
    if (contextBefore.isEmpty) {
      VerseIndex verseIndex = fragment.value.text
          .firstWhere((wrapEntity) => wrapEntity is VerseIndex) as VerseIndex;
      int chapterId = int.parse(verseIndex.value.split(':')[0]);
      int verseId = int.parse(verseIndex.value.split(':')[1]);
      return (await Rst.instance)
          .books[fragment.value.bookId! - 1]
          .chapters[chapterId - 1]
          .verses[verseId - 1];
    } else {
      return contextBefore[0];
    }
  }

  RxList<Verse> contextAfter = RxList<Verse>();

  Future<Verse> getLastVerseEntity() async {
    if (contextAfter.isEmpty) {
      VerseIndex verseIndex = fragment.value.text
          .lastWhere((wrapEntity) => wrapEntity is VerseIndex) as VerseIndex;
      int chapterId = int.parse(verseIndex.value.split(':')[0]);
      int verseId = int.parse(verseIndex.value.split(':')[1]);
      return (await Rst.instance)
          .books[fragment.value.bookId! - 1]
          .chapters[chapterId - 1]
          .verses[verseId - 1];
    } else {
      return contextAfter[contextAfter.length - 1];
    }
  }
}
