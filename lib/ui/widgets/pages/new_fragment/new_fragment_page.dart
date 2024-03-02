import 'package:bible_depth/data/bible/rst.dart';
import 'package:bible_depth/ui/widgets/pages/new_fragment/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewFragmentPage extends StatelessWidget {
  NewFragmentPage({super.key});
  final c = Get.put(NewFragmentPageController());

  @override
  Widget build(BuildContext context) {
    var rst = Rst.instance;
    return Scaffold(
      body: FutureBuilder(
        future: c.initBible(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              children: () {
                List<Widget> result = [];
                for (var element in c.bible!.value.books) {
                  result.add(InkWell(
                    child: ListTile(
                      title: Text(element.bookName),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        c.selectedBook = element;
                        Get.toNamed('/new_fragment/select_chapter_and_verse');
                      },
                    ),
                  ));
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
