import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

abstract class InductiveRepository {
  Either<Failure, Stream<List<Folder>>> fetchAllFolders();
  Either<Failure, bool> putFolders(Folder folder);
}
