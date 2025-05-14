import 'package:data/data.dart';
import 'package:data/objectbox.g.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AppDatabase {
  AppDatabase(this.store);

  final Store store;

  ///Folder
  int putFolder(FolderLocal folder) {
    return store.box<FolderLocal>().put(folder);
  }

  FolderLocal? getFolderById(int id) {
    return store.box<FolderLocal>().get(id);
  }

  Stream<List<FolderLocal>> getFolders() {
    final builder = store.box<FolderLocal>().query();
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  ///Fragment
  int putFragment(FragmentLocal fragment) {
    return store.box<FragmentLocal>().put(fragment);
  }

  FragmentLocal? getFragmentById(int id) {
    return store.box<FragmentLocal>().get(id);
  }

  Stream<List<FragmentLocal>> getFragment(int folderId) {
    final builder = store
        .box<FragmentLocal>()
        .query(FragmentLocal_.folder.equals(folderId));
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  ///Verse
  List<int> putVerses(List<VerseLocal> verses) {
    return store.box<VerseLocal>().putMany(verses);
  }

  int putVerse(VerseLocal verse) {
    return store.box<VerseLocal>().put(verse);
  }

  VerseLocal? getVerseById(int id) {
    return store.box<VerseLocal>().get(id);
  }

  Stream<List<VerseLocal>> getVerse(int fragmentId) {
    final builder =
        store.box<VerseLocal>().query(VerseLocal_.fragment.equals(fragmentId));
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  ///Word
  int putWord(WordLocal word) {
    return store.box<WordLocal>().put(word);
  }

  List<int> putWords(List<WordLocal> words) {
    return store.box<WordLocal>().putMany(words);
  }

  int deleteWords(List<WordLocal> words) {
    return store.box<WordLocal>().removeMany(words.map((e) => e.id).toList());
  }

  Stream<List<WordLocal>> watchWordsForFragment(int fragmentId) {
    final box = store.box<WordLocal>();

    return box
        .query(WordLocal_.fragment.equals(fragmentId))
        .order(WordLocal_.order)
        .watch(triggerImmediately: true)
        .map((query) => query.find());
  }

  ///WordStyle
  int putWordStyle(WordStyleLocal word) {
    return store.box<WordStyleLocal>().put(word);
  }

  List<int> putWordStyles(List<WordStyleLocal> words) {
    return store.box<WordStyleLocal>().putMany(words);
  }

  Stream<List<WordStyleLocal>> watchWordsStyle() {
    final box = store.box<WordStyleLocal>();

    return box
        .query()
        .order(WordStyleLocal_.order)
        .watch(triggerImmediately: true)
        .map((query) => query.find());
  }

  bool deleteWordStyle(WordStyleLocal word) {
    return store.box<WordStyleLocal>().remove(word.id);
  }
}
