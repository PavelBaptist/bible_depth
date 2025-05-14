import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@Injectable()
class DeleteWordsUsecase {
  const DeleteWordsUsecase(this._inductiveRepository);

  final InductiveRepository _inductiveRepository;

  @protected
  Either<Failure, bool> call(List<Word> words) {
    final result = _inductiveRepository.deleteWords(words);
    return result;
  }
}
