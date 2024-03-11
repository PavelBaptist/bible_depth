import 'dart:convert';
import 'dart:typed_data';

import 'package:bible_depth/models/structural_law.dart';
import 'package:bible_depth/models/structural_law_list.dart';
import 'package:bible_depth/ui/pages/main/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StructuralLawWidget extends StatelessWidget {
  late StructuralLaw _structuralLaw;
  final double size;
  final void Function()? onTap;
  final void Function(BuildContext context)? onLongPress;

  StructuralLawWidget(
    String structuralLawId, {
    super.key,
    this.onTap,
    this.onLongPress,
    this.size = 14,
  }) {
    MainPageController mpc = Get.find<MainPageController>();

    StructuralLawList sll = mpc.structuralLawList!.value;
    _structuralLaw = sll.getWordStyleById(structuralLawId) ?? StructuralLaw();
  }

  @override
  Widget build(BuildContext context) {
    Widget image;
    if (_structuralLaw.isAssetsSource) {
      image = Image.asset(
        'assets/icons/structural_law_icons/${_structuralLaw.image}',
      );
    } else {
      Uint8List imageBytes = base64Decode(_structuralLaw.image);
      image = Image.memory(imageBytes);
    }

    return GestureDetector(
      onTap: onTap,
      onLongPress: () {
        if (onLongPress != null) {
          onLongPress!(context);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: SizedBox(
          width: size,
          height: size,
          child: image,
        ),
      ),
    );
  }
}
