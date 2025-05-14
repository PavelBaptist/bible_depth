import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@Injectable()
class DeleteWordstyleUsecase {
  const DeleteWordstyleUsecase(this._inductiveRepository);

  final InductiveRepository _inductiveRepository;

  @protected
  Either<Failure, bool> call(WordStyle word) {
    final result = _inductiveRepository.deleteWordStyle(word);
    return result;
  }
}
