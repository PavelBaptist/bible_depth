// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/domain.dart' as _i494;
import 'package:domain/src/use_cases/fetch_all_folders_usecase.dart' as _i652;
import 'package:domain/src/use_cases/fetch_bible_usecase.dart' as _i1001;
import 'package:domain/src/use_cases/fetch_is_show_onboarding_usecase.dart'
    as _i700;
import 'package:domain/src/use_cases/hide_onboarding_usecase.dart' as _i506;
import 'package:domain/src/use_cases/put_folder_usecase.dart' as _i154;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i1001.FetchBibleUseCase>(
        () => _i1001.FetchBibleUseCase(gh<_i494.BibleRepository>()));
    gh.factory<_i700.FetchIsShowOnboardingUseCase>(
        () => _i700.FetchIsShowOnboardingUseCase(gh<_i494.StartRepository>()));
    gh.factory<_i506.HideOnboardingUseCase>(
        () => _i506.HideOnboardingUseCase(gh<_i494.StartRepository>()));
    gh.factory<_i154.PutFoldersUseCase>(
        () => _i154.PutFoldersUseCase(gh<_i494.InductiveRepository>()));
    gh.factory<_i652.FetchAllFoldersUseCase>(
        () => _i652.FetchAllFoldersUseCase(gh<_i494.InductiveRepository>()));
    return this;
  }
}
