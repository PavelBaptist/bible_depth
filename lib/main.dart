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

import 'package:hive/hive.dart';

void main(List<String> args) async {
  var path = Directory.current.path;
  Hive
    ..init(path)
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
  // FragmentList fragmentList = box.get('fragments') as FragmentList;
  // await box.put(
  //   'fragments',
  //   fragmentList
  //     ..list.add(
  //       Fragment(text: [Word()..value = 'word1'], name: 'name1'),
  //     ),
  // );

  // await box.put(
  //     'fragments', FragmentList()..list.add(Fragment(text: [], name: 'fffff')));
  // var fragList = FragmentList();
  // fragList.list = [
  //   Fragment(text: [Word(value: 'text')], name: "Тестовый фрагмент"),
  //   Fragment(text: [Word(value: 'text')], name: "Тестовый фрагмент 2"),
  //   Fragment(text: [Word(value: 'text')], name: "Тестовый фрагмент 3"),
  // ];
  // await box.put('1', fragList);

  // print((box.get('1') as FragmentList).list[1].name);
  runApp(const App());
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
