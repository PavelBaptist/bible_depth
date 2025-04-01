import 'dart:async';

import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import 'package:dartz/dartz.dart';

@LazySingleton(as: InductiveRepository)
class InductiveRepositoryImpl implements InductiveRepository {
  InductiveRepositoryImpl(
    this._inductiveLocalDataSource,
  );

  final InductiveLocalDataSource _inductiveLocalDataSource;

  @override
  Either<Failure, Stream<List<Folder>>> fetchAllFolders() {
    final response = _inductiveLocalDataSource.fetchAllFolders();
    Stream<List<Folder>> convertStream = response.map((folderLocalList) {
      return folderLocalList
          .map((folderLocal) => folderLocal.toFolder())
          .toList();
    });
    return right(convertStream);
  }

  @override
  Either<Failure, bool> putFolders(Folder folder) {
    _inductiveLocalDataSource.putFolder(folder.toLocalFolder());
    return right(true);
  }
}
