import 'dart:async';

import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

import 'package:dartz/dartz.dart';

@LazySingleton(as: StartRepository)
class StartRepositoryImpl implements StartRepository {
  StartRepositoryImpl(
    this._startDataSource,
  );

  final StartDataSource _startDataSource;

  @override
  Future<void> hideOnboarding() async {
    await _startDataSource.hideOnboarding();
  }

  @override
  Future<bool> fetchIsShowOnboarding() async {
    return await _startDataSource.fetchIsShowOnboarding();
  }
}
