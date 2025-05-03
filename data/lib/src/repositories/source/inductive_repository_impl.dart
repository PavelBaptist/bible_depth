import 'dart:async';
import 'dart:convert';

import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';

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
  Either<Failure, Stream<List<Word>>> fetchWordsForFragment(int fragmentId) {
    final response = _inductiveLocalDataSource.fetchAllWords(fragmentId);
    Stream<List<Word>> convertStream = response.map((wordLocalList) {
      return wordLocalList.map((wordLocal) => wordLocal.toWord()).toList();
    });
    return right(convertStream);
  }

  @override
  Future<Either<Failure, bool>> putFragments(Fragment fragment) async {
    int idFragment =
        _inductiveLocalDataSource.putFragment(fragment.toLocalFragment());
    FragmentLocal? newFragment =
        _inductiveLocalDataSource.getFragmentById(idFragment);
    if (newFragment == null) {
      return left(ServerError());
    }
    List<int> idVerses = _inductiveLocalDataSource.putVerse(fragment.text
        .map((e) =>
            e.copyWith(fragment: newFragment.toFragment()).toLocalVerse())
        .toList());

    final input = await rootBundle.loadString(TranslateBible.rst.path);
    final json = jsonDecode(input);
    int bookId = fragment.text.first.bookId;

    for (int i = 0; i < idVerses.length; i++) {
      Verse verse = fragment.text[i];

      final resultVerses = ((json['books'] as List)[bookId - 1]['chapters']
          [verse.chapterId - 1]['verses'] as List);

      final resultWords = resultVerses[verse.number - 1]['text'] as String;
      _inductiveLocalDataSource.putWords(
        resultWords.split(' ').map((e) {
          WordLocal word = WordLocal(value: e);
          word.fragment.target = newFragment;
          word.verse.target = verse.copyWith(id: idVerses[i]).toLocalVerse();
          return word;
        }).toList(),
      );
    }
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
