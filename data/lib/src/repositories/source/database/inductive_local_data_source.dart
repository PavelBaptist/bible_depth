import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class InductiveLocalDataSource {
  InductiveLocalDataSource(this._appDatabase);

  final AppDatabase _appDatabase;

  //Folders
  Stream<List<FolderLocal>> fetchAllFolders() => _appDatabase.getFolders();
  int putFolder(FolderLocal folder) => _appDatabase.putFolder(folder);
  FolderLocal? getFolderById(int id) => _appDatabase.getFolderById(id);

  //Fragment
  Stream<List<FragmentLocal>> fetchFragments(int folderId) =>
      _appDatabase.getFragment(folderId);
  int putFragment(FragmentLocal fragment) => _appDatabase.putFragment(fragment);
  FragmentLocal? getFragmentById(int id) => _appDatabase.getFragmentById(id);

  //Verse
  Stream<List<VerseLocal>> fetchVerses(int fragmentId) =>
      _appDatabase.getVerse(fragmentId);
  List<int> putVerse(List<VerseLocal> verses) => _appDatabase.putVerse(verses);
  VerseLocal? getVerseById(int id) => _appDatabase.getVerseById(id);

  //Word
  Stream<List<WordLocal>> fetchAllWords() => _appDatabase.getWords();
  int putWord(WordLocal word) => _appDatabase.putWord(word);
}
