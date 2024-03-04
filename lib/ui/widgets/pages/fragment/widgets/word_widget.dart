import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/widgets/pages/main/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WordWidget extends StatelessWidget {
  final Word word;
  final double fontSize;
  final MainPageController mainPageController = Get.find();
  final void Function()? onTap;
  final void Function()? onLongPress;

  WordWidget(this.word,
      {super.key, this.onTap, this.onLongPress, this.fontSize = 14});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          color: word.style?.highlightColor,
          borderRadius: BorderRadius.circular(fontSize / 3),
          border: word.style?.borderColor != null
              ? Border.all(
                  color: word.style!.borderColor!,
                  width: fontSize / 9,
                )
              : null,
        ),
        child: Text(
          word.value,
          style: TextStyle(
            color: word.style?.fontColor,
            fontSize: fontSize,
            fontWeight: word.style?.isBold == true
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
