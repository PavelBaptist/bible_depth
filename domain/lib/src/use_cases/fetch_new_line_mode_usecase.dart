import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@Injectable()
class FetchNewLineModeUseCase {
  const FetchNewLineModeUseCase(this._inductiveRepository);

  final InductiveRepository _inductiveRepository;

  @protected
  Future<Either<Failure, bool>> call() async {
    final result = await _inductiveRepository.fetchNewLineMode();
    return result;
  }
}
