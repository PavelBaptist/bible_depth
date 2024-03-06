import 'dart:convert';

import 'package:bible_depth/models/word_style.dart';
import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/controller.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/widgets/word_widget.dart';
import 'package:bible_depth/ui/widgets/pages/main/controller.dart';
import 'package:finger_painter/finger_painter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class StyleConstructorPage extends StatelessWidget {
  StyleConstructorPage({super.key});
  final FragmentPageController c = Get.find();
  final MainPageController mainPageController = Get.find();
  TextEditingController descriptionController = TextEditingController();
  late PainterController painterController = PainterController()
    ..setStrokeColor(paintColor)
    ..setMinStrokeWidth(3)
    ..setMaxStrokeWidth(15)
    ..setBlurSigma(0.0)
    ..setPenType(PenType.paintbrush2)
    ..setBlendMode(ui.BlendMode.srcOver);
  Color paintColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    descriptionController.text =
        (c.currentTool.value as WordStyle).description ?? '';
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WordWidget(
              Word()
                ..value = 'образец'
                ..styleId = (c.currentTool.value as WordStyle).id,
              fontSize: 50,
            ),
            TextField(
              controller: descriptionController,
              onChanged: (String value) {
                (c.currentTool.value as WordStyle).description = value;
                mainPageController.updateDataBaseWordStyles();
              },
            ),
            Row(
              children: [
                Text('Жирный'),
                Checkbox(
                  value: (c.currentTool.value as WordStyle).isBold,
                  onChanged: (value) {
                    (c.currentTool.value as WordStyle).isBold = value;
                    c.currentTool.update((val) {});
                    mainPageController.updateDataBaseWordStyles();
                  },
                ),
                const SizedBox(width: 25),
                Text('Наклоненный'),
                Checkbox(
                  value: (c.currentTool.value as WordStyle).isItalic,
                  onChanged: (value) {
                    (c.currentTool.value as WordStyle).isItalic = value;
                    c.currentTool.update((val) {});
                    mainPageController.updateDataBaseWordStyles();
                  },
                ),
                const SizedBox(width: 25),
                Text('Обводка кругом'),
                Checkbox(
                  value: (c.currentTool.value as WordStyle).borderIsCircle,
                  onChanged: (value) {
                    (c.currentTool.value as WordStyle).borderIsCircle =
                        value ?? false;
                    c.currentTool.update((val) {});
                    mainPageController.updateDataBaseWordStyles();
                  },
                ),
              ],
            ),
            ColorPicker(
              label: 'Цвет текста',
              onTap: (color) {
                (c.currentTool.value as WordStyle).fontColor = color;
                c.currentTool.update((val) {});
                mainPageController.updateDataBaseWordStyles();
              },
              selectedLogic: (color) =>
                  (c.currentTool.value as WordStyle).fontColor == color,
            ),
            ColorPicker(
              label: 'Цвет фона',
              onTap: (color) {
                (c.currentTool.value as WordStyle).highlightColor = color;
                c.currentTool.update((val) {});
                mainPageController.updateDataBaseWordStyles();
              },
              selectedLogic: (color) =>
                  (c.currentTool.value as WordStyle).highlightColor == color,
            ),
            ColorPicker(
              label: 'Цвет обводки',
              onTap: (color) {
                (c.currentTool.value as WordStyle).borderColor = color;
                c.currentTool.update((val) {});
                mainPageController.updateDataBaseWordStyles();
              },
              selectedLogic: (color) =>
                  (c.currentTool.value as WordStyle).borderColor == color,
            ),
            Painter(
              controller: painterController,
              backgroundColor: Colors.black.withAlpha(30),
              onDrawingEnded: (bytes) async {
                if (bytes != null) {
                  String base64Data = base64Encode(bytes);
                  (c.currentTool.value as WordStyle).image = base64Data;
                  c.currentTool.update((val) {});
                  mainPageController.updateDataBaseWordStyles();
                }
              },
              size: const Size(230, 80),
              // child: Image.asset('assets/map.png', fit: BoxFit.cover),
            ),
            ColorPicker(
              label: 'Цвет чернил',
              onTap: (color) {
                painterController.setStrokeColor(color);
                paintColor = color;
              },
              selectedLogic: (color) => paintColor == color,
            ),
            IconButton(
                onPressed: () {
                  painterController.clearContent();
                  (c.currentTool.value as WordStyle).image = null;
                  mainPageController.updateDataBaseWordStyles();
                },
                icon: const Icon(Icons.clear)),
            const SizedBox(width: 25),
            Text('Растягивать картинку'),
            Checkbox(
              value: (c.currentTool.value as WordStyle).stretchImage,
              onChanged: (value) {
                (c.currentTool.value as WordStyle).stretchImage =
                    value ?? false;
                c.currentTool.update((val) {});
                mainPageController.updateDataBaseWordStyles();
              },
            ),
          ],
        );
      }),
    );
  }
}

class ColorPicker extends StatelessWidget {
  final List<Color> colors = [
    Colors.transparent,
    Colors.black,
    Colors.grey.shade500,
    Colors.white,
    Colors.red.shade900,
    Colors.red.shade500,
    Colors.red.shade200,
    Colors.orange.shade900,
    Colors.orange.shade500,
    Colors.orange.shade200,
    Colors.green.shade900,
    Colors.green.shade500,
    Colors.green.shade200,
    Colors.blue.shade900,
    Colors.blue.shade500,
    Colors.blue.shade200,
    Colors.deepPurple.shade900,
    Colors.deepPurple.shade500,
    Colors.deepPurple.shade200,
    Colors.yellow.shade900,
    Colors.yellow.shade500,
    Colors.yellow.shade200,
  ];

  String label;
  void Function(Color color) onTap;
  bool Function(Color color) selectedLogic;
  ColorPicker({
    super.key,
    required this.label,
    required this.onTap,
    required this.selectedLogic,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label),
        SizedBox(
          height: 38,
          //width: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: colors.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return InkWell(
                onTap: () => onTap(colors[index]),
                child: Container(
                  margin: const EdgeInsets.all(4),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: colors[index],
                    border: Border.all(
                      color: Colors.black,
                      width: selectedLogic(colors[index]) ? 3 : 1,
                    ),
                  ),
                  child: colors[index] == Colors.transparent
                      ? const Center(child: Text('П'))
                      : null,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
