import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@Injectable()
class PutFontSizeUseCase {
  const PutFontSizeUseCase(this._inductiveRepository);

  final InductiveRepository _inductiveRepository;

  @protected
  Future<Either<Failure, bool>> call(double size) async {
    final result = await _inductiveRepository.putFontSize(size);
    return result;
  }
}
