import 'package:bible_depth/helpers/numbers.dart';
import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/pages/fragment/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerseIndexWidget extends StatelessWidget {
  final VerseIndex verseIndex;
  final FragmentPageController c = Get.find();
  void Function(BuildContext context)? onLongPress;

  VerseIndexWidget(
    this.verseIndex, {
    super.key,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onLongPress: () {
            if (onLongPress != null) {
              onLongPress!(context);
            }
          },
          child: Text(
            verseIndex.value.split(':')[1],
            style: TextStyle(
                fontSize: c.fontSize.value, color: Colors.grey.shade400),
          ),
        ),
      ],
    );
  }
}
