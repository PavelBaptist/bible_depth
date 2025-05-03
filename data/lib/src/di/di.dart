import 'package:data/objectbox.g.dart';
import 'package:data/src/local/objectbox_store_provider.dart';
import 'di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class ServiceModule {
  @preResolve
  Future<SharedPreferences> get prefs async =>
      await SharedPreferences.getInstance();

  @preResolve
  Future<Store> provideStore() => openSharedStore();
}

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection() => getIt.init();
