import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@Injectable()
class PutWordStyleUseCase {
  const PutWordStyleUseCase(this._inductiveRepository);

  final InductiveRepository _inductiveRepository;

  @protected
  Either<Failure, bool> call(WordStyle word) {
    final result = _inductiveRepository.putWordStyle(word);
    return result;
  }
}
