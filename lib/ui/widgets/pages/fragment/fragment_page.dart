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

enum SampleItem { addSpace, itemTwo, itemThree }

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
                                onTap: () {
                                  wrapEntity.style = c.currentStyle.value;
                                  mainPageController.updateDataBaseFragments();
                                  c.fragment.update((val) {});
                                },
                                fontSize: c.fontSize.value,
                              ));
                            } else if (wrapEntity is VerseIndex) {
                              result.add(VerseIndexWidget(wrapEntity));
                            } else if (wrapEntity is Space) {
                              bool visabillityMenu = false;
                              result.add(
                                PopupMenuButton<SampleItem>(
                                  iconSize: c.fontSize.value,
                                  initialValue: null,
                                  tooltip: 'Параметры',
                                  onSelected: (SampleItem item) {
                                    if (item == SampleItem.addSpace) {
                                      c.fragment.update((val) {
                                        val?.text[i] = LineBreak();
                                      });
                                      mainPageController
                                          .updateDataBaseFragments();
                                    }
                                  },
                                  itemBuilder: (BuildContext context) =>
                                      <PopupMenuEntry<SampleItem>>[
                                    const PopupMenuItem<SampleItem>(
                                      value: SampleItem.addSpace,
                                      child: Text('Добавить перенос'),
                                    ),
                                    const PopupMenuItem<SampleItem>(
                                      value: SampleItem.itemTwo,
                                      child: Text('Item 2'),
                                    ),
                                    const PopupMenuItem<SampleItem>(
                                      value: SampleItem.itemThree,
                                      child: Text('Item 3'),
                                    ),
                                  ],
                                  child: Container(
                                    width: c.fontSize.value / 4,
                                    height: c.fontSize.value,
                                    color: Colors.transparent,
                                  ),
                                ),
                              );
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
