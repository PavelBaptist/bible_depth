import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';

@Injectable()
class FetchAllBookUseCase {
  const FetchAllBookUseCase(this._bibleRepository);

  final BibleRepository _bibleRepository;

  @protected
  Future<Either<Failure, List<Book>>> call(TranslateBible translate) async {
    final result = await _bibleRepository.fetchAllBook(translate);
    return result;
  }
}
