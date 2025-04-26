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
  ) async {
    return MainService(
      fetchAllFoldersUseCase: fetchAllFoldersUseCase,
      fetchFragmentsUseCase: fetchFragmentsUseCase,
      fetchVersesUseCase: fetchVersesUseCase,
      putWordUseCase: putWordUseCase,
    );
  }
}

class MainService {
  MainService({
    required FetchAllFoldersUseCase fetchAllFoldersUseCase,
    required FetchFragmentsUseCase fetchFragmentsUseCase,
    required FetchVersesUseCase fetchVersesUseCase,
    required PutWordUseCase putWordUseCase,
  })  : _fetchAllFoldersUseCase = fetchAllFoldersUseCase,
        _fetchFragmentsUseCase = fetchFragmentsUseCase,
        _fetchVersesUseCase = fetchVersesUseCase,
        _putWordUseCase = putWordUseCase;

  final FetchAllFoldersUseCase _fetchAllFoldersUseCase;
  final FetchFragmentsUseCase _fetchFragmentsUseCase;
  final FetchVersesUseCase _fetchVersesUseCase;
  final PutWordUseCase _putWordUseCase;

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

  Either<Failure, bool> putWord(Word word) {
    return _putWordUseCase(word);
  }
}
