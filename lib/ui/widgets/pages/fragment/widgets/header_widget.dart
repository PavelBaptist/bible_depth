import 'package:bible_depth/models/wrap_entity.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final Header header;
  final double fontSize;
  final bool usePadding;
  void Function(BuildContext ocntext)? onLongPress;
  HeaderWidget(
    this.header, {
    super.key,
    this.fontSize = 14,
    this.onLongPress,
    this.usePadding = true,
  });

  @override
  Widget build(BuildContext context) {
    double textSize;
    switch (header.level) {
      case 1:
        textSize = fontSize * 1.6;
        break;
      case 2:
        textSize = fontSize * 1.4;
        break;
      case 3:
        textSize = fontSize * 1.2;
        break;
      case 4:
        textSize = fontSize;
        break;
      case 5:
        textSize = fontSize * 0.8;
        break;
      case 6:
        textSize = fontSize * 0.6;
        break;
      default:
        textSize = fontSize;
    }
    return GestureDetector(
      onLongPress: () {
        if (onLongPress != null) {
          onLongPress!(context);
        }
      },
      child: Padding(
        padding: usePadding
            ? EdgeInsets.only(top: textSize)
            : const EdgeInsets.all(0),
        child: Row(
          children: [
            Text(
              header.value == '' ? 'Новый заголовок' : header.value,
              style: TextStyle(
                fontSize: textSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
