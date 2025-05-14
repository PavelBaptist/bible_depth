import 'dart:ui';

import 'package:bible_depth/library.dart';
import 'package:domain/domain.dart';
import 'package:shared/shared.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final appLocale = S.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundAbsolutlyDark,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.splash),
                fit: BoxFit.cover,
                opacity: 0.73,
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      AppIcons.logo,
                      width: 93,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      appLocale.bibleDepth,
                      style: theme.jura700x22.copyWith(color: theme.textWhite),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32)
                        .copyWith(bottom: 24.0),
                    child: FadeTransition(
                      opacity: _opacityAnimation,
                      child: Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: TextButton(
                                  onPressed: () {
                                    final startService =
                                        GetIt.instance.get<StartService>();
                                    startService.hideOnboarding();
                                    AutoRouter.of(context)
                                        .replace(const MainRoute());
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    side: const BorderSide(
                                        color: Colors.white, width: 1),
                                  ),
                                  child: Text(
                                    appLocale.startTheDive,
                                    style: theme.jura700x15
                                        .copyWith(color: theme.textWhite),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> init() async {
    await AppInitializer(AppConfig.getInstance()).init();
    final startService = GetIt.instance.get<StartService>();
    final mainService = GetIt.instance.get<MainService>();
    final isShowOnboarding = await startService.isShowOnboarding;
    if (isShowOnboarding) {
      mainService.putWordStyle(WordStyle(
        backgroundColor: colorToHex(Colors.blue),
        order: 1,
      ));
      mainService.putWordStyle(WordStyle(
        backgroundColor: colorToHex(Colors.green),
        borderColor: colorToHex(Colors.yellow),
        order: 2,
      ));
      mainService.putWordStyle(WordStyle(
        borderColor: colorToHex(Colors.red),
        fontColor: colorToHex(Colors.red),
        order: 3,
      ));
      await Future.delayed(const Duration(milliseconds: 800));
      _controller.forward();
    } else {
      if (mounted) {
        AutoRouter.of(context).replace(const MainRoute());
      }
    }
  }
}
