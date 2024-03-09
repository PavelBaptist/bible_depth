import 'package:bible_depth/data/bible/bible.dart';
import 'package:bible_depth/data/bible/rst.dart';
import 'package:bible_depth/helpers/dialogs.dart';
import 'package:bible_depth/helpers/lists.dart';
import 'package:bible_depth/models/structural_law.dart';
import 'package:bible_depth/models/word_style.dart';
import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/controller.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/widgets/block_widget.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/widgets/header_widget.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/widgets/results_widget.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/widgets/structural_law_widget.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/widgets/tool_structural_law_widget.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/widgets/tool_word_style_widget.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/widgets/verse_index_widget.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/widgets/word_widget.dart';
import 'package:bible_depth/ui/widgets/pages/main/controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    descriptionController.text = c.fragment.value.description ?? '';
    nameController.text = c.fragment.value.name;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => c.fontSize.value--,
            icon: const Icon(Icons.zoom_out),
          ),
          const SizedBox(width: 5),
          IconButton(
            onPressed: () => c.fontSize.value++,
            icon: const Icon(Icons.zoom_in),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: nameController,
                        onChanged: (value) {
                          c.fragment.value.name = value;
                          mainPageController.updateDataBaseFragments();
                        },
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: () async {
                          Book book = (await Rst.instance)
                              .books[c.fragment.value.bookId! - 1];
                          Verse firstVerse = await c.getFirstVerseEntity();
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

                            var verse = book
                                .chapters[chapterId - 1].verses[verseId - 1];
                            c.contextBefore.insert(0, verse);
                          }
                          c.fragment.update((val) {});
                        },
                        child: const Center(
                          child: Text(
                            'Посмотреть контекст (+ 10 стихов)',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      Obx(() => c.contextBefore.isEmpty
                          ? const SizedBox()
                          : Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: BlockWidget(
                                header: 'Контекст',
                                color: Colors.green.shade50,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: () {
                                    List<Widget> widgets = [];

                                    for (var i = 0;
                                        i < c.contextBefore.length;
                                        i++) {
                                      widgets.add(
                                        Text(
                                          '${c.contextBefore[i].chapterId}:${c.contextBefore[i].id} ${c.contextBefore[i].text}',
                                          style: TextStyle(
                                            fontSize: c.fontSize.value,
                                          ),
                                        ),
                                      );
                                    }

                                    return widgets;
                                  }(),
                                ),
                              ),
                            )),
                      const SizedBox(height: 16),
                      Obx(
                        () {
                          return Wrap(
                            spacing: 0,
                            runSpacing: c.fontSize.value,
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
                                        mainPageController
                                            .updateDataBaseFragments();
                                        Get.toNamed('/fragment/header_editor',
                                            arguments: {'header': newHeader});
                                      } else if (value == Menu.addHeaderAfter) {
                                        Header newHeader = Header();

                                        c.fragment.update((val) {
                                          val?.text.insert(i + 1, newHeader);
                                        });
                                        mainPageController
                                            .updateDataBaseFragments();
                                        Get.toNamed('/fragment/header_editor',
                                            arguments: {'header': newHeader});
                                      } else if (value ==
                                          Menu.addLineBreakBefore) {
                                        c.fragment.update((val) {
                                          val?.text.insert(i, LineBreak());
                                        });
                                        mainPageController
                                            .updateDataBaseFragments();
                                      } else if (value ==
                                          Menu.addLineBreakAfter) {
                                        c.fragment.update((val) {
                                          val?.text.insert(i + 1, LineBreak());
                                        });
                                        mainPageController
                                            .updateDataBaseFragments();
                                      } else if (value ==
                                          Menu.deleteSpaceBefore) {
                                        if (c.fragment.value.text[i - 1]
                                            is LineBreak) {
                                          c.fragment.update((val) {
                                            val?.text.removeAt(i - 1);
                                          });
                                          mainPageController
                                              .updateDataBaseFragments();
                                        }
                                      } else if (value ==
                                          Menu.deleteSpaceAfter) {
                                        if (c.fragment.value.text[i + 1]
                                            is LineBreak) {
                                          c.fragment.update((val) {
                                            val?.text.removeAt(i + 1);
                                          });
                                          mainPageController
                                              .updateDataBaseFragments();
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
                                        mainPageController
                                            .updateDataBaseFragments();
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
                                        mainPageController
                                            .updateDataBaseFragments();
                                      } else if (value ==
                                          Menu.clearStructuralLaw) {
                                        if (wrapEntity is Word) {
                                          wrapEntity.structuralLawId = '';
                                          mainPageController
                                              .updateDataBaseFragments();
                                          c.fragment.update((val) {});
                                        }
                                      } else if (value ==
                                          Menu.copyStructuralLaw) {
                                        if (wrapEntity is Word) {
                                          c.currentTool.value =
                                              mainPageController
                                                  .structuralLawList?.value
                                                  .getWordStyleById(wrapEntity
                                                      .structuralLawId);
                                        } else if (wrapEntity
                                            is StructuralLawPlace) {
                                          c.currentTool.value =
                                              mainPageController
                                                  .structuralLawList?.value
                                                  .getWordStyleById(wrapEntity
                                                      .structuralLawId);
                                        }
                                      } else if (value == Menu.copyStyle) {
                                        if (wrapEntity is Word) {
                                          c.currentTool.value =
                                              mainPageController
                                                  .wordStyleList?.value
                                                  .getWordStyleById(
                                                      wrapEntity.styleId);
                                        } else if (wrapEntity
                                            is StructuralLawPlace) {
                                          c.currentTool.value =
                                              mainPageController
                                                  .structuralLawList?.value
                                                  .getWordStyleById(wrapEntity
                                                      .structuralLawId);
                                        }
                                      } else if (value == Menu.clearStyle) {
                                        if (wrapEntity is Word) {
                                          wrapEntity.styleId = '';
                                          mainPageController
                                              .updateDataBaseFragments();
                                          c.fragment.update((val) {});
                                        }
                                      } else if (value == Menu.splitWords) {
                                        if (wrapEntity is Word) {
                                          var words =
                                              wrapEntity.value.split(' ');
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

                                          mainPageController
                                              .updateDataBaseFragments();
                                          c.fragment.update((val) {});
                                        }
                                      } else if (value == Menu.delete) {
                                        if (wrapEntity is! Word &&
                                            wrapEntity is! VerseIndex) {
                                          c.fragment.update((val) {
                                            val?.text.removeAt(i);
                                          });
                                          mainPageController
                                              .updateDataBaseFragments();
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
                                                c.fragment.update((val) {});
                                              },
                                            );
                                          }
                                        }
                                      }
                                      mainPageController
                                          .updateDataBaseFragments();
                                      c.fragment.update((val) {});
                                    },
                                    onLongPress: onLongPress,
                                    fontSize: c.fontSize.value,
                                  ));
                                } else if (wrapEntity is VerseIndex) {
                                  result.add(VerseIndexWidget(
                                    wrapEntity,
                                    onLongPress: onLongPress,
                                  ));
                                } else if (wrapEntity is LineBreak) {
                                  result.add(Row());
                                } else if (wrapEntity is Header) {
                                  result.add(HeaderWidget(
                                    wrapEntity,
                                    onLongPress: onLongPress,
                                    fontSize: c.fontSize.value,
                                  ));
                                } else if (wrapEntity is StructuralLawPlace) {
                                  result.add(StructuralLawWidget(
                                    wrapEntity.structuralLawId,
                                    size: c.fontSize.value,
                                    onTap: () {
                                      if (c.currentTool.value
                                          is StructuralLaw) {
                                        c.fragment.update((val) {
                                          (val!.text[i] as StructuralLawPlace)
                                              .structuralLawId = (c.currentTool
                                                  .value as StructuralLaw)
                                              .id;
                                        });
                                      }
                                    },
                                    onLongPress: onLongPress,
                                  ));
                                }
                              }

                              return result;
                            }(),
                          );
                        },
                      ),
                      Obx(
                        () => c.contextAfter.isEmpty
                            ? const SizedBox()
                            : Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: BlockWidget(
                                  header: 'Контекст',
                                  color: Colors.green.shade50,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: () {
                                      List<Widget> widgets = [];

                                      for (var i = 0;
                                          i < c.contextAfter.length;
                                          i++) {
                                        widgets.add(
                                          Text(
                                            '${c.contextAfter[i].chapterId}:${c.contextAfter[i].id} ${c.contextAfter[i].text}',
                                            style: TextStyle(
                                              fontSize: c.fontSize.value,
                                            ),
                                          ),
                                        );
                                      }

                                      return widgets;
                                    }(),
                                  ),
                                ),
                              ),
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: () async {
                          Book book = (await Rst.instance)
                              .books[c.fragment.value.bookId! - 1];
                          Verse lastVerse = await c.getLastVerseEntity();
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
                            if (verseId ==
                                book.chapters[chapterId - 1].verses.length) {
                              chapterId++;
                              verseId = 1;
                            }

                            var verse = book
                                .chapters[chapterId - 1].verses[verseId - 1];
                            c.contextAfter.add(verse);
                          }
                          c.fragment.update((val) {});
                        },
                        child: const Center(
                          child: Text(
                            'Посмотреть контекст (+ 10 стихов)',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 16),
                      BlockWidget(
                        header: 'Автоматические итоги',
                        color: Colors.blue.shade50,
                        child: ResultsWidget(),
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 16),
                      BlockWidget(
                        header: 'Заметки',
                        child: TextField(
                          controller: descriptionController,
                          maxLines: null,
                          onChanged: (value) {
                            c.fragment.value.description =
                                descriptionController.text;
                            mainPageController.updateDataBaseFragments();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 180.0,
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
                  Row(
                    children: [
                      const SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () {
                          mainPageController.wordStyleList!.value.list
                              .insert(0, WordStyle());
                          mainPageController.updateDataBaseWordStyles();
                          mainPageController.wordStyleList?.update((val) {});
                        },
                        child: const Icon(Icons.add),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: Obx(() => ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: mainPageController
                                    .wordStyleList!.value.list.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: ToolWordStyleWidget(
                                      wordStyle: mainPageController
                                          .wordStyleList!.value.list[index],
                                    ),
                                  );
                                },
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () {
                          mainPageController.structuralLawList!.value.list
                              .insert(0, StructuralLaw());
                          mainPageController.updateDataBaseStructuralLaws();
                          mainPageController.structuralLawList
                              ?.update((val) {});
                        },
                        child: const Icon(Icons.add),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: Obx(() => ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: mainPageController
                                    .structuralLawList!.value.list.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: ToolStructuralLawWidget(
                                      structuralLaw: mainPageController
                                          .structuralLawList!.value.list[index],
                                    ),
                                  );
                                },
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text('*для изменения стиля или значка удерживайте на нем'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

PopupMenuItem<Menu> myPopupItem(Menu value,
    {required Widget text, required Widget icon}) {
  return PopupMenuItem<Menu>(
    value: value,
    child: Row(
      children: [
        icon,
        const SizedBox(width: 5),
        text,
      ],
    ),
  );
}
