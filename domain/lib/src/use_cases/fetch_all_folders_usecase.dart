import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@Injectable()
class FetchAllFoldersUseCase {
  const FetchAllFoldersUseCase(this._inductiveRepository);

  final InductiveRepository _inductiveRepository;

  @protected
  Either<Failure, Stream<List<Folder>>> call() {
    final result = _inductiveRepository.fetchAllFolders();
    return result;
  }
}
