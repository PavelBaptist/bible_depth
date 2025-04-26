import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@Injectable()
class PutFragmentUseCase {
  const PutFragmentUseCase(this._inductiveRepository);

  final InductiveRepository _inductiveRepository;

  @protected
  Either<Failure, bool> call(Fragment fragment) {
    final result = _inductiveRepository.putFragments(fragment);
    return result;
  }
}
