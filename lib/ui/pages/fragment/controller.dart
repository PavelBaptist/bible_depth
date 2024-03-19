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
  RxList<Verse> contextAfter = RxList<Verse>();
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
    // fragment.value.description = copyFragment.description;
    // fragment.value.name = copyFragment.name;
    fragment.value.structuralLawList =
        copyFragment.structuralLawList?.copyWith();
    fragment.value.wordStyleList = copyFragment.wordStyleList?.copyWith();
    fragment.value.text = copyFragment.text;
    _mainPageController.updateDataBaseFragments();
    fragment.update((val) {});
  }

  Future<Verse> getFirstContextVerseEntity() async {
    if (contextBefore.isEmpty) {
      return fragment.value.getFirstVerseEntity();
    } else {
      return contextBefore[0];
    }
  }

  Future<Verse> getLastContextVerseEntity() async {
    if (contextAfter.isEmpty) {
      return fragment.value.getLastVerseEntity();
    } else {
      return contextAfter[contextAfter.length - 1];
    }
  }

  addContext(int chapterId, int verseId) async {
    Verse lastVerse = await fragment.value.getLastVerseEntity();
    if (chapterId > lastVerse.chapterId ||
        (chapterId == lastVerse.chapterId && verseId > lastVerse.id)) {
      contextAfter.clear();
    } else {
      contextBefore.clear();
    }
    fragment.value.addContext(chapterId, verseId);

    updateFragment();
    fragment.update((val) {});
  }
}
