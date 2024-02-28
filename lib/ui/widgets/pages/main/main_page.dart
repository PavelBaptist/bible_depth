import 'package:bible_depth/helpers/numbers.dart';
import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/widgets/pages/main/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invert_colors/invert_colors.dart';

enum SampleItem { addSpace, itemTwo, itemThree }

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final c = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Obx(() => Text(c.fragment.value.name))),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
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
                              result.add(GestureDetector(
                                onTap: () {
                                  c.applyStyleForWord(wrapEntity);
                                },
                                child: isNumeric(wrapEntity.value)
                                    ? Column(
                                        children: [
                                          Text(
                                            wrapEntity.value,
                                            style: TextStyle(
                                              backgroundColor:
                                                  wrapEntity.highlightColor,
                                              color: wrapEntity.fontColor,
                                              fontSize: c.fontSize.value / 1.5,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Text(
                                        wrapEntity.value,
                                        style: TextStyle(
                                          backgroundColor:
                                              wrapEntity.highlightColor,
                                          color: wrapEntity.fontColor,
                                          fontSize: c.fontSize.value,
                                        ),
                                      ),
                              ));
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
              ],
            ),
          ),
          Container(
            color: Colors.blue[100],
            width: double.infinity,
            height: 150.0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FontColorButtonWidget(color: Colors.black),
                      FontColorButtonWidget(color: Colors.white),
                      FontColorButtonWidget(color: Colors.green),
                      FontColorButtonWidget(color: Colors.red),
                      FontColorButtonWidget(color: Colors.yellow),
                      FontColorButtonWidget(color: Colors.blue),
                      FontColorButtonWidget(color: Colors.purple),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HightlightButtonWidget(color: Colors.black),
                      HightlightButtonWidget(color: Colors.white),
                      HightlightButtonWidget(color: Colors.green),
                      HightlightButtonWidget(color: Colors.red),
                      HightlightButtonWidget(color: Colors.yellow),
                      HightlightButtonWidget(color: Colors.blue),
                      HightlightButtonWidget(color: Colors.purple),
                    ],
                  ),
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

class HightlightButtonWidget extends StatelessWidget {
  Color color;
  HightlightButtonWidget({super.key, required this.color});

  final MainPageController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        c.currentHighlightColor.value = color;
      },
      child: Obx(
        () => Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: color,
            border: color == c.currentHighlightColor.value
                ? Border.all(color: Colors.black, width: 2)
                : null,
          ),
        ),
      ),
    );
  }
}

class FontColorButtonWidget extends StatelessWidget {
  Color color;
  FontColorButtonWidget({super.key, required this.color});

  final MainPageController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        c.currentFontColor.value = color;
      },
      child: Obx(
        () => Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            border: color == c.currentFontColor.value
                ? Border.all(color: Colors.black, width: 2)
                : null,
          ),
          child: Center(
            child: Text(
              'A',
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
