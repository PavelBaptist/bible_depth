import 'package:bible_depth/ui/pages/new_fragment/controller.dart';
import 'package:bible_depth/ui/svg/svgs.dart';
import 'package:bible_depth/ui/widgets/my_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewFragmentPage extends StatelessWidget {
  NewFragmentPage({super.key});
  final c = Get.put(NewFragmentPageController());

  @override
  Widget build(BuildContext context) {
    ThemeData style = Theme.of(Get.context!);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const SvgIcon(SvgIcons.arrowLeft),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 7.w),
          child: const Text('ВЫБЕРИТЕ КНИГУ БИБЛИИ'),
        ),
      ),
      body: FutureBuilder(
        future: c.initBible(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              children: () {
                List<Widget> result = [];
                for (var element in c.bible!.value.books) {
                  result.add(
                    Column(
                      children: [
                        if (element.id == 1)
                          Padding(
                            padding: EdgeInsets.all(8.sp),
                            child: Text(
                              'В E T Х И Й    З А В Е Т',
                              style: style.textTheme.bodyMedium,
                            ),
                          ),
                        if (element.id == 40)
                          Padding(
                            padding: EdgeInsets.all(8.sp),
                            child: Text(
                              'Н О В Ы Й    З А В Е Т',
                              style: style.textTheme.bodyMedium,
                            ),
                          ),
                        MyTile(
                          title: element.bookName,
                          onTap: () {
                            c.selectedBook = element;
                            Get.toNamed(
                                '/new_fragment/select_chapter_and_verse');
                          },
                        ),
                        SizedBox(height: 5.74.h),
                      ],
                    ),
                  );
                }
                return result;
              }(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
