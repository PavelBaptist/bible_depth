import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@Injectable()
class PutWordsStyleUseCase {
  const PutWordsStyleUseCase(this._inductiveRepository);

  final InductiveRepository _inductiveRepository;

  @protected
  Either<Failure, bool> call(List<WordStyle> words) {
    final result = _inductiveRepository.putWordStyles(words);
    return result;
  }
}
