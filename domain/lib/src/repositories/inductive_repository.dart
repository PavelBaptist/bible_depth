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
  Either<Failure, bool> putManyWords(List<Word> words);
  Either<Failure, bool> deleteWords(List<Word> words);

  Either<Failure, Stream<List<WordStyle>>> fetchWordsStyle();
  Either<Failure, bool> putWordStyle(WordStyle words);
  Either<Failure, bool> putWordStyles(List<WordStyle> words);
  Either<Failure, bool> deleteWordStyle(WordStyle word);

  Future<Either<Failure, double>> fetchFontSize();
  Future<Either<Failure, bool>> putFontSize(double size);

  Future<Either<Failure, bool>> fetchNewLineMode();
  Future<Either<Failure, bool>> putNewLineMode(bool mode);
}
