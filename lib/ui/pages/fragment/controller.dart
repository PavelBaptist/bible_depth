import 'package:bible_depth/data/bible/bible.dart';
import 'package:bible_depth/data/bible/rst.dart';
import 'package:bible_depth/models/fragment.dart';
import 'package:bible_depth/models/tool.dart';
import 'package:bible_depth/models/word_style.dart';
import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/pages/main/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FragmentPageController extends GetxController {
  Rx<Tool?> currentTool = Tool().obs;
  Rx<double> fontSize = 14.0.obs;
  Rx<Fragment> fragment = Fragment().obs;
  RxList<Verse> contextBefore = RxList<Verse>();
  RxList<Fragment> historyRedo = RxList<Fragment>();
  RxList<Fragment> historyUndo = RxList<Fragment>();
  final _mainPageController = Get.find<MainPageController>();

  @override
  void onInit() {
    super.onInit();
  }

  updateFragment() {
    historyUndo.add(fragment.value.copyWith());
    historyRedo.clear();
    while (historyUndo.length > 21) {
      historyUndo.removeAt(0);
    }
    _mainPageController.updateDataBaseFragments();
  }

  stepUndo() {
    if (historyUndo.length <= 1) {
      return;
    }

    historyRedo.add(historyUndo.last);
    historyUndo.removeAt(historyUndo.length - 1);
    _setLastHistoryToFragment();
  }

  stepRedo() {
    if (historyRedo.isEmpty) {
      return;
    }

    historyUndo.add(historyRedo.last);
    historyRedo.removeAt(historyRedo.length - 1);
    _setLastHistoryToFragment();
  }

  _setLastHistoryToFragment() {
    var copyFragment = historyUndo.last.copyWith();
    fragment.value.bookId = copyFragment.bookId;
    fragment.value.description = copyFragment.description;
    // 12fragment.value.name = copyFragment.name;
    fragment.value.structuralLawList =
        copyFragment.structuralLawList?.copyWith();
    fragment.value.wordStyleList = copyFragment.wordStyleList?.copyWith();
    // fragment.value.text = copyFragment.text;
    _mainPageController.updateDataBaseFragments();
    fragment.update((val) {});
  }

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
