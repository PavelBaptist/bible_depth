import 'package:bible_depth/data/bible/bible.dart';
import 'package:bible_depth/data/bible/rst.dart';
import 'package:bible_depth/helpers/dialogs.dart';
import 'package:bible_depth/helpers/lists.dart';
import 'package:bible_depth/models/structural_law.dart';
import 'package:bible_depth/models/word_style.dart';
import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/pages/fragment/controller.dart';
import 'package:bible_depth/ui/pages/fragment/widgets/block_widget.dart';
import 'package:bible_depth/ui/pages/fragment/widgets/chapter_index_widget.dart';
import 'package:bible_depth/ui/pages/fragment/widgets/context_verse_widget.dart';
import 'package:bible_depth/ui/pages/fragment/widgets/header_widget.dart';
import 'package:bible_depth/ui/pages/fragment/widgets/results_widget.dart';
import 'package:bible_depth/ui/pages/fragment/widgets/structural_law_widget.dart';
import 'package:bible_depth/ui/pages/fragment/widgets/tool_structural_law_widget.dart';
import 'package:bible_depth/ui/pages/fragment/widgets/tool_word_style_widget.dart';
import 'package:bible_depth/ui/pages/fragment/widgets/verse_index_widget.dart';
import 'package:bible_depth/ui/pages/fragment/widgets/word_widget.dart';
import 'package:bible_depth/ui/pages/main/controller.dart';
import 'package:bible_depth/ui/svg/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

enum Menu {
  edit,
  addLineBreakBefore,
  addLineBreakAfter,
  addHeaderBefore,
  addHeaderAfter,
  deleteSpaceBefore,
  deleteSpaceAfter,
  addStructuralLawBefore,
  addStructuralLawAfter,
  clearStructuralLaw,
  copyStructuralLaw,
  copyStyle,
  clearStyle,
  delete,
  splitWords,
}

class FragmentPage extends StatelessWidget {
  final FragmentPageController c = Get.put(FragmentPageController());
  final mainPageController = Get.find<MainPageController>();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  FragmentPage({super.key}) {
    c.fragment.value = mainPageController.selectedFragment!;
    c.historyUndo.add(c.fragment.value.copyWith());
  }

