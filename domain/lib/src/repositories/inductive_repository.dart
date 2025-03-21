import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

abstract class InductiveRepository {
  Future<Either<Failure, String>> getMyAnalysis();
}
