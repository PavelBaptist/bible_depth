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
    required GetChaptersForBookUsecase getChaptersForBookUsecase,
    required CreateBibleUseCase createBibleUseCase,
  })  : _fetchBibleUseCase = fetchBibleUseCase,
        _putFoldersUseCase = putFoldersUseCase,
        _putFragmentUseCase = putFragmentUseCase,
        _getChaptersForBookUsecase = getChaptersForBookUsecase,
        _createBibleUseCase = createBibleUseCase;

  final FetchBibleUseCase _fetchBibleUseCase;
  final PutFoldersUseCase _putFoldersUseCase;
  final PutFragmentUseCase _putFragmentUseCase;
  final GetChaptersForBookUsecase _getChaptersForBookUsecase;
  final CreateBibleUseCase _createBibleUseCase;

  Future<Either<Failure, List<Book>>> getBible() async {
    return await _fetchBibleUseCase(TranslateBible.rst);
  }

  Future<Either<Failure, List<Chapter>>> getChaptersForBook(int bookId) async {
    return await _getChaptersForBookUsecase(bookId);
  }

  Either<Failure, Folder> putFolder(Folder folder) {
    return _putFoldersUseCase(folder);
  }

  Either<Failure, bool> putFragment(Fragment fragment) {
    return _putFragmentUseCase(fragment);
  }

  Future<Either<Failure, bool>> createBible() async {
    return await _createBibleUseCase(TranslateBible.rst);
  }
}
