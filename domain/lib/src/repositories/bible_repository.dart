import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:shared/shared.dart';

abstract class BibleRepository {
  Future<Either<Failure, List<Book>>> fetchBible(TranslateBible translate);
}
