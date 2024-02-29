import 'package:bible_depth/helpers/numbers.dart';
import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WordWidget extends StatelessWidget {
  final Word word;
  final FragmentPageController c = Get.find();

  WordWidget(this.word, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        c.applyStyleForWord(word);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          color: word.highlightColor,
          borderRadius: BorderRadius.circular(c.fontSize.value / 3),
        ),
        child: Text(
          word.value,
          style: TextStyle(
            color: word.fontColor,
            fontSize: c.fontSize.value,
          ),
        ),
      ),
    );
  }
}
