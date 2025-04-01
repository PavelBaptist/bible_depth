import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@Injectable()
class PutFoldersUseCase {
  const PutFoldersUseCase(this._inductiveRepository);

  final InductiveRepository _inductiveRepository;

  @protected
  Either<Failure, bool> call(Folder folder) {
    final result = _inductiveRepository.putFolders(folder);
    return result;
  }
}
