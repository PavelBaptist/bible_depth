import 'dart:async';

import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

import 'package:dartz/dartz.dart';

@LazySingleton(as: BibleRepository)
class BibleRepositoryImpl implements BibleRepository {
  BibleRepositoryImpl(
    this._bibleLocalDataSource,
  );

  final BibleLocalDataSource _bibleLocalDataSource;

  @override
  Future<Either<Failure, List<Book>>> fetchAllBook(
      TranslateBible translate) async {
    try {
      final response = await _bibleLocalDataSource.fetchAllBook(translate);
      return Right(response);
    } catch (e) {
      return Left(Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, List<Chapter>>> getChaptersForBook(
    int bookId,
    TranslateBible translate,
  ) async {
    try {
      final response =
          await _bibleLocalDataSource.getChaptersForBook(bookId, translate);
      return Right(response);
    } catch (e) {
      return Left(Failure.serverError());
    }
  }
}
