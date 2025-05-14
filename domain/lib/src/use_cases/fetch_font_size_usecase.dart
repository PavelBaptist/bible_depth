import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@Injectable()
class FetchFontSizeUseCase {
  const FetchFontSizeUseCase(this._inductiveRepository);

  final InductiveRepository _inductiveRepository;

  @protected
  Future<Either<Failure, double>> call() async {
    final result = await _inductiveRepository.fetchFontSize();
    return result;
  }
}
