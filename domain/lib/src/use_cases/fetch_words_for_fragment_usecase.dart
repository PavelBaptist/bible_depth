import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@Injectable()
class FetchWordsForFragmentUseCase {
  const FetchWordsForFragmentUseCase(this._inductiveRepository);

  final InductiveRepository _inductiveRepository;

  @protected
  Either<Failure, Stream<List<Word>>> call(int fragmentId) {
    final result = _inductiveRepository.fetchWordsForFragment(fragmentId);
    return result;
  }
}
