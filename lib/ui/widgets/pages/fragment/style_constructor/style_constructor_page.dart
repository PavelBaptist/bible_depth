import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/controller.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/widgets/word_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class StyleConstructorPage extends StatelessWidget {
  StyleConstructorPage({super.key});
  final FragmentPageController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WordWidget(
              Word()
                ..value = 'образец'
                ..style = c.currentStyle.value,
              fontSize: 50,
            ),
            ColorPicker(
              label: 'Цвет текста',
              onTap: (color) {
                c.currentStyle.value?.fontColor = color;
                c.currentStyle.update((val) {});
              },
            ),
            ColorPicker(
              label: 'Цвет фона',
              onTap: (color) {
                c.currentStyle.value?.highlightColor = color;
                c.currentStyle.update((val) {});
              },
            ),
            ColorPicker(
              label: 'Цвет обводки',
              onTap: (color) {
                c.currentStyle.value?.borderColor = color;
                c.currentStyle.update((val) {});
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
  void Function(Color) onTap;
  ColorPicker({super.key, required this.label, required this.onTap});

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
                    border: Border.all(color: Colors.black),
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
