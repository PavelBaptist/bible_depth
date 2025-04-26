import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

@LazySingleton()
class BibleService {
  BibleService({
    required FetchBibleUseCase fetchBibleUseCase,
    required PutFoldersUseCase putFoldersUseCase,
    required PutFragmentUseCase putFragmentUseCase,
    required PutVerseUseCase putVerseUseCase,
    required PutWordUseCase putWordUseCase,
  })  : _fetchBibleUseCase = fetchBibleUseCase,
        _putFoldersUseCase = putFoldersUseCase,
        _putFragmentUseCase = putFragmentUseCase;

  final FetchBibleUseCase _fetchBibleUseCase;
  final PutFoldersUseCase _putFoldersUseCase;
  final PutFragmentUseCase _putFragmentUseCase;

  Future<Either<Failure, List<Book>>> getBible() async {
    return await _fetchBibleUseCase(TranslateBible.rst);
  }

  Either<Failure, Folder> putFolder(Folder folder) {
    return _putFoldersUseCase(folder);
  }

  Either<Failure, bool> putFragment(Fragment fragment) {
    return _putFragmentUseCase(fragment);
  }
}
