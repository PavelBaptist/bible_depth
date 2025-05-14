import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@Injectable()
class FetchFragmentsUseCase {
  const FetchFragmentsUseCase(this._inductiveRepository);

  final InductiveRepository _inductiveRepository;

  @protected
  Either<Failure, Stream<List<Fragment>>> call(int folderId) {
    final result = _inductiveRepository.fetchFragments(folderId);
    return result;
  }
}
