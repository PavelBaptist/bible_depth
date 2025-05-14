import 'package:data/data.dart';
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
  List<int> putVerse(List<VerseLocal> verses) => _appDatabase.putVerses(verses);
  VerseLocal? getVerseById(int id) => _appDatabase.getVerseById(id);

  //Word
  Stream<List<WordLocal>> fetchAllWords(int fragmentId) =>
      _appDatabase.watchWordsForFragment(fragmentId);
  int putWord(WordLocal word) => _appDatabase.putWord(word);
  List<int> putWords(List<WordLocal> words) => _appDatabase.putWords(words);

  //WordStyle
  Stream<List<WordStyleLocal>> fetchAllWordsStyle() =>
      _appDatabase.watchWordsStyle();
  int putWordStyle(WordStyleLocal word) => _appDatabase.putWordStyle(word);
  List<int> putWordStyles(List<WordStyleLocal> words) =>
      _appDatabase.putWordStyles(words);
  bool deleteWordStyle(WordStyleLocal word) =>
      _appDatabase.deleteWordStyle(word);
}
