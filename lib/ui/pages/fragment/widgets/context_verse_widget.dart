import 'package:bible_depth/data/bible/bible.dart';
import 'package:bible_depth/helpers/dialogs.dart';
import 'package:bible_depth/ui/pages/fragment/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContextVerseWidget extends StatelessWidget {
  Verse verse;
  final FragmentPageController c = Get.find();

  ContextVerseWidget(this.verse, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          iconSize: c.fontSize.value.sp,
          onPressed: () {
            showConfirmationDialog(context,
                onTapYes: () => c.addContext(verse.chapterId, verse.id),
                text: 'По ${verse.chapterId} глава ${verse.id} стих',
                titleText: 'Дополнить контекст?');
          },
          icon: const Icon(
            Icons.subdirectory_arrow_left,
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            verse.id == 1
                ? '\nГлава ${verse.chapterId}\n${verse.id} ${verse.text}'
                : '${verse.id} ${verse.text}',
            style: TextStyle(
              fontSize: c.fontSize.value.sp,
            ),
          ),
        ),
      ],
    );
  }
}
