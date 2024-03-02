import 'package:bible_depth/data/bible/bible.dart';
import 'package:bible_depth/data/bible/rst.dart';
import 'package:bible_depth/models/fragment.dart';
import 'package:get/get.dart';

class NewFragmentPageController extends GetxController {
  Rx<Bible>? bible;
  Book? selectedBook;
  Rx<int> selectedChapterStart = 999999.obs;
  Rx<int> selectedChapterEnd = 0.obs;

  Rx<int> selectedVerseStart = 999999.obs;
  Rx<int> selectedVerseEnd = 0.obs;

  Fragment? selectedFragment;

  Future<void> initBible() async {
    bible = (await Rst.instance).obs;
  }

  void initSelectedChapterAndVerse() {
    selectedChapterStart.value = 999999;
    selectedChapterEnd.value = 0;
    selectedVerseStart.value = 999999;
    selectedVerseEnd.value = 0;
  }

  void createFragment() {
    Fragment newFragment = Fragment.fromBible(
      book: selectedBook!,
      verseStart: selectedVerseStart.value,
      chapterStart: selectedChapterStart.value,
      verseEnd: selectedVerseEnd.value,
      chapterEnd: selectedChapterEnd.value,
    );

    selectedFragment = newFragment;
  }
}
