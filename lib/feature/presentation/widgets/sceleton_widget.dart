import 'package:flutter/material.dart';

class SceletonWidget extends StatelessWidget {
  double width;
  double height;
  Color? color;

  SceletonWidget(this.width, this.height, {super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color ?? Colors.black.withAlpha(30),
    );
  }
}
