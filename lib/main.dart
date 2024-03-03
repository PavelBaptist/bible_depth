import 'package:bible_depth/core/version_handler.dart';
import 'package:bible_depth/models/fragment.dart';
import 'package:bible_depth/models/fragment_list.dart';
import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/fragment_page.dart';
import 'package:bible_depth/ui/widgets/pages/main/main_page.dart';
import 'package:bible_depth/ui/widgets/pages/new_fragment/new_fragment_page.dart';
import 'package:bible_depth/ui/widgets/pages/new_fragment/select_chapter_and_verse/select_chapter_and_verse_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main(List<String> args) async {
  var path = Directory.current.path;
  Hive
    ..initFlutter((await getApplicationDocumentsDirectory()).path)
    ..registerAdapter(FragmentListAdapter())
    ..registerAdapter(FragmentAdapter())
    ..registerAdapter(WordAdapter())
    ..registerAdapter(VerseIndexAdapter())
    ..registerAdapter(SpaceAdapter())
    ..registerAdapter(LineBreakAdapter());

  var box = await Hive.openBox('bible_depth');

  if (box.get('fragments') == null) {
    await box.put('fragments', FragmentList());
  }

  runApp(const App());

  await VersionHandler.handleDatabaseUpdates();
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/main',
      theme: ThemeData(useMaterial3: true),
      getPages: [
        GetPage(
          name: '/main',
          page: () => MainPage(),
        ),
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
