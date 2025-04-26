import 'package:data/data.dart';
import 'package:data/objectbox.g.dart';
import 'package:data/src/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class ServiceModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @preResolve
  Future<Store> provideStore() async => await openSharedStore();
}

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection() => getIt.init();
