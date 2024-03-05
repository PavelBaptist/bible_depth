import 'package:bible_depth/models/fragment.dart';
import 'package:bible_depth/models/fragment_list.dart';
import 'package:bible_depth/models/word_style.dart';
import 'package:bible_depth/models/word_style_list.dart';
import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/fragment_page.dart';
import 'package:bible_depth/ui/widgets/pages/fragment/style_constructor/style_constructor_page.dart';
import 'package:bible_depth/ui/widgets/pages/main/main_page.dart';
import 'package:bible_depth/ui/widgets/pages/new_fragment/new_fragment_page.dart';
import 'package:bible_depth/ui/widgets/pages/new_fragment/select_chapter_and_verse/select_chapter_and_verse_page.dart';
import 'package:bible_depth/ui/widgets/pages/paint_test/paint_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  print((await getApplicationDocumentsDirectory()).path);
  await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);
  Hive
    ..registerAdapter(FragmentListAdapter())
    ..registerAdapter(FragmentAdapter())
    ..registerAdapter(WordAdapter())
    ..registerAdapter(VerseIndexAdapter())
    ..registerAdapter(SpaceAdapter())
    ..registerAdapter(WordStyleAdapter())
    ..registerAdapter(WordStyleListAdapter())
    ..registerAdapter(LineBreakAdapter());

  var box = await Hive.openBox('bible_depth');

  if (box.get('fragments') == null) {
    await box.put('fragments', FragmentList());
  }
  if (box.get('word_styles') == null) {
    await box.put(
        'word_styles',
        WordStyleList()
          ..list = [
            WordStyle()
              ..fontColor = Colors.white
              ..highlightColor = Colors.blue,
            WordStyle()
              ..fontColor = Colors.white
              ..highlightColor = Colors.green,
            WordStyle()
              ..fontColor = Colors.white
              ..highlightColor = Colors.black,
            WordStyle()
              ..isBold = true
              ..borderColor = Colors.red,
          ]);
  }

  // bible_depth % flutter run -d 'IPad (2)' --release;
  runApp(const App());

//  await VersionHandler.handleDatabaseUpdates();
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
          name: '/fragment/style_constructor',
          page: () => StyleConstructorPage(),
        ),
        GetPage(
          name: '/new_fragment',
          page: () => NewFragmentPage(),
        ),
        GetPage(
          name: '/new_fragment/select_chapter_and_verse',
          page: () => SelectChapterAndVersePage(),
        ),
        GetPage(
          name: '/paint_test',
          page: () => const PaintTest(),
        ),
      ],
    );
  }
}
