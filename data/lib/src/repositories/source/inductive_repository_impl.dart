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
  Either<Failure, Folder> putFolders(Folder folder) {
    int id = _inductiveLocalDataSource.putFolder(folder.toLocalFolder());
    FolderLocal? newFolder = _inductiveLocalDataSource.getFolderById(id);
    if (newFolder != null) {
      return right(newFolder.toFolder());
    } else {
      return left(ServerError());
    }
  }

  @override
  Either<Failure, Stream<List<Fragment>>> fetchFragments(int folderId) {
    final response = _inductiveLocalDataSource.fetchFragments(folderId);
    Stream<List<Fragment>> convertStream = response.map((fragmentLocalList) {
      return fragmentLocalList
          .map((fragmentLocal) => fragmentLocal.toFragment())
          .toList();
    });
    return right(convertStream);
  }

  @override
  Either<Failure, Stream<List<Verse>>> fetchAllVerses(int fragmentId) {
    final response = _inductiveLocalDataSource.fetchVerses(fragmentId);
    Stream<List<Verse>> convertStream = response.map((verseLocalList) {
      return verseLocalList.map((verseLocal) => verseLocal.toVerse()).toList();
    });
    return right(convertStream);
  }

  @override
  Either<Failure, Stream<List<Word>>> fetchAllWords() {
    final response = _inductiveLocalDataSource.fetchAllWords();
    Stream<List<Word>> convertStream = response.map((wordLocalList) {
      return wordLocalList.map((wordLocal) => wordLocal.toWord()).toList();
    });
    return right(convertStream);
  }

  @override
  Either<Failure, bool> putFragments(Fragment fragment) {
    int idFragment =
        _inductiveLocalDataSource.putFragment(fragment.toLocalFragment());
    FragmentLocal? newFragment =
        _inductiveLocalDataSource.getFragmentById(idFragment);
    if (newFragment == null) {
      return left(ServerError());
    }
    _inductiveLocalDataSource.putVerse(fragment.text
        .map((e) =>
            e.copyWith(fragment: newFragment.toFragment()).toLocalVerse())
        .toList());
    // List<int> idVerses = _inductiveLocalDataSource.putVerse(fragment.text
    //     .map((verse) => verse.copyWith(
    //         words: [], fragment: newFragment.toFragment()).toLocalVerse())
    //     .toList());
    // for (int i = 0; i < idVerses.length; i++) {
    //   VerseLocal? newVerse =
    //       _inductiveLocalDataSource.getVerseById(idVerses[i]);
    //   _inductiveLocalDataSource.putWord(fragment.text[i].words
    //       .map(
    //           (word) => word.copyWith(verse: newVerse!.toVerse()).toLocalWord())
    //       .toList());
    // }
    return right(true);
  }

  @override
  Either<Failure, bool> putVerse(List<Verse> verses) {
    _inductiveLocalDataSource
        .putVerse(verses.map((verse) => verse.toLocalVerse()).toList());
    return right(true);
  }

  @override
  Either<Failure, bool> putWord(Word word) {
    _inductiveLocalDataSource.putWord(word.toLocalWord());
    return right(true);
  }
}
