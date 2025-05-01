import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@Injectable()
class GetChaptersForBookUsecase {
  const GetChaptersForBookUsecase(this._bibleRepository);

  final BibleRepository _bibleRepository;

  @protected
  Future<Either<Failure, List<Chapter>>> call(int bookId) async {
    final result = await _bibleRepository.getChaptersForBook(bookId);
    return result;
  }
}
