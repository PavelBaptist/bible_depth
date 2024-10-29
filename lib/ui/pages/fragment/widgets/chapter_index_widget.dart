import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/pages/fragment/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChapterIndexWidget extends StatelessWidget {
  final ChapterIndex chapterIndex;
  final FragmentPageController c = Get.find();
  void Function(BuildContext context)? onLongPress;

  ChapterIndexWidget(
    this.chapterIndex, {
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
          child: Row(
            children: [
              Text(
                'Глава ${chapterIndex.value}',
                style: TextStyle(
                  fontSize: c.fontSize.value.sp * 1.2,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
