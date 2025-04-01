import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';

@Injectable()
class FetchBibleUseCase {
  const FetchBibleUseCase(this._bibleRepository);

  final BibleRepository _bibleRepository;

  @protected
  Future<Either<Failure, List<Book>>> call(TranslateBible translate) async {
    final result = await _bibleRepository.fetchBible(translate);
    return result;
  }
}
