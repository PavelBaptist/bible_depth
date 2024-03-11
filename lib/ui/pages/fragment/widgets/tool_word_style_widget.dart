import 'package:bible_depth/models/word_style.dart';
import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/pages/fragment/controller.dart';
import 'package:bible_depth/ui/pages/fragment/widgets/word_widget.dart';
import 'package:bible_depth/ui/pages/main/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToolWordStyleWidget extends StatelessWidget {
  WordStyle wordStyle;
  ToolWordStyleWidget({super.key, required this.wordStyle});

  final FragmentPageController c = Get.find();
  final MainPageController mainPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    final Word word = Word();
    word.value = ' А ';
    word.styleId = wordStyle.id;
    return Obx(
      () => Container(
        decoration: wordStyle == c.currentTool.value
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
        child: WordWidget(
          word,
          fontSize: 25,
          onTap: () {
            c.currentTool.value = wordStyle;
            c.currentTool.update((val) {});
            if (wordStyle.description.isNotEmpty) {
              Get.snackbar('Описание', wordStyle.description);
            }
          },
          onLongPress: (context) {
            c.currentTool.value = wordStyle;
            c.currentTool.update((val) {});
            Get.toNamed('/fragment/word_style_editor');
          },
        ),
      ),
    );
  }
}
