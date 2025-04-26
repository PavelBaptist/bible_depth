import 'package:bible_depth/library.dart';

import 'di.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection() async {
  await getIt.init();
  await getIt.allReady();
}
