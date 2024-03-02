import 'package:bible_depth/data/bible/bible.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/fragment_page.dart';
import 'package:bible_depth/ui/widgets/pages/new_fragment/new_fragment_page.dart';
import 'package:bible_depth/ui/widgets/pages/new_fragment/select_chapter_and_verse/select_chapter_and_verse_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main(List<String> args) async {
  await GetStorage.init();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/new_fragment',
      theme: ThemeData(useMaterial3: true),
      getPages: [
        GetPage(
          name: '/fragment',
          page: () => FragmentPage(),
        ),
        GetPage(
          name: '/new_fragment',
          page: () => NewFragmentPage(),
        ),
        GetPage(
          name: '/new_fragment/select_chapter_and_verse',
          page: () => SelectChapterAndVersePage(),
        ),
      ],
    );
  }
}
