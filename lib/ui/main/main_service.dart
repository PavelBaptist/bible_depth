import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@module
abstract class MainServiceModule {
  @preResolve
  Future<MainService> provideMainService(
    FetchAllFoldersUseCase fetchAllFoldersUseCase,
    FetchFragmentsUseCase fetchFragmentsUseCase,
    FetchVersesUseCase fetchVersesUseCase,
    PutWordUseCase putWordUseCase,
    FetchWordsForFragmentUseCase fetchWordsForFragmentUseCase,
    PutWordStyleUseCase putWordStyleUseCase,
    FetchWordsStyleUseCase fetchWordsStyleUseCase,
    PutWordsStyleUseCase putWordsStyleUseCase,
    DeleteWordstyleUsecase deleteWordstyleUsecase,
    FetchFontSizeUseCase fetchFontSizeUseCase,
    PutFontSizeUseCase putFontSizeUseCase,
    FetchNewLineModeUseCase fetchNewLineModeUseCase,
    PutNewLineModeUseCase putNewLineModeUseCase,
  ) async {
    return MainService(
      fetchAllFoldersUseCase: fetchAllFoldersUseCase,
      fetchFragmentsUseCase: fetchFragmentsUseCase,
      fetchVersesUseCase: fetchVersesUseCase,
      putWordUseCase: putWordUseCase,
      fetchWordsForFragmentUseCase: fetchWordsForFragmentUseCase,
      putWordStyleUseCase: putWordStyleUseCase,
      fetchWordsStyleUseCase: fetchWordsStyleUseCase,
      putWordsStyleUseCase: putWordsStyleUseCase,
      deleteWordstyleUsecase: deleteWordstyleUsecase,
      fetchFontSizeUseCase: fetchFontSizeUseCase,
      putFontSizeUseCase: putFontSizeUseCase,
      fetchNewLineModeUseCase: fetchNewLineModeUseCase,
      putNewLineModeUseCase: putNewLineModeUseCase,
    );
  }
}

class MainService {
  MainService({
    required FetchAllFoldersUseCase fetchAllFoldersUseCase,
    required FetchFragmentsUseCase fetchFragmentsUseCase,
    required FetchVersesUseCase fetchVersesUseCase,
    required PutWordUseCase putWordUseCase,
    required FetchWordsForFragmentUseCase fetchWordsForFragmentUseCase,
    required PutWordStyleUseCase putWordStyleUseCase,
    required FetchWordsStyleUseCase fetchWordsStyleUseCase,
    required PutWordsStyleUseCase putWordsStyleUseCase,
    required DeleteWordstyleUsecase deleteWordstyleUsecase,
    required FetchFontSizeUseCase fetchFontSizeUseCase,
    required PutFontSizeUseCase putFontSizeUseCase,
    required FetchNewLineModeUseCase fetchNewLineModeUseCase,
    required PutNewLineModeUseCase putNewLineModeUseCase,
  })  : _fetchAllFoldersUseCase = fetchAllFoldersUseCase,
        _fetchFragmentsUseCase = fetchFragmentsUseCase,
        _fetchVersesUseCase = fetchVersesUseCase,
        _putWordUseCase = putWordUseCase,
        _fetchWordsForFragmentUseCase = fetchWordsForFragmentUseCase,
        _putWordStyleUseCase = putWordStyleUseCase,
        _fetchWordsStyleUseCase = fetchWordsStyleUseCase,
        _putWordsStyleUseCase = putWordsStyleUseCase,
        _deleteWordstyleUsecase = deleteWordstyleUsecase,
        _fetchFontSizeUseCase = fetchFontSizeUseCase,
        _putFontSizeUseCase = putFontSizeUseCase,
        _fetchNewLineModeUseCase = fetchNewLineModeUseCase,
        _putNewLineModeUseCase = putNewLineModeUseCase;

  final FetchAllFoldersUseCase _fetchAllFoldersUseCase;
  final FetchFragmentsUseCase _fetchFragmentsUseCase;
  final FetchVersesUseCase _fetchVersesUseCase;
  final PutWordUseCase _putWordUseCase;
  final FetchWordsForFragmentUseCase _fetchWordsForFragmentUseCase;
  final PutWordStyleUseCase _putWordStyleUseCase;
  final FetchWordsStyleUseCase _fetchWordsStyleUseCase;
  final PutWordsStyleUseCase _putWordsStyleUseCase;
  final DeleteWordstyleUsecase _deleteWordstyleUsecase;
  final FetchFontSizeUseCase _fetchFontSizeUseCase;
  final PutFontSizeUseCase _putFontSizeUseCase;
  final FetchNewLineModeUseCase _fetchNewLineModeUseCase;
  final PutNewLineModeUseCase _putNewLineModeUseCase;

  Future<Either<Failure, Stream<List<Folder>>>> fetchAllFoldes() async {
    return _fetchAllFoldersUseCase();
  }

  Future<Either<Failure, Stream<List<Fragment>>>> fetchFragments(
      int folderId) async {
    return _fetchFragmentsUseCase(folderId);
  }

  Future<Either<Failure, Stream<List<Verse>>>> fetchVerses(
      int fragmentId) async {
    return _fetchVersesUseCase(fragmentId);
  }

  Future<Either<Failure, Stream<List<Word>>>> fetchWordsForFragment(
      int fragmentId) async {
    return _fetchWordsForFragmentUseCase(fragmentId);
  }

  Either<Failure, bool> putWord(Word word) {
    return _putWordUseCase(word);
  }

  Future<Either<Failure, Stream<List<WordStyle>>>> fetchWordsStyle() async {
    return _fetchWordsStyleUseCase();
  }

  Either<Failure, bool> putWordStyle(WordStyle word) {
    return _putWordStyleUseCase(word);
  }

  Either<Failure, bool> putWordsStyle(List<WordStyle> words) {
    return _putWordsStyleUseCase(words);
  }

  Either<Failure, bool> deleteWordStyle(WordStyle word) {
    return _deleteWordstyleUsecase(word);
  }

  Future<Either<Failure, bool>> putFontSize(double size) {
    return _putFontSizeUseCase(size);
  }

  Future<Either<Failure, double>> fetchFontSize() {
    return _fetchFontSizeUseCase();
  }

  Future<Either<Failure, bool>> putNewLineMode(bool mode) {
    return _putNewLineModeUseCase(mode);
  }

  Future<Either<Failure, bool>> fetchNewLineMode() {
    return _fetchNewLineModeUseCase();
  }
}
