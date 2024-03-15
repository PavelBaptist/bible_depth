import 'package:bible_depth/models/fragment.dart';
import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/pages/main/controller.dart';
import 'package:bible_depth/ui/pages/new_fragment/controller.dart';
import 'package:bible_depth/ui/svg/svgs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectChapterAndVersePage extends StatelessWidget {
  SelectChapterAndVersePage({super.key});
  final NewFragmentPageController c = Get.find();
  final MainPageController mainPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    ThemeData style = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const SvgIcon(SvgIcons.arrowLeft),
        ),
        title: Text(c.selectedBook!.bookName.toUpperCase()),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(() {
        if (c.selectedVerseStart.value == 999999) {
          return Container();
        }
        return SizedBox(
          width: 500,
          height: 70,
          child: FloatingActionButton(
            shape: const BeveledRectangleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'СОЗДАТЬ',
                    style: style.textTheme.titleMedium?.copyWith(
                      color: style.colorScheme.inversePrimary,
                    ),
                  ),
                  Text(
                    '(${c.selectedBook!.bookName} ${c.selectedChapterStart}:${c.selectedVerseStart} - ${c.selectedChapterEnd}:${c.selectedVerseEnd})',
                    style: style.textTheme.bodySmall?.copyWith(
                      color: style.colorScheme.inversePrimary,
                    ),
                  ),
                ],
              ),
            ),
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
        padding: const EdgeInsets.symmetric(horizontal: 50),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              return Wrap(
                alignment: WrapAlignment.start,
                children: () {
                  List<Widget> result = [];

                  for (var chapter in c.selectedBook!.chapters) {
                    result.add(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            color: Colors.grey.shade300,
                          ),
                          Text(
                            'Глава ${chapter.id}',
                            style: TextStyle(color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                    );
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
                                  ? style.colorScheme.primary
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                '${verse.id}',
                                style: TextStyle(
                                  color: isSelctedVerse(verse.id, chapter.id)
                                      ? style.colorScheme.inversePrimary
                                      : Colors.black,
                                ),
                              ),
                            ),
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