  @override
  Widget build(BuildContext context) {
    ThemeData style = Theme.of(context);

    descriptionController.text = c.fragment.value.description ?? '';
    nameController.text = c.fragment.value.name;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const SvgIcon(SvgIcons.arrowLeft),
        ),
        title: TextField(
          controller: nameController,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          onChanged: (value) {
            c.fragment.value.name = value;
            c.updateFragment();
          },
        ),
        actions: [
          IconButton(
            onPressed: () => c.fontSize.value--,
            icon: SvgIcon(
              SvgIcons.zoomMinus,
            ),
          ),
          SizedBox(width: 5.w),
          IconButton(
            onPressed: () => c.fontSize.value++,
            icon: SvgIcon(
              SvgIcons.zoomPlus,
            ),
          ),
          SizedBox(width: 16.w),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              children: [
                Column(
                  children: [
                    Obx(() => c.contextBefore.isEmpty
                        ? const SizedBox()
                        : Padding(
                            padding: EdgeInsets.only(top: 16.h),
                            child: BlockWidget(
                              header: 'Контекст',
                              actions: [
                                IconButton(
                                    onPressed: () => c.contextBefore.clear(),
                                    icon: const SvgIcon(SvgIcons.closeLight))
                              ],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: () {
                                  List<Widget> widgets = [];

                                  for (var i = 0;
                                      i < c.contextBefore.length;
                                      i++) {
                                    widgets.add(
                                      ContextVerseWidget(
                                        c.contextBefore[i],
                                      ),
                                    );
                                  }

                                  return widgets;
                                }(),
                              ),
                            ),
                          )),
                    SizedBox(height: 16.h),
                    InkWell(
                      onTap: () async {
                        Book book = (await Rst.instance)
                            .books[c.fragment.value.bookId! - 1];
                        Verse firstVerse = await c.getFirstContextVerseEntity();
                        int chapterId = firstVerse.chapterId;
                        int verseId = firstVerse.id;
                        for (var i = 0; i < 10; i++) {
                          if (chapterId == 1 && verseId == 1) {
                            return;
                          }

                          verseId--;
                          if (verseId == 0) {
                            chapterId--;
                            verseId =
                                book.chapters[chapterId - 1].verses.length;
                          }

                          var verse =
                              book.chapters[chapterId - 1].verses[verseId - 1];
                          c.contextBefore.insert(0, verse);
                        }
                        c.fragment.update((val) {});
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Посмотреть контекст (+ 10 стихов)',
                          style: style.textTheme.bodySmall?.copyWith(
                            color: style.colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 26.h),
                    Obx(
                      () {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Wrap(
                            spacing: 0,
                            runSpacing: c.fontSize.value.h,
                            children: () {
                              List<Widget> result = [];
                              List<WrapEntity> text = c.fragment.value.text;

                              for (var i = 0; i < text.length; i++) {
                                WrapEntity wrapEntity = text[i];

                                // ignore: prefer_function_declarations_over_variables
                                var onLongPress = (context) {
                                  showPopupMenu(
                                    context,
                                    popupMenuList: <PopupMenuEntry<Menu>>[
                                      // важное
                                      if (wrapEntity is Header)
                                        myPopupItem(Menu.edit,
                                            icon: const Icon(Icons.edit),
                                            text: const Text('Изменить')),

                                      if (wrapEntity is Word &&
                                          wrapEntity.styleId.isNotEmpty)
                                        myPopupItem(
                                          Menu.copyStyle,
                                          icon: const Icon(Icons.copy),
                                          text: Row(
                                            children: [
                                              const Text('Скопировать '),
                                              WordWidget(
                                                Word()
                                                  ..value = 'стиль'
                                                  ..styleId =
                                                      wrapEntity.styleId,
                                                fontSize: 14.sp,
                                              )
                                            ],
                                          ),
                                        ),

                                      if (wrapEntity is Word &&
                                          wrapEntity.styleId.isNotEmpty)
                                        myPopupItem(
                                          Menu.clearStyle,
                                          icon: const Icon(Icons.clear),
                                          text: Row(
                                            children: [
                                              const Text('Очистить '),
                                              WordWidget(
                                                Word()
                                                  ..value = 'стиль'
                                                  ..styleId =
                                                      wrapEntity.styleId,
                                                fontSize: 14.sp,
                                              )
                                            ],
                                          ),
                                        ),

                                      if (wrapEntity is Header ||
                                          (wrapEntity is Word &&
                                              wrapEntity.styleId.isNotEmpty))
                                        const PopupMenuDivider(),

                                      // структурные законы
                                      if (c.currentTool.value is StructuralLaw)
                                        myPopupItem(Menu.addStructuralLawBefore,
                                            icon: const Icon(Icons.add),
                                            text: Row(
                                              children: [
                                                const Text(
                                                    'Значок слева (добавить)'),
                                                StructuralLawWidget(
                                                  (c.currentTool.value
                                                          as StructuralLaw)
                                                      .id,
                                                  size: 20,
                                                )
                                              ],
                                            )),
                                      if (c.currentTool.value is StructuralLaw)
                                        myPopupItem(Menu.addStructuralLawAfter,
                                            icon: const Icon(Icons.add),
                                            text: Row(
                                              children: [
                                                const Text(
                                                    'Значок справа (добавить)'),
                                                StructuralLawWidget(
                                                  (c.currentTool.value
                                                          as StructuralLaw)
                                                      .id,
                                                  size: 20,
                                                )
                                              ],
                                            )),

                                      if (wrapEntity is Word &&
                                          wrapEntity.structuralLawId.isNotEmpty)
                                        myPopupItem(Menu.copyStructuralLaw,
                                            icon: const Icon(Icons.copy),
                                            text: Row(
                                              children: [
                                                const Text(
                                                    'Значок (копировать)'),
                                                StructuralLawWidget(
                                                  wrapEntity.structuralLawId,
                                                  size: 20,
                                                )
                                              ],
                                            )),
                                      if (wrapEntity is StructuralLawPlace)
                                        myPopupItem(Menu.copyStructuralLaw,
                                            icon: const Icon(Icons.copy),
                                            text: Row(
                                              children: [
                                                const Text(
                                                    'Значок (копировать)'),
                                                StructuralLawWidget(
                                                  wrapEntity.structuralLawId,
                                                  size: 20,
                                                )
                                              ],
                                            )),

                                      if (wrapEntity is Word &&
                                          wrapEntity.structuralLawId.isNotEmpty)
                                        myPopupItem(Menu.clearStructuralLaw,
                                            icon: const Icon(Icons.remove),
                                            text: Row(
                                              children: [
                                                const Text('Значок (удалить)'),
                                                StructuralLawWidget(
                                                  wrapEntity.structuralLawId,
                                                  size: 20,
                                                )
                                              ],
                                            )),

                                      if (wrapEntity is StructuralLawPlace)
                                        myPopupItem(Menu.delete,
                                            icon: const Icon(Icons.remove),
                                            text: Row(
                                              children: [
                                                const Text('Значок (удалить)'),
                                                StructuralLawWidget(
                                                  wrapEntity.structuralLawId,
                                                  size: 20,
                                                )
                                              ],
                                            )),

                                      if (wrapEntity is StructuralLawPlace ||
                                          (wrapEntity is Word &&
                                              wrapEntity.structuralLawId
                                                  .isNotEmpty) ||
                                          c.currentTool.value is StructuralLaw)
                                        const PopupMenuDivider(),

                                      // заголовки
                                      myPopupItem(Menu.addHeaderBefore,
                                          icon: const Icon(Icons.add),
                                          text: const Text(
                                              'Заголовок слева (добавить)')),
                                      myPopupItem(Menu.addHeaderAfter,
                                          icon: const Icon(Icons.add),
                                          text: const Text(
                                              'Заголовок справа (добавить)')),

                                      const PopupMenuDivider(),

                                      // перенос строки
                                      if (tryGetListElement(text, i - 1)
                                          is! LineBreak)
                                        myPopupItem(
                                          Menu.addLineBreakBefore,
                                          icon: const Icon(Icons.add),
                                          text: const Text(
                                              'Перенос слева (добавить)'),
                                        ),
                                      if (tryGetListElement(text, i - 1)
                                          is LineBreak)
                                        myPopupItem(
                                          Menu.deleteSpaceBefore,
                                          icon: const Icon(Icons.remove),
                                          text: const Text(
                                              'Перенос слева (удалить)'),
                                        ),
                                      if (tryGetListElement(text, i + 1)
                                          is! LineBreak)
                                        myPopupItem(
                                          Menu.addLineBreakAfter,
                                          icon: const Icon(Icons.add),
                                          text: const Text(
                                              'Перенос справа (добавить)'),
                                        ),
                                      if (tryGetListElement(text, i + 1)
                                          is LineBreak)
                                        myPopupItem(
                                          Menu.deleteSpaceAfter,
                                          icon: const Icon(Icons.remove),
                                          text: const Text(
                                              'Перенос справа (удалить)'),
                                        ),

                                      const PopupMenuDivider(),

                                      // прочее
                                      if (wrapEntity is Word &&
                                          wrapEntity.value.contains(' '))
                                        myPopupItem(
                                          Menu.splitWords,
                                          icon: const Icon(Icons.layers_clear),
                                          text: const Text('Разделить слова'),
                                        ),

                                      if (wrapEntity is! Word &&
                                          wrapEntity is! VerseIndex &&
                                          wrapEntity is! ChapterIndex &&
                                          wrapEntity is! StructuralLawPlace)
                                        myPopupItem(Menu.delete,
                                            icon: const Icon(Icons.delete),
                                            text:
                                                const Text('Удалить элемент')),
                                    ],
                                    onValue: (value) {
                                      if (value == Menu.edit) {
                                        if (wrapEntity is Header) {
                                          Get.toNamed('/fragment/header_editor',
                                              arguments: {
                                                'header': wrapEntity
                                              });
                                        }
                                      } else if (value ==
                                          Menu.addHeaderBefore) {
                                        Header newHeader = Header();

                                        c.fragment.update((val) {
                                          val?.text.insert(i, newHeader);
                                        });
                                        c.updateFragment();
                                        Get.toNamed('/fragment/header_editor',
                                            arguments: {'header': newHeader});
                                      } else if (value == Menu.addHeaderAfter) {
                                        Header newHeader = Header();

                                        c.fragment.update((val) {
                                          val?.text.insert(i + 1, newHeader);
                                        });
                                        c.updateFragment();
                                        Get.toNamed('/fragment/header_editor',
                                            arguments: {'header': newHeader});
                                      } else if (value ==
                                          Menu.addLineBreakBefore) {
                                        c.fragment.update((val) {
                                          val?.text.insert(i, LineBreak());
                                        });
                                        c.updateFragment();
                                      } else if (value ==
                                          Menu.addLineBreakAfter) {
                                        c.fragment.update((val) {
                                          val?.text.insert(i + 1, LineBreak());
                                        });
                                        c.updateFragment();
                                      } else if (value ==
                                          Menu.deleteSpaceBefore) {
                                        if (c.fragment.value.text[i - 1]
                                            is LineBreak) {
                                          c.fragment.update((val) {
                                            val?.text.removeAt(i - 1);
                                          });
                                          c.updateFragment();
                                        }
                                      } else if (value ==
                                          Menu.deleteSpaceAfter) {
                                        if (c.fragment.value.text[i + 1]
                                            is LineBreak) {
                                          c.fragment.update((val) {
                                            val?.text.removeAt(i + 1);
                                          });
                                          c.updateFragment();
                                        }
                                      } else if (value ==
                                          Menu.addStructuralLawBefore) {
                                        c.fragment.update((val) {
                                          val?.text.insert(
                                              i,
                                              StructuralLawPlace()
                                                ..structuralLawId = (c
                                                        .currentTool
                                                        .value as StructuralLaw)
                                                    .id);
                                        });
                                        c.updateFragment();
                                      } else if (value ==
                                          Menu.addStructuralLawAfter) {
                                        c.fragment.update((val) {
                                          val?.text.insert(
                                              i + 1,
                                              StructuralLawPlace()
                                                ..structuralLawId = (c
                                                        .currentTool
                                                        .value as StructuralLaw)
                                                    .id);
                                        });
                                        c.updateFragment();
                                      } else if (value ==
                                          Menu.clearStructuralLaw) {
                                        if (wrapEntity is Word) {
                                          wrapEntity.structuralLawId = '';
                                          c.updateFragment();
                                          c.fragment.update((val) {});
                                        }
                                      } else if (value ==
                                          Menu.copyStructuralLaw) {
                                        if (wrapEntity is Word) {
                                          c.currentTool.value = c
                                              .fragment.value.structuralLawList!
                                              .getWordStyleById(
                                                  wrapEntity.structuralLawId);
                                        } else if (wrapEntity
                                            is StructuralLawPlace) {
                                          c.currentTool.value = c
                                              .fragment.value.structuralLawList!
                                              .getWordStyleById(
                                                  wrapEntity.structuralLawId);
                                        }
                                      } else if (value == Menu.copyStyle) {
                                        if (wrapEntity is Word) {
                                          c.currentTool.value = c
                                              .fragment.value.wordStyleList!
                                              .getWordStyleById(
                                                  wrapEntity.styleId);
                                        } else if (wrapEntity
                                            is StructuralLawPlace) {
                                          c.currentTool.value = c
                                              .fragment.value.structuralLawList!
                                              .getWordStyleById(
                                                  wrapEntity.structuralLawId);
                                        }
                                      } else if (value == Menu.clearStyle) {
                                        if (wrapEntity is Word) {
                                          wrapEntity.styleId = '';
                                          c.updateFragment();
                                          splitWords(wrapEntity, text, i);
                                          c.fragment.update((val) {});
                                        }
                                      } else if (value == Menu.splitWords) {
                                        splitWords(wrapEntity, text, i);
                                      } else if (value == Menu.delete) {
                                        if (wrapEntity is! Word &&
                                            wrapEntity is! VerseIndex &&
                                            wrapEntity is! ChapterIndex) {
                                          c.fragment.update((val) {
                                            val?.text.removeAt(i);
                                          });
                                          c.updateFragment();
                                        }
                                      }
                                    },
                                  );
                                };
                                if (wrapEntity is Word) {
                                  result.add(WordWidget(
                                    wrapEntity,
                                    onTap: () {
                                      if (c.currentTool.value
                                          is StructuralLaw) {
                                        wrapEntity.structuralLawId = (c
                                                .currentTool
                                                .value as StructuralLaw)
                                            .id;
                                      } else if (c.currentTool.value
                                          is WordStyle) {
                                        wrapEntity.styleId =
                                            (c.currentTool.value as WordStyle)
                                                .id;
                                        int indexBefore = i < 1 ? i : i - 1;
                                        Word? wordBefore = i == 0
                                            ? null
                                            : text[indexBefore] is Word
                                                ? text[indexBefore] as Word
                                                : null;
                                        int indexAfter =
                                            i >= text.length - 1 ? i : i + 1;
                                        Word? wordAfter = i == text.length - 1
                                            ? null
                                            : text[indexAfter] is Word
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
                                              text.removeAt(i + 1);
                                              text.removeAt(i);
                                              c.updateFragment();
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
                                                c.updateFragment();
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

                                                text.removeAt(i);
                                                c.updateFragment();
                                                c.fragment.update((val) {});
                                              },
                                            );
                                          }
                                        }
                                      }
                                      c.updateFragment();
                                      c.fragment.update((val) {});
                                    },
                                    onLongPress: onLongPress,
                                    fontSize: c.fontSize.value.sp,
                                  ));
                                } else if (wrapEntity is VerseIndex) {
                                  result.add(VerseIndexWidget(
                                    wrapEntity,
                                    onLongPress: onLongPress,
                                  ));
                                } else if (wrapEntity is ChapterIndex) {
                                  result.add(ChapterIndexWidget(
                                    wrapEntity,
                                    onLongPress: onLongPress,
                                  ));
                                } else if (wrapEntity is LineBreak) {
                                  result.add(const Row());
                                } else if (wrapEntity is Header) {
                                  result.add(HeaderWidget(
                                    wrapEntity,
                                    onLongPress: onLongPress,
                                    fontSize: c.fontSize.value.sp,
                                  ));
                                } else if (wrapEntity is StructuralLawPlace) {
                                  result.add(StructuralLawWidget(
                                    wrapEntity.structuralLawId,
                                    size: c.fontSize.value.sp,
                                    onTap: () {
                                      if (c.currentTool.value
                                          is StructuralLaw) {
                                        c.fragment.update((val) {
                                          (val!.text[i] as StructuralLawPlace)
                                              .structuralLawId = (c.currentTool
                                                  .value as StructuralLaw)
                                              .id;
                                        });
                                        c.updateFragment();
                                      }
                                    },
                                    onLongPress: onLongPress,
                                  ));
                                }
                              }

                              return result;
                            }(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 26.h),
                    InkWell(
                      onTap: () async {
                        Book book = (await Rst.instance)
                            .books[c.fragment.value.bookId! - 1];
                        Verse lastVerse = await c.getLastContextVerseEntity();
                        int chapterId = lastVerse.chapterId;
                        int verseId = lastVerse.id;
                        int maxChapterId = book.chapters.length;
                        int maxVerseId =
                            book.chapters[maxChapterId - 1].verses.length;
                        for (var i = 0; i < 10; i++) {
                          if (chapterId == maxChapterId &&
                              verseId == maxVerseId) {
                            return;
                          }

                          verseId++;
                          if (verseId >=
                              book.chapters[chapterId - 1].verses.length) {
                            chapterId++;
                            verseId = 1;
                          }

                          var verse =
                              book.chapters[chapterId - 1].verses[verseId - 1];
                          c.contextAfter.add(verse);
                        }
                        c.fragment.update((val) {});
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Посмотреть контекст (+ 10 стихов)',
                          style: style.textTheme.bodySmall?.copyWith(
                            color: style.colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Obx(
                      () => c.contextAfter.isEmpty
                          ? const SizedBox()
                          : Padding(
                              padding: EdgeInsets.only(top: 16.h),
                              child: BlockWidget(
                                header: 'Контекст',
                                actions: [
                                  IconButton(
                                      onPressed: () => c.contextAfter.clear(),
                                      icon: const SvgIcon(SvgIcons.closeLight))
                                ],
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: () {
                                    List<Widget> widgets = [];

                                    for (var i = 0;
                                        i < c.contextAfter.length;
                                        i++) {
                                      widgets.add(
                                        ContextVerseWidget(
                                          c.contextAfter[i],
                                        ),
                                      );
                                    }

                                    return widgets;
                                  }(),
                                ),
                              ),
                            ),
                    ),
                    SizedBox(height: 16.h),
                    BlockWidget(
                      header: 'Автоматические итоги',
                      child: ResultsWidget(),
                    ),
                    BlockWidget(
                      header: 'Заметки',
                      child: Obx(() => TextField(
                            controller: descriptionController,
                            maxLines: null,
                            style: TextStyle(fontSize: c.fontSize.value.sp),
                            onChanged: (value) {
                              c.fragment.value.description =
                                  descriptionController.text;
                              c.updateFragment();
                            },
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
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
            child: SafeArea(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => Row(
                            children: [
                              IconButton(
                                icon: c.historyUndo.length <= 1
                                    ? const SvgIcon(SvgIcons.undoDisabled)
                                    : const SvgIcon(SvgIcons.undo),
                                onPressed: () => c.stepUndo(),
                              ),
                              IconButton(
                                icon: c.historyRedo.isEmpty
                                    ? const SvgIcon(SvgIcons.redoDisabled)
                                    : const SvgIcon(SvgIcons.redo),
                                onPressed: () => c.stepRedo(),
                              ),
                            ],
                          )),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              c.fragment.value.wordStyleList!.list
                                  .insert(0, WordStyle());
                              c.updateFragment();
                              c.fragment.update((val) {});
                            },
                            icon: SvgIcon(SvgIcons.addGrey),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 40.h,
                              child: Obx(() => ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: c.fragment.value.wordStyleList!
                                        .list.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10.w,
                                        ),
                                        child: ToolWordStyleWidget(
                                          wordStyle: c.fragment.value
                                              .wordStyleList!.list[index],
                                        ),
                                      );
                                    },
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              c.fragment.value.structuralLawList!.list
                                  .insert(0, StructuralLaw());
                              c.updateFragment();
                              c.fragment.update((val) {});
                            },
                            icon: const SvgIcon(SvgIcons.addGrey),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 40.h,
                              child: Obx(() => ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: c.fragment.value
                                        .structuralLawList!.list.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10.w,
                                        ),
                                        child: ToolStructuralLawWidget(
                                          structuralLaw: c.fragment.value
                                              .structuralLawList!.list[index],
                                        ),
                                      );
                                    },
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '* для изменения стиля или значка удерживайте на нем',
                          style: style.textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void splitWords(WrapEntity wrapEntity, List<WrapEntity> text, int i) {
    if (wrapEntity is Word) {
      var words = wrapEntity.value.split(' ');
      var wordsWidgets = <WrapEntity>[];
      for (var word in words) {
        wordsWidgets.add(
          Word()
            ..value = word
            ..styleId = wrapEntity.styleId,
        );
      }

      text.removeAt(i);
      text.insertAll(i, wordsWidgets);

      c.updateFragment();
      c.fragment.update((val) {});
    }
  }
}

PopupMenuItem<Menu> myPopupItem(Menu value,
    {required Widget text, required Widget icon}) {
  return PopupMenuItem<Menu>(
    value: value,
    child: Row(
      children: [
        icon,
        SizedBox(width: 5.w),
        text,
      ],
    ),
  );
}
