import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

@LazySingleton()
class BibleService {
  BibleService({
    required FetchAllBookUseCase fetchAllBookUseCase,
    required PutFoldersUseCase putFoldersUseCase,
    required PutFragmentUseCase putFragmentUseCase,
    required PutVerseUseCase putVerseUseCase,
    required PutWordUseCase putWordUseCase,
    required GetChaptersForBookUsecase getChaptersForBookUsecase,
  })  : _fetchAllBookUseCase = fetchAllBookUseCase,
        _putFoldersUseCase = putFoldersUseCase,
        _putFragmentUseCase = putFragmentUseCase,
        _getChaptersForBookUsecase = getChaptersForBookUsecase;

  final FetchAllBookUseCase _fetchAllBookUseCase;
  final PutFoldersUseCase _putFoldersUseCase;
  final PutFragmentUseCase _putFragmentUseCase;
  final GetChaptersForBookUsecase _getChaptersForBookUsecase;

  Future<Either<Failure, List<Book>>> getAllBook() async {
    return await _fetchAllBookUseCase(TranslateBible.rst);
  }

  Future<Either<Failure, List<Chapter>>> getChaptersForBook(int bookId) async {
    return await _getChaptersForBookUsecase(bookId, TranslateBible.rst);
  }

  Either<Failure, Folder> putFolder(Folder folder) {
    return _putFoldersUseCase(folder);
  }

  Future<Either<Failure, bool>> putFragment(Fragment fragment) {
    return _putFragmentUseCase(fragment);
  }
}
