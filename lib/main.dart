import 'dart:async';
import 'package:bible_depth/core/version_handler.dart';
import 'package:bible_depth/models/fragment.dart';
import 'package:bible_depth/models/fragment_list.dart';
import 'package:bible_depth/models/settings.dart';
import 'package:bible_depth/models/structural_law.dart';
import 'package:bible_depth/models/structural_law_list.dart';
import 'package:bible_depth/models/word_style.dart';
import 'package:bible_depth/models/word_style_list.dart';
import 'package:bible_depth/models/wrap_entity.dart';
import 'package:bible_depth/themes.dart';
import 'package:bible_depth/ui/pages/fragment/fragment_page.dart';
import 'package:bible_depth/ui/pages/fragment/header_editor/header_editor_page.dart';
import 'package:bible_depth/ui/pages/fragment/structural_law_editor/structural_law_editor_page.dart';
import 'package:bible_depth/ui/pages/fragment/word_style_editor/word_style_editor_page.dart';
import 'package:bible_depth/ui/pages/main/main_page.dart';
import 'package:bible_depth/ui/pages/new_fragment/new_fragment_page.dart';
import 'package:bible_depth/ui/pages/new_fragment/select_chapter_and_verse/select_chapter_and_verse_page.dart';
import 'package:bible_depth/ui/pages/paint_test/paint_test.dart';
import 'package:bible_depth/ui/resources/app_translation.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'ru';
  StreamSubscription _intentSub;

  _intentSub = ReceiveSharingIntent.instance.getMediaStream().listen((value) {
    launchUrlString('https://google.ru');
  }, onError: (err) {
    print("getIntentDataStream error: $err");
  });

  // Get the media sharing coming from outside the app while the app is closed.
  ReceiveSharingIntent.instance.getInitialMedia().then((value) {
    launchUrlString('https://yandex.ru');
    ReceiveSharingIntent.instance.reset();
  });

  WidgetsFlutterBinding.ensureInitialized();

  print((await getApplicationDocumentsDirectory()).path);
  await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);
  Hive
    ..registerAdapter(SettingsAdapter())
    ..registerAdapter(FragmentListAdapter())
    ..registerAdapter(FragmentAdapter())
    ..registerAdapter(WordAdapter())
    ..registerAdapter(VerseIndexAdapter())
    ..registerAdapter(WordStyleAdapter())
    ..registerAdapter(HeaderAdapter())
    ..registerAdapter(ChapterIndexAdapter())
    ..registerAdapter(WordStyleListAdapter())
    ..registerAdapter(StructuralLawAdapter())
    ..registerAdapter(StructuralLawListAdapter())
    ..registerAdapter(StructuralLawPlaceAdapter())
    ..registerAdapter(LineBreakAdapter());

  var settingsBox = await Hive.openBox('settings');

  if (settingsBox.get('settings') == null ||
      (settingsBox.get('settings') as Settings).currentVersion == null) {
    await settingsBox.put('settings', Settings());
  }

  await VersionHandler.handleDatabaseUpdates();

  var box = await Hive.openBox('bible_depth');

  if (box.get('fragments') == null) {
    await box.put('fragments', FragmentList());
  }

  runApp(const App());
  // runApp(DevicePreview(enabled: true, builder: (context) => const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 924),
      builder: (context, child) => GetMaterialApp(
        translations: AppTranslation(),
        locale: AppTranslation.locale,
        debugShowCheckedModeBanner: false,
        initialRoute: '/main',
        theme: Themes.light(),
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
            name: '/fragment/word_style_editor',
            page: () => WordStyleEditorPage(),
          ),
          GetPage(
            name: '/fragment/structural_law_editor',
            page: () => StructuralLawEditorPage(),
          ),
          GetPage(
            name: '/fragment/header_editor',
            page: () => HeaderEditorPage(),
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
      ),
    );
  }
}
