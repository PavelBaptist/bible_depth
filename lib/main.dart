import 'package:bible_depth/app_initializer.dart';
import 'package:bible_depth/config/app_config.dart';
import 'package:bible_depth/library.dart';
import 'package:bible_depth/resources/ui_themes.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared/shared.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SharedPreferencesHelper.init();
  // await SharedPreferencesHelper.initRegistrationForm();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await AppInitializer(AppConfig.getInstance()).init();

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
        // translations: AppTranslation(),
        // locale: AppTranslation.locale,
        debugShowCheckedModeBanner: false,
        initialRoute: '/spash',
        theme: UIThemes.lightTheme(),
        darkTheme: UIThemes.darkTheme(),
      ),
    );
  }
}
