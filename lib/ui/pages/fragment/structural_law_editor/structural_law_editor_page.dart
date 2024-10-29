import 'dart:convert';

import 'package:bible_depth/helpers/strings.dart';
import 'package:bible_depth/models/structural_law.dart';
import 'package:bible_depth/ui/pages/fragment/controller.dart';
import 'package:bible_depth/ui/pages/fragment/widgets/structural_law_widget.dart';
import 'package:bible_depth/ui/pages/main/controller.dart';
import 'package:finger_painter/finger_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class StructuralLawEditorPage extends StatelessWidget {
  StructuralLawEditorPage({super.key});
  final FragmentPageController c = Get.find();
  final MainPageController mainPageController = Get.find();
  final TextEditingController descriptionController = TextEditingController();
  late PainterController painterController = PainterController()
    ..setStrokeColor(paintColor)
    ..setMinStrokeWidth(3)
    ..setMaxStrokeWidth(15)
    ..setBlurSigma(0.0)
    ..setPenType(PenType.paintbrush2)
    ..setBlendMode(ui.BlendMode.srcOver);
  Color paintColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    descriptionController.text =
        (c.currentTool.value as StructuralLaw).description;
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StructuralLawWidget(
              (c.currentTool.value as StructuralLaw).id,
              size: 64.sp,
            ),
            TextField(
              controller: descriptionController,
              onChanged: (String value) {
                (c.currentTool.value as StructuralLaw).description = value;

                update();
              },
            ),
            Painter(
              controller: painterController,
              backgroundColor: Colors.black.withAlpha(30),
              onDrawingEnded: (bytes) async {
                if (bytes != null) {
                  String base64Data = base64Encode(bytes);
                  (c.currentTool.value as StructuralLaw).image = base64Data;
                  (c.currentTool.value as StructuralLaw).isAssetsSource = false;

                  update();
                }
              },
              size: Size(64.sp, 64.sp),
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
                  if (isGuid((c.currentTool.value as StructuralLaw).id)) {
                    (c.currentTool.value as StructuralLaw)
                        .copyProps(StructuralLaw());
                  } else {
                    (c.currentTool.value as StructuralLaw)
                        .copyProps(StructuralLaw.defaultSet.lastWhere(
                      (element) =>
                          element.id ==
                          (c.currentTool.value as StructuralLaw).id,
                    ));
                  }

                  update();
                },
                icon: const Icon(Icons.clear)),
            SizedBox(width: 25.w),
          ],
        );
      }),
    );
  }

  void update() {
    c.updateFragment();
    c.fragment.update((val) {});
    c.currentTool.update((val) {});
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
          height: 38.sp,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: colors.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return InkWell(
                onTap: () => onTap(colors[index]),
                child: Container(
                  margin: EdgeInsets.all(4.sp),
                  width: 30.sp,
                  height: 30.sp,
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
