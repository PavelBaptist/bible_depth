import 'package:bible_depth/models/fragment.dart';
import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/widgets/pages/main/controller.dart';
import 'package:bible_depth/ui/widgets/pages/new_fragment/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectChapterAndVersePage extends StatelessWidget {
  SelectChapterAndVersePage({super.key});
  final NewFragmentPageController c = Get.find();
  final MainPageController mainPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(c.selectedBook!.bookName),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(() {
        if (c.selectedVerseStart.value == 999999) {
          return Container();
        }
        return SizedBox(
          width: 300,
          height: 50,
          child: FloatingActionButton(
            child: Text(
                'Создать (${c.selectedBook!.bookName} ${c.selectedChapterStart}:${c.selectedVerseStart} - ${c.selectedChapterEnd}:${c.selectedVerseEnd})'),
            onPressed: () {
              Fragment newFragment = c.createFragment();
              mainPageController.fragmentList!.value.list
                  .insert(0, newFragment);
              mainPageController.fragmentList!.update((val) {});
              mainPageController.updateDataBaseFragments();
              Get.until((route) => route.isFirst);
            },
          ),
        );
      }),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              return Wrap(
                alignment: WrapAlignment.start,
                children: () {
                  List<Widget> result = [];

                  for (var chapter in c.selectedBook!.chapters) {
                    result.add(ListTile(
                      title: Text('Глава ${chapter.id}'),
                    ));
                    for (var verse in chapter.verses) {
                      result.add(
                        InkWell(
                          onTap: () {
                            if (c.selectedVerseStart.value == 999999) {
                              c.selectedVerseStart.value = verse.id;
                              c.selectedVerseEnd.value = verse.id;
                              c.selectedChapterStart.value = chapter.id;
                              c.selectedChapterEnd.value = chapter.id;
                            } else if (c.selectedVerseStart.value ==
                                    c.selectedVerseEnd.value &&
                                c.selectedChapterStart.value ==
                                    c.selectedChapterEnd.value) {
                              c.selectedVerseEnd.value = verse.id;
                              c.selectedChapterEnd.value = chapter.id;
                              if (((c.selectedVerseEnd.value <
                                          c.selectedVerseStart.value &&
                                      c.selectedChapterEnd.value ==
                                          c.selectedChapterStart.value) ||
                                  c.selectedChapterEnd.value <
                                      c.selectedChapterStart.value)) {
                                c.selectedVerseEnd.value =
                                    c.selectedVerseStart.value;
                                c.selectedChapterEnd.value =
                                    c.selectedChapterStart.value;
                                c.selectedVerseStart.value = verse.id;
                                c.selectedChapterStart.value = chapter.id;
                              }
                            } else {
                              c.initSelectedChapterAndVerse();
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5.0),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: isSelctedVerse(verse.id, chapter.id)
                                  ? Colors.deepPurple.shade100
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(child: Text('${verse.id}')),
                          ),
                        ),
                      );
                    }
                  }

                  return result;
                }(),
              );
            }),
          ),
        ],
      ),
    );
  }

  bool isSelctedVerse(int verseId, int chapterId) {
    int selVerStart = c.selectedVerseStart.value;
    int selVerEnd = c.selectedVerseEnd.value;
    int selChaptStart = c.selectedChapterStart.value;
    int selChaptEnd = c.selectedChapterEnd.value;

    return ((verseId >= selVerStart && chapterId == selChaptStart) ||
            (chapterId > selChaptStart)) &&
        ((verseId <= selVerEnd && chapterId == selChaptEnd) ||
            (chapterId < selChaptEnd));
  }
}
