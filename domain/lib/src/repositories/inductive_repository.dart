import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

abstract class InductiveRepository {
  Either<Failure, Stream<List<Folder>>> fetchAllFolders();
  Either<Failure, Folder> putFolders(Folder folder);

  Either<Failure, Stream<List<Fragment>>> fetchFragments(int folderId);
  Future<Either<Failure, bool>> putFragments(Fragment fragment);

  Either<Failure, Stream<List<Verse>>> fetchAllVerses(int fragmentId);
  Either<Failure, bool> putVerse(List<Verse> verses);

  Either<Failure, Stream<List<Word>>> fetchWordsForFragment(int fragmentId);
  Either<Failure, bool> putWord(Word words);
}
