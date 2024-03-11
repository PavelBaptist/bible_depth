import 'package:bible_depth/models/structural_law.dart';
import 'package:bible_depth/ui/pages/fragment/controller.dart';
import 'package:bible_depth/ui/pages/fragment/widgets/structural_law_widget.dart';

import 'package:bible_depth/ui/pages/main/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToolStructuralLawWidget extends StatelessWidget {
  StructuralLaw structuralLaw;
  ToolStructuralLawWidget({super.key, required this.structuralLaw});

  final FragmentPageController c = Get.find();
  final MainPageController mainPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: c.currentTool.value == structuralLaw
            ? BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withAlpha(90),
                      blurRadius: 12,
                      spreadRadius: 1,
                      offset: const Offset(0, 5)),
                ],
                borderRadius: BorderRadius.circular(6),
              )
            : null,
        child: StructuralLawWidget(
          structuralLaw.id,
          size: 25,
          onTap: () {
            c.currentTool.value = structuralLaw;
            c.currentTool.update((val) {});
            if (structuralLaw.description.isNotEmpty) {
              Get.snackbar('Описание', structuralLaw.description);
            }
          },
          onLongPress: (context) {
            c.currentTool.value = structuralLaw;
            c.currentTool.update((val) {});
            Get.toNamed('/fragment/structural_law_editor');
          },
        ),
      ),
    );
  }
}
