// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/domain.dart' as _i494;
import 'package:domain/src/use_cases/delete_words_usecase.dart' as _i630;
import 'package:domain/src/use_cases/delete_wordstyle_usecase.dart' as _i18;
import 'package:domain/src/use_cases/fetch_all_folders_usecase.dart' as _i652;
import 'package:domain/src/use_cases/fetch_bible_usecase.dart' as _i1001;
import 'package:domain/src/use_cases/fetch_font_size_usecase.dart' as _i701;
import 'package:domain/src/use_cases/fetch_fragments_usecase.dart' as _i475;
import 'package:domain/src/use_cases/fetch_is_show_onboarding_usecase.dart'
    as _i700;
import 'package:domain/src/use_cases/fetch_new_line_mode_usecase.dart' as _i117;
import 'package:domain/src/use_cases/fetch_verses_usecase.dart' as _i785;
import 'package:domain/src/use_cases/fetch_word_style_use_case.dart' as _i63;
import 'package:domain/src/use_cases/fetch_words_for_fragment_usecase.dart'
    as _i560;
import 'package:domain/src/use_cases/get_chapters_for_book_usecase.dart'
    as _i92;
import 'package:domain/src/use_cases/hide_onboarding_usecase.dart' as _i506;
import 'package:domain/src/use_cases/put_folder_usecase.dart' as _i154;
import 'package:domain/src/use_cases/put_font_size_usecase.dart' as _i289;
import 'package:domain/src/use_cases/put_fragment_usecase.dart' as _i866;
import 'package:domain/src/use_cases/put_many_words_usecase.dart' as _i504;
import 'package:domain/src/use_cases/put_new_line_mode_usecase.dart' as _i10;
import 'package:domain/src/use_cases/put_verse_usecase.dart' as _i861;
import 'package:domain/src/use_cases/put_word_style_usecase.dart' as _i1015;
import 'package:domain/src/use_cases/put_word_usecase.dart' as _i263;
import 'package:domain/src/use_cases/put_words_style_usecase.dart' as _i678;
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
    gh.factory<_i92.GetChaptersForBookUsecase>(
        () => _i92.GetChaptersForBookUsecase(gh<_i494.BibleRepository>()));
    gh.factory<_i1001.FetchAllBookUseCase>(
        () => _i1001.FetchAllBookUseCase(gh<_i494.BibleRepository>()));
    gh.factory<_i700.FetchIsShowOnboardingUseCase>(
        () => _i700.FetchIsShowOnboardingUseCase(gh<_i494.StartRepository>()));
    gh.factory<_i506.HideOnboardingUseCase>(
        () => _i506.HideOnboardingUseCase(gh<_i494.StartRepository>()));
    gh.factory<_i263.PutWordUseCase>(
        () => _i263.PutWordUseCase(gh<_i494.InductiveRepository>()));
    gh.factory<_i785.FetchVersesUseCase>(
        () => _i785.FetchVersesUseCase(gh<_i494.InductiveRepository>()));
    gh.factory<_i154.PutFoldersUseCase>(
        () => _i154.PutFoldersUseCase(gh<_i494.InductiveRepository>()));
    gh.factory<_i560.FetchWordsForFragmentUseCase>(() =>
        _i560.FetchWordsForFragmentUseCase(gh<_i494.InductiveRepository>()));
    gh.factory<_i475.FetchFragmentsUseCase>(
        () => _i475.FetchFragmentsUseCase(gh<_i494.InductiveRepository>()));
    gh.factory<_i861.PutVerseUseCase>(
        () => _i861.PutVerseUseCase(gh<_i494.InductiveRepository>()));
    gh.factory<_i866.PutFragmentUseCase>(
        () => _i866.PutFragmentUseCase(gh<_i494.InductiveRepository>()));
    gh.factory<_i652.FetchAllFoldersUseCase>(
        () => _i652.FetchAllFoldersUseCase(gh<_i494.InductiveRepository>()));
    gh.factory<_i1015.PutWordStyleUseCase>(
        () => _i1015.PutWordStyleUseCase(gh<_i494.InductiveRepository>()));
    gh.factory<_i63.FetchWordsStyleUseCase>(
        () => _i63.FetchWordsStyleUseCase(gh<_i494.InductiveRepository>()));
    gh.factory<_i678.PutWordsStyleUseCase>(
        () => _i678.PutWordsStyleUseCase(gh<_i494.InductiveRepository>()));
    gh.factory<_i18.DeleteWordstyleUsecase>(
        () => _i18.DeleteWordstyleUsecase(gh<_i494.InductiveRepository>()));
    gh.factory<_i289.PutFontSizeUseCase>(
        () => _i289.PutFontSizeUseCase(gh<_i494.InductiveRepository>()));
    gh.factory<_i701.FetchFontSizeUseCase>(
        () => _i701.FetchFontSizeUseCase(gh<_i494.InductiveRepository>()));
    gh.factory<_i10.PutNewLineModeUseCase>(
        () => _i10.PutNewLineModeUseCase(gh<_i494.InductiveRepository>()));
    gh.factory<_i117.FetchNewLineModeUseCase>(
        () => _i117.FetchNewLineModeUseCase(gh<_i494.InductiveRepository>()));
    gh.factory<_i630.DeleteWordsUsecase>(
        () => _i630.DeleteWordsUsecase(gh<_i494.InductiveRepository>()));
    gh.factory<_i504.PutManyWordsUseCase>(
        () => _i504.PutManyWordsUseCase(gh<_i494.InductiveRepository>()));
    return this;
  }
}
