import 'package:bible_depth/helpers/numbers.dart';
import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerseIndexWidget extends StatelessWidget {
  final VerseIndex verseIndex;
  final FragmentPageController c = Get.find();

  VerseIndexWidget(this.verseIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          verseIndex.value,
          style: TextStyle(
            fontSize: c.fontSize.value / 1.5,
          ),
        ),
      ],
    );
  }
}
