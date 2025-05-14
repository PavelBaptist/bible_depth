import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@Injectable()
class PutFragmentUseCase {
  const PutFragmentUseCase(this._inductiveRepository);

  final InductiveRepository _inductiveRepository;

  @protected
  Future<Either<Failure, bool>> call(Fragment fragment) async {
    final result = await _inductiveRepository.putFragments(fragment);
    return result;
  }
}
