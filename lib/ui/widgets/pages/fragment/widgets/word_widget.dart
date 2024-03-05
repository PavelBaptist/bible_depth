import 'dart:convert';
import 'dart:typed_data';

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
    Uint8List? imageBytes;
    if (word.style?.image != null) {
      imageBytes = base64Decode(word.style!.image!);
    }

    double? widthImage;
    double? heightImage;

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          color: word.style?.highlightColor,
          borderRadius: BorderRadius.circular(
              word.style?.borderIsCircle == true ? 1000 : fontSize / 5),
          border: word.style?.borderColor != null
              ? Border.all(
                  color: word.style!.borderColor!,
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
                color: word.style?.fontColor,
                fontSize: fontSize,
                fontStyle: word.style?.isItalic == true
                    ? FontStyle.italic
                    : FontStyle.normal,
                fontWeight: word.style?.isBold == true
                    ? FontWeight.bold
                    : FontWeight.normal,
              );

              // вычисляем размер текста для image
              if (word.style?.stretchImage == true) {
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
              )
          ],
        ),
      ),
    );
  }
}
