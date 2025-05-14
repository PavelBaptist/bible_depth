import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@Injectable()
class PutNewLineModeUseCase {
  const PutNewLineModeUseCase(this._inductiveRepository);

  final InductiveRepository _inductiveRepository;

  @protected
  Future<Either<Failure, bool>> call(bool mode) async {
    final result = await _inductiveRepository.putNewLineMode(mode);
    return result;
  }
}
