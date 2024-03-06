import 'dart:convert';
import 'dart:typed_data';

import 'package:bible_depth/models/structural_law.dart';
import 'package:bible_depth/models/structural_law_list.dart';
import 'package:bible_depth/models/word_style.dart';
import 'package:bible_depth/models/word_style_list.dart';
import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/widgets/structural_law_widget.dart';
import 'package:bible_depth/ui/widgets/pages/main/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WordWidget extends StatelessWidget {
  final Word word;
  final double fontSize;
  final void Function()? onTap;
  final void Function(BuildContext context)? onLongPress;
  WordStyle? style;
  StructuralLaw? structuralLaw;

  WordWidget(
    this.word, {
    super.key,
    this.onTap,
    this.onLongPress,
    this.fontSize = 14,
  }) {
    MainPageController mpc = Get.find<MainPageController>();

    WordStyleList wsl = mpc.wordStyleList!.value;
    style = wsl.getWordStyleById(word.styleId);

    StructuralLawList sll = mpc.structuralLawList!.value;
    structuralLaw = sll.getWordStyleById(word.structuralLawId);
  }

  @override
  Widget build(BuildContext context) {
    Uint8List? imageBytes;
    if (style?.image != null) {
      imageBytes = base64Decode(style!.image!);
    }

    double? widthImage;
    double? heightImage;

    return GestureDetector(
      onTap: onTap,
      onLongPress: () {
        if (onLongPress != null) {
          onLongPress!(context);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          color: style?.highlightColor,
          borderRadius: BorderRadius.circular(
              style?.borderIsCircle == true ? 1000 : fontSize / 5),
          border: style?.borderColor != null
              ? Border.all(
                  color: style!.borderColor!,
                  width: fontSize / 9,
                )
              : null,
        ),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            () {
              var textStyle = TextStyle(
                color: style?.fontColor,
                fontSize: fontSize,
                fontStyle: style?.isItalic == true
                    ? FontStyle.italic
                    : FontStyle.normal,
                fontWeight:
                    style?.isBold == true ? FontWeight.bold : FontWeight.normal,
              );

              // вычисляем размер текста для image
              if (style?.stretchImage == true) {
                TextSpan textSpan = TextSpan(
                  text: word.value,
                  style: textStyle,
                );
                TextPainter textPainter = TextPainter(
                  text: textSpan,
                  textDirection: TextDirection.ltr,
                );
                textPainter.layout();

                widthImage = textPainter.width * 1.2;
                heightImage = textPainter.height / 1.2;
              }

              // возвращаем основной виджет текста
              return Text(
                word.value,
                style: textStyle,
              );
            }(),
            if (structuralLaw != null)
              Positioned(
                top: fontSize / 1.5 * -1,
                child: StructuralLawWidget(structuralLaw!.id, size: fontSize),
              ),
            if (imageBytes != null)
              Positioned(
                top: widthImage == null ? 0 : fontSize / 2.6,
                child: SizedBox(
                  width: widthImage,
                  height: heightImage,
                  child: Image.memory(
                    imageBytes,
                    width: widthImage == null ? fontSize * 4 : null,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
