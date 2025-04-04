import 'package:auto_route/auto_route.dart';
import 'package:bible_depth/router/routers.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: MainRoute.page),
      ];
}
