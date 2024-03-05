import 'package:bible_depth/models/word_style.dart';
import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/controller.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/widgets/word_widget.dart';
import 'package:bible_depth/ui/widgets/pages/main/controller.dart';
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
    word.value = 'стиль';
    word.styleId = wordStyle.id;
    return Obx(
      () => Container(
        decoration: wordStyle == c.currentStyle.value
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
          wordStyleList: mainPageController.wordStyleList!.value,
          fontSize: 25,
          onTap: () {
            c.currentStyle.value = wordStyle;
            c.currentStyle.update((val) {});
            if (wordStyle.description.isNotEmpty) {
              Get.snackbar('Описание', wordStyle.description);
            }
          },
          onLongPress: (context) {
            c.currentStyle.value = wordStyle;
            c.currentStyle.update((val) {});
            Get.toNamed('/fragment/style_constructor');
          },
        ),
      ),
    );
  }
}
