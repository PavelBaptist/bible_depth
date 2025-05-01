import 'package:bible_depth/library.dart';

void main() async {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton<Talker>(talker);
  // Bloc.observer = TalkerBlocObserver(talker: talker);
  runZonedGuarded(
    _runMyApp,
    (error, stack) => GetIt.I<Talker>().handle(error, stack),
  );
}

Future<void> _runMyApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await AppInitializer(AppConfig.getInstance()).init();
  GetIt.I<Talker>().debug('Started');
  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ru', 'RU'),
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [TalkerRouteObserver(GetIt.I<Talker>())],
      ),
      theme: UIThemes.lightTheme(),
      darkTheme: UIThemes.darkTheme(),
    );
  }
}
