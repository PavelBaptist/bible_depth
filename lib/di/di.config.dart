// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bible_depth/ui/choice_fragment/bible_service.dart' as _i641;
import 'package:bible_depth/ui/main/main_service.dart' as _i702;
import 'package:bible_depth/ui/start/start_service.dart' as _i562;
import 'package:domain/domain.dart' as _i494;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

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
    final mainServiceModule = _$MainServiceModule();
    await gh.factoryAsync<_i702.MainService>(
      () => mainServiceModule.provideMainService(
        gh<_i494.FetchAllFoldersUseCase>(),
        gh<_i494.FetchFragmentsUseCase>(),
        gh<_i494.FetchVersesUseCase>(),
        gh<_i494.PutWordUseCase>(),
        gh<_i494.FetchWordsForFragmentUseCase>(),
      ),
      preResolve: true,
    );
    gh.lazySingleton<_i641.BibleService>(() => _i641.BibleService(
          fetchAllBookUseCase: gh<_i494.FetchAllBookUseCase>(),
          putFoldersUseCase: gh<_i494.PutFoldersUseCase>(),
          putFragmentUseCase: gh<_i494.PutFragmentUseCase>(),
          putVerseUseCase: gh<_i494.PutVerseUseCase>(),
          putWordUseCase: gh<_i494.PutWordUseCase>(),
          getChaptersForBookUsecase: gh<_i494.GetChaptersForBookUsecase>(),
        ));
    gh.lazySingleton<_i562.StartService>(() => _i562.StartService(
          hideOnboardingUseCase: gh<_i494.HideOnboardingUseCase>(),
          fetchIsShowOnboardingUseCase:
              gh<_i494.FetchIsShowOnboardingUseCase>(),
        ));
    return this;
  }
}

class _$MainServiceModule extends _i702.MainServiceModule {}
