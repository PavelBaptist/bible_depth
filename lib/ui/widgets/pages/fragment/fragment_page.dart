import 'package:bible_depth/helpers/dialogs.dart';
import 'package:bible_depth/models/structural_law.dart';
import 'package:bible_depth/models/word_style.dart';
import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/controller.dart';
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

enum Menu {
  edit,
  addSpaceBefore,
  addSpaceAfter,
  addHeaderBefore,
  addHeaderAfter,
  deleteSpaceBefore,
  deleteSpaceAfter,
  addStructuralLawBefore,
  addStructuralLawAfter,
  clearStructuralLaw,
  copyStructuralLaw,
  copyStyle,
  delete,
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

                            // ignore: prefer_function_declarations_over_variables
                            var onLongPress = (context) {
                              showPopupMenu(
                                context,
                                popupMenuList: <PopupMenuEntry<Menu>>[
                                  const PopupMenuItem<Menu>(
                                    value: Menu.edit,
                                    child: Text('Изменить'),
                                  ),
                                  const PopupMenuItem<Menu>(
                                    value: Menu.copyStyle,
                                    child: Text('Скопировать стиль'),
                                  ),
                                  const PopupMenuDivider(),
                                  const PopupMenuItem<Menu>(
                                    value: Menu.addStructuralLawBefore,
                                    child: Text('Структурный закон ДО'),
                                  ),
                                  const PopupMenuItem<Menu>(
                                    value: Menu.addStructuralLawAfter,
                                    child: Text('Структурный закон ПОСЛЕ'),
                                  ),
                                  const PopupMenuItem<Menu>(
                                    value: Menu.clearStructuralLaw,
                                    child: Text('Очистить структурный закон'),
                                  ),
                                  const PopupMenuItem<Menu>(
                                    value: Menu.copyStructuralLaw,
                                    child:
                                        Text('Скопировать структурный закон'),
                                  ),
                                  const PopupMenuDivider(),
                                  const PopupMenuItem<Menu>(
                                    value: Menu.addHeaderBefore,
                                    child: Text('Добавить заголовок ДО'),
                                  ),
                                  const PopupMenuItem<Menu>(
                                    value: Menu.addHeaderAfter,
                                    child: Text('Добавить заголовок ПОСЛЕ'),
                                  ),
                                  const PopupMenuDivider(),
                                  const PopupMenuItem<Menu>(
                                    value: Menu.addSpaceBefore,
                                    child: Text('Добавить перенос ДО'),
                                  ),
                                  const PopupMenuItem<Menu>(
                                    value: Menu.addSpaceAfter,
                                    child: Text('Добавить перенос ПОСЛЕ'),
                                  ),
                                  const PopupMenuItem<Menu>(
                                    value: Menu.deleteSpaceBefore,
                                    child: Text('Удалить перенос ДО'),
                                  ),
                                  const PopupMenuItem<Menu>(
                                    value: Menu.deleteSpaceAfter,
                                    child: Text('Удалить перенос ПОСЛЕ'),
                                  ),
                                  const PopupMenuDivider(),
                                  const PopupMenuItem<Menu>(
                                    value: Menu.splitWords,
                                    child: Text('Разделить слова'),
                                  ),
                                  const PopupMenuItem<Menu>(
                                    value: Menu.delete,
                                    child: Text('Удалить'),
                                  ),
                                ],
                                onValue: (value) {
                                  if (value == Menu.edit) {
                                    if (wrapEntity is Header) {
                                      Get.toNamed('/fragment/header_editor',
                                          arguments: {'header': wrapEntity});
                                    }
                                  } else if (value == Menu.addHeaderBefore) {
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
                                  } else if (value == Menu.addSpaceBefore) {
                                    c.fragment.update((val) {
                                      val?.text.insert(i, LineBreak());
                                    });
                                    mainPageController
                                        .updateDataBaseFragments();
                                  } else if (value == Menu.addSpaceAfter) {
                                    c.fragment.update((val) {
                                      val?.text.insert(i + 1, LineBreak());
                                    });
                                    mainPageController
                                        .updateDataBaseFragments();
                                  } else if (value == Menu.deleteSpaceBefore) {
                                    if (c.fragment.value.text[i - 1]
                                        is LineBreak) {
                                      c.fragment.update((val) {
                                        val?.text.removeAt(i - 1);
                                      });
                                      mainPageController
                                          .updateDataBaseFragments();
                                    }
                                  } else if (value == Menu.deleteSpaceAfter) {
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
                                            ..structuralLawId = (c.currentTool
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
                                            ..structuralLawId = (c.currentTool
                                                    .value as StructuralLaw)
                                                .id);
                                    });
                                    mainPageController
                                        .updateDataBaseFragments();
                                  } else if (value == Menu.clearStructuralLaw) {
                                    if (wrapEntity is Word) {
                                      wrapEntity.structuralLawId = '';
                                      c.fragment.update((val) {});
                                      mainPageController
                                          .updateDataBaseFragments();
                                    }
                                  } else if (value == Menu.copyStructuralLaw) {
                                    if (wrapEntity is Word) {
                                      c.currentTool.value = mainPageController
                                          .structuralLawList?.value
                                          .getWordStyleById(
                                              wrapEntity.structuralLawId);
                                    } else if (wrapEntity
                                        is StructuralLawPlace) {
                                      c.currentTool.value = mainPageController
                                          .structuralLawList?.value
                                          .getWordStyleById(
                                              wrapEntity.structuralLawId);
                                    }
                                  } else if (value == Menu.copyStyle) {
                                    if (wrapEntity is Word) {
                                      c.currentTool.value = mainPageController
                                          .wordStyleList?.value
                                          .getWordStyleById(wrapEntity.styleId);
                                    }
                                  } else if (value == Menu.splitWords) {
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

                                      mainPageController
                                          .updateDataBaseFragments();
                                      c.fragment.update((val) {});
                                    }
                                  } else if (value == Menu.delete) {
                                    c.fragment.update((val) {
                                      val?.text.removeAt(i);
                                    });
                                    mainPageController
                                        .updateDataBaseFragments();
                                  }
                                },
                              );
                            };
                            if (wrapEntity is Word) {
                              result.add(WordWidget(
                                wrapEntity,
                                onTap: () {
                                  if (c.currentTool.value is StructuralLaw) {
                                    wrapEntity.structuralLawId =
                                        (c.currentTool.value as StructuralLaw)
                                            .id;
                                  } else if (c.currentTool.value is WordStyle) {
                                    wrapEntity.styleId =
                                        (c.currentTool.value as WordStyle).id;
                                    int indexBefore = i < 1 ? i : i - 1;
                                    Word? wordBefore = text[indexBefore] is Word
                                        ? text[indexBefore] as Word
                                        : null;
                                    int indexAfter =
                                        i > text.length - 1 ? i : i + 1;
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
                                  mainPageController.updateDataBaseFragments();
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
                                  if (c.currentTool.value is StructuralLaw) {
                                    c.fragment.update((val) {
                                      (val!.text[i] as StructuralLawPlace)
                                              .structuralLawId =
                                          (c.currentTool.value as StructuralLaw)
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
                ),
                const Divider(),
                ResultsWidget(),
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
