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
      FetchWordsForFragmentUseCase fetchWordsForFragmentUseCase) async {
    return MainService(
      fetchAllFoldersUseCase: fetchAllFoldersUseCase,
      fetchFragmentsUseCase: fetchFragmentsUseCase,
      fetchVersesUseCase: fetchVersesUseCase,
      putWordUseCase: putWordUseCase,
      fetchWordsForFragmentUseCase: fetchWordsForFragmentUseCase,
    );
  }
}

class MainService {
  MainService(
      {required FetchAllFoldersUseCase fetchAllFoldersUseCase,
      required FetchFragmentsUseCase fetchFragmentsUseCase,
      required FetchVersesUseCase fetchVersesUseCase,
      required PutWordUseCase putWordUseCase,
      required FetchWordsForFragmentUseCase fetchWordsForFragmentUseCase})
      : _fetchAllFoldersUseCase = fetchAllFoldersUseCase,
        _fetchFragmentsUseCase = fetchFragmentsUseCase,
        _fetchVersesUseCase = fetchVersesUseCase,
        _putWordUseCase = putWordUseCase,
        _fetchWordsForFragmentUseCase = fetchWordsForFragmentUseCase;

  final FetchAllFoldersUseCase _fetchAllFoldersUseCase;
  final FetchFragmentsUseCase _fetchFragmentsUseCase;
  final FetchVersesUseCase _fetchVersesUseCase;
  final PutWordUseCase _putWordUseCase;
  final FetchWordsForFragmentUseCase _fetchWordsForFragmentUseCase;

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
}
