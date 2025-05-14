import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@Injectable()
class PutWordUseCase {
  const PutWordUseCase(this._inductiveRepository);

  final InductiveRepository _inductiveRepository;

  @protected
  Either<Failure, bool> call(Word words) {
    final result = _inductiveRepository.putWord(words);
    return result;
  }
}
