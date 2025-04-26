import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@Injectable()
class FetchVersesUseCase {
  const FetchVersesUseCase(this._inductiveRepository);

  final InductiveRepository _inductiveRepository;

  @protected
  Either<Failure, Stream<List<Verse>>> call(int fragmentId) {
    final result = _inductiveRepository.fetchAllVerses(fragmentId);
    return result;
  }
}
