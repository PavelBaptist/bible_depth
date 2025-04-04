// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/data.dart' as _i437;
import 'package:data/objectbox.g.dart' as _i337;
import 'package:data/src/di/di.dart' as _i102;
import 'package:data/src/repositories/source/bible_repository_impl.dart'
    as _i454;
import 'package:data/src/repositories/source/database/app_database.dart'
    as _i723;
import 'package:data/src/repositories/source/database/bible_local_data_source.dart'
    as _i708;
import 'package:data/src/repositories/source/database/inductive_local_data_source.dart'
    as _i574;
import 'package:data/src/repositories/source/database/start_data_source.dart'
    as _i371;
import 'package:data/src/repositories/source/inductive_repository_impl.dart'
    as _i851;
import 'package:data/src/repositories/source/preference/app_preference.dart'
    as _i534;
import 'package:data/src/repositories/source/start_repository_impl.dart'
    as _i587;
import 'package:domain/domain.dart' as _i494;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final serviceModule = _$ServiceModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => serviceModule.prefs,
      preResolve: true,
    );
    gh.factory<_i337.Store>(() => serviceModule.provideStore());
    gh.lazySingleton<_i708.BibleLocalDataSource>(
        () => _i708.BibleLocalDataSource());
    gh.lazySingleton<_i723.AppDatabase>(
        () => _i723.AppDatabase(gh<_i337.Store>()));
    gh.lazySingleton<_i534.AppPreferences>(
        () => _i534.AppPreferences(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i494.BibleRepository>(
        () => _i454.BibleRepositoryImpl(gh<_i437.BibleLocalDataSource>()));
    gh.lazySingleton<_i574.InductiveLocalDataSource>(
        () => _i574.InductiveLocalDataSource(gh<_i437.AppDatabase>()));
    gh.lazySingleton<_i371.StartDataSource>(
        () => _i371.StartDataSource(gh<_i437.AppPreferences>()));
    gh.lazySingleton<_i494.StartRepository>(
        () => _i587.StartRepositoryImpl(gh<_i437.StartDataSource>()));
    gh.lazySingleton<_i494.InductiveRepository>(() =>
        _i851.InductiveRepositoryImpl(gh<_i437.InductiveLocalDataSource>()));
    return this;
  }
}

class _$ServiceModule extends _i102.ServiceModule {}
