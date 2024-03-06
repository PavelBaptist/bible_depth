import 'package:bible_depth/helpers/dialogs.dart';
import 'package:bible_depth/models/word_style.dart';
import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/controller.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/widgets/results_widget.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/widgets/tool_word_style_widget.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/widgets/verse_index_widget.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/widgets/word_widget.dart';
import 'package:bible_depth/ui/widgets/pages/main/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SampleItem {
  addSpaceBefore,
  addSpaceAfter,
  copyStyle,
  splitWords,
}

class FragmentPage extends StatelessWidget {
  final FragmentPageController c = Get.put(FragmentPageController());
  final mainPageController = Get.find<MainPageController>();

  FragmentPage({super.key}) {
    c.fragment.value = mainPageController.selectedFragment!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Изучение отрывка')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        c.fragment.value.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Obx(
                    () {
                      return Wrap(
                        spacing: 0,
                        runSpacing: c.fontSize.value,
                        children: () {
                          List<Widget> result = [];
                          List<WrapEntity> text = c.fragment.value.text;

                          for (var i = 0; i < text.length; i++) {
                            WrapEntity wrapEntity = text[i];
                            if (wrapEntity is Word) {
                              result.add(WordWidget(
                                wrapEntity,
                                wordStyleList:
                                    mainPageController.wordStyleList!.value,
                                onTap: () {
                                  wrapEntity.styleId = c.currentStyle.value!.id;
                                  int indexBefore = i <= 1 ? i : i - 2;
                                  Word? wordBefore = text[indexBefore] is Word
                                      ? text[indexBefore] as Word
                                      : null;
                                  int indexAfter =
                                      i >= text.length - 1 ? i : i + 2;
                                  Word? wordAfter = text[indexAfter] is Word
                                      ? text[indexAfter] as Word
                                      : null;

                                  if (wordBefore?.styleId ==
                                          wrapEntity.styleId &&
                                      wordAfter?.styleId ==
                                          wrapEntity.styleId) {
                                    showConfirmationDialog(
                                      context,
                                      titleText: 'Объединить?',
                                      text:
                                          'Можно объединить "${wordBefore!.value}" + "${wrapEntity.value}" + "${wordAfter!.value}"',
                                      onTapYes: () {
                                        wordBefore.value +=
                                            ' ${wrapEntity.value} ${wordAfter.value}';
                                        text.removeAt(i + 2);
                                        text.removeAt(i + 1);
                                        text.removeAt(i);
                                        text.removeAt(i - 1);
                                        c.fragment.update((val) {});
                                      },
                                    );
                                  } else {
                                    if (wordBefore?.styleId ==
                                        wrapEntity.styleId) {
                                      showConfirmationDialog(
                                        context,
                                        titleText: 'Объединить?',
                                        text:
                                            'Можно объединить "${wordBefore!.value}" + "${wrapEntity.value}"',
                                        onTapYes: () {
                                          wordBefore.value +=
                                              ' ${wrapEntity.value}';
                                          text.removeAt(i);
                                          text.removeAt(i - 1);
                                          c.fragment.update((val) {});
                                        },
                                      );
                                    }
                                    if (wordAfter?.styleId ==
                                        wrapEntity.styleId) {
                                      showConfirmationDialog(
                                        context,
                                        titleText: 'Объединить?',
                                        text:
                                            'Можно объединить "${wrapEntity.value}" + "${wordAfter!.value}"',
                                        onTapYes: () {
                                          wordAfter.value =
                                              '${wrapEntity.value} ${wordAfter.value}';
                                          text.removeAt(i + 1);
                                          text.removeAt(i);
                                          c.fragment.update((val) {});
                                        },
                                      );
                                    }
                                  }

                                  mainPageController.updateDataBaseFragments();
                                  c.fragment.update((val) {});
                                },
                                onLongPress: (context) {
                                  showPopupMenu(
                                    context,
                                    popupMenuList: <PopupMenuEntry<SampleItem>>[
                                      const PopupMenuItem<SampleItem>(
                                        value: SampleItem.copyStyle,
                                        child: Text('Скопировать стиль'),
                                      ),
                                      const PopupMenuItem<SampleItem>(
                                        value: SampleItem.addSpaceBefore,
                                        child: Text('Добавить перенос ДО'),
                                      ),
                                      const PopupMenuItem<SampleItem>(
                                        value: SampleItem.addSpaceAfter,
                                        child: Text('Добавить перенос ПОСЛЕ'),
                                      ),
                                      const PopupMenuItem<SampleItem>(
                                        value: SampleItem.splitWords,
                                        child: Text('Разделить слова'),
                                      ),
                                    ],
                                    onValue: (value) {
                                      if (value == SampleItem.addSpaceBefore) {
                                        c.fragment.update((val) {
                                          val?.text.insert(i, LineBreak());
                                        });
                                        mainPageController
                                            .updateDataBaseFragments();
                                      } else if (value ==
                                          SampleItem.addSpaceAfter) {
                                        c.fragment.update((val) {
                                          val?.text.insert(i + 2, LineBreak());
                                        });
                                        mainPageController
                                            .updateDataBaseFragments();
                                      } else if (value ==
                                          SampleItem.copyStyle) {
                                        c.currentStyle.value =
                                            mainPageController
                                                .wordStyleList?.value
                                                .getWordStyleById(
                                                    wrapEntity.styleId);
                                      } else if (value ==
                                          SampleItem.splitWords) {
                                        var words = wrapEntity.value.split(' ');
                                        var wordsWidgets = <WrapEntity>[];
                                        for (var word in words) {
                                          wordsWidgets.add(
                                            Word()
                                              ..value = word
                                              ..styleId = wrapEntity.styleId,
                                          );
                                          wordsWidgets.add(Space());
                                        }
                                        wordsWidgets
                                            .removeAt(wordsWidgets.length - 1);

                                        text.removeAt(i);
                                        text.insertAll(i, wordsWidgets);

                                        mainPageController
                                            .updateDataBaseFragments();
                                        c.fragment.update((val) {});
                                      }
                                    },
                                  );
                                },
                                fontSize: c.fontSize.value,
                              ));
                            } else if (wrapEntity is VerseIndex) {
                              result.add(VerseIndexWidget(wrapEntity));
                            } else if (wrapEntity is Space) {
                              result
                                  .add(SizedBox(width: c.fontSize.value / 2.5));
                            } else if (wrapEntity is LineBreak) {
                              result.add(const Row());
                            }
                          }

                          return result;
                        }(),
                      );
                    },
                  ),
                ),
                const Divider(),
                ResultsWidget(),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 150.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(30),
                  blurRadius: 10,
                  spreadRadius: 0,
                )
              ],
              color: Colors.grey[100],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    child: Obx(() => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mainPageController
                              .wordStyleList!.value.list.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: ToolWordStyleWidget(
                                  wordStyle: mainPageController
                                      .wordStyleList!.value.list[index]),
                            );
                          },
                        )),
                  ),
                  const SizedBox(height: 3),
                  Text('*для изменения стиля удерживайте на нем'),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => c.fontSize.value--,
                        child: const Icon(Icons.exposure_minus_1_outlined),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => c.fontSize.value++,
                        child: const Icon(Icons.plus_one),
                      ),
                      const SizedBox(width: 30),
                      ElevatedButton(
                        onPressed: () {
                          mainPageController.wordStyleList!.value.list
                              .add(WordStyle());
                          mainPageController.updateDataBaseWordStyles();
                          mainPageController.wordStyleList?.update((val) {});
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
