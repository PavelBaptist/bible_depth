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
  Future<Either<Failure, List<Book>>> fetchBible(
      TranslateBible translate) async {
    try {
      final response = await _bibleLocalDataSource.fetchBible(translate);
      return Right(response);
    } catch (e) {
      return Left(Failure.serverError());
    }
  }
}
