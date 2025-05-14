import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@Injectable()
class PutVerseUseCase {
  const PutVerseUseCase(this._inductiveRepository);

  final InductiveRepository _inductiveRepository;

  @protected
  Either<Failure, bool> call(List<Verse> verses) {
    final result = _inductiveRepository.putVerse(verses);
    return result;
  }
}
