import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@Injectable()
class FetchWordsStyleUseCase {
  const FetchWordsStyleUseCase(this._inductiveRepository);

  final InductiveRepository _inductiveRepository;

  @protected
  Either<Failure, Stream<List<WordStyle>>> call() {
    final result = _inductiveRepository.fetchWordsStyle();
    return result;
  }
}
